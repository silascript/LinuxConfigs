# docker 查询
function docker_queryimagetag() {

	if [[ $# -eq 0 ]]; then
		echo -e "\e[93m必须输入一个要查询的字符串! \n \e[0m"
		return
	fi

	# image 名称
	local image="$1"

	# tag模糊查询字符串
	local tagstr="$2"

	# 查询到的tag值
	# http://hub-mirror.c.163.com/v2/library/${image}/tags/list
	# 返回一个json格式：其中有个 tags 数组
	# 使用 jq 工具来取数据
	# 获取tags数组所有数据 去掉[]及双引号
	# curl http://hub-mirror.c.163.com/v2/library/${image}/tags/list | jq -r '.tags[]'
	# 对tag再进行模糊查询
	# curl http://hub-mirror.c.163.com/v2/library/${image}/tags/list | jq -r '.tags[]| select(contains(${tagstr}))'

	# local tags=$(curl http://hub-mirror.c.163.com/v2/library/${image}/tags/list | jq -r '.tags[]')


	# 判断是参数是否大于2
	# 第2个参数是tag查询的字符串
	if [[ $# -gt 1 ]];then

		local tags=$(curl http://hub-mirror.c.163.com/v2/library/${image}/tags/list | jq --arg tstr $tagstr -r '.tags[]| select(contains($tstr))')
	else
		# 查询所有数据
		local tags=$(curl http://hub-mirror.c.163.com/v2/library/${image}/tags/list | jq -r '.tags[]')
	fi

	# local tags=$(curl http://hub-mirror.c.163.com/v2/library/${image}/tags/list | sed -e 's/.*\[//g' -e 's/"//g' -e 's/\]\}$//g' -e 's/,/\n/g')

	# if [ -n "$2" ]; then
	# tags=$(echo "${tags}" | grep "$2")
	# fi

	# 显示
	echo "${tags}" | less

}
