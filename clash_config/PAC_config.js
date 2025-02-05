function FindProxyForURL(url, host) {


  const directList = [
      "www.baidu.com",
      "www.bilibili.com",
      "www.163.com",
      "www.jd.com",
      "www.taobao.com",
      "www.ixigua.com",
      "www.msn.cn",
      "www.bing.com",
      "www2.bing.com",
      "cn.bing.com",
      "tv.cctv.com",
      "www.dangdang.com",
      "www.zol.com.cn",
      "www.miguvideo.com",
      "www.smzdm.com",
      "www.zdic.net",
      "mirrors.tuna.tsinghua.edu.cn",
      "www.shuge.org",
      "www.tmp.link",
      "www.lingshulian.com",
      "www.deepseek.com",
      "linux.do",
      // "update.code.visualstudio.com"
      
      //"10.11.12.13",
    
    ];
    
    if (directList.includes(host)) {
    
      return "DIRECT";
    
    }


  return "PROXY 127.0.0.1:%mixed-port%; SOCKS5 127.0.0.1:%mixed-port%; DIRECT;";
}
