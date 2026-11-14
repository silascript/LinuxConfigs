// Define main function (script entry)

// function main(config, profileName) {
//  return config;
// }

function main(config) {
  // 1. 确保 config.rules 存在
  config.rules = config.rules || [];

  // 2. 定义你要追加的前置规则（使用 unshift 插入到最前面，优先级最高）
  // 格式： ["规则类型,参数,策略组名称"]
  const customRules = [
    // 示例：某些特定域名强制直连
    //"DOMAIN-SUFFIX,example.cn,DIRECT",
    //"DOMAIN-KEYWORD,my-local-site,DIRECT",
    "DOMAIN-KEYWORD,langou123,DIRECT",
    "DOMAIN-KEYWORD,paragames233,DIRECT",
    "DOMAIN,wofun.me,DIRECT",
    "DOMAIN,jyut.net,DIRECT",


    // 如果使用外部 rule-providers（规则集），也可以在此处追加
    "RULE-SET,reject,REJECT",
    "RULE-SET,direct,DIRECT",
    "RULE-SET,cncidr,DIRECT",
    "RULE-SET,lancidr,DIRECT",
    "RULE-SET,private,DIRECT",
    "RULE-SET,applications,DIRECT",
    "RULE-SET,apple,DIRECT",
  ];

  // 3. 将自定义规则插入到现有规则的最前方
  // unshift 会按顺序从前往后插入
  for (let i = customRules.length - 1; i >= 0; i--) {
    config.rules.unshift(customRules[i]);
  }

  // 4. 如果需要引入外部 rule-providers（远程规则文件）
  // config["rule-providers"] = config["rule-providers"] || {};

  // 广告拦截
  config["rule-providers"]["reject"] = {
    type: "http",
    behavior: "domain",
    url: "https://cdn.jsdelivr.net/gh/Loyalsoldier/clash-rules@release/reject.txt",
    path: "./ruleset/reject.yaml",
    interval: 86400
  };

  config["rule-providers"]["direct"] = {
    type: "http",
    behavior: "domain",
    //url: "https://raw.githubusercontent.com/Loyalsoldier/clash-rules/release/direct.txt",
    url: "https://cdn.jsdelivr.net/gh/Loyalsoldier/clash-rules@release/direct.txt",
    path: "./ruleset/direct.yaml",
    interval: 86400
  };


  // 引入 Loyalsoldier 的国内 IP 和域名规则集作为补充（可选）
  config["rule-providers"]["cncidr"] = {
    type: "http",
    behavior: "ipcidr",
    url: "https://cdn.jsdelivr.net/gh/Loyalsoldier/clash-rules@release/cncidr.txt",
    path: "./ruleset/cnip.yaml",
    interval: 86400
  };

  config["rule-providers"]["lancidr"] = {

    type: "http",
    behavior: "ipcidr",
    url: "https://cdn.jsdelivr.net/gh/Loyalsoldier/clash-rules@release/lancidr.txt",
    path: "./ruleset/lancidr.yaml",
    interval: 86400

  };

  config["rule-providers"]["private"] = {
    type: "http",
    behavior: "domain",
    url: "https://cdn.jsdelivr.net/gh/Loyalsoldier/clash-rules@release/private.txt",
    path: "./ruleset/private.yaml",
    interval: 86400
  };


  config["rule-providers"]["applications"] = {
    type: "http",
    behavior: "classical",
    url: "https://cdn.jsdelivr.net/gh/Loyalsoldier/clash-rules@release/applications.txt",
    path: "./ruleset/applications.yaml",
    interval: 86400
  };

  config["rule-providers"]["apple"] = {
    type: "http",
    behavior: "domain",
    url: "https://cdn.jsdelivr.net/gh/Loyalsoldier/clash-rules@release/apple.txt",
    path: "./ruleset/apple.yaml",
    interval: 86400

  };

  return config;
}




