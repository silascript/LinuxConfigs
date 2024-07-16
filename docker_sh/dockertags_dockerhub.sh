# docker 查询
# 查询 Docker Hub 官方镜像
# 调用这函数可以传一个参数也可以传两个参数
# 第一个参数是要查询image的字符串
# 第二个参数是tag包含的字符串，可以过滤tag数据，属于可选参数
function docker_queryimagetag_dockerhub() {

	if [[ $# -eq 0 ]]; then
		echo -e "\e[93m必须输入一个要查询的字符串! \n \e[0m"
		return
	fi

	# image 名称
	# local image="$1"
	local image=$1

	# tag模糊查询字符串
	# local tagstr="$2"
	local tagstr=$2

	# 查询到的tag值
	# https://registry.hub.docker.com/v2/namespaces/{namespace}/repositories/{repostory}/tags/{tag}
	# Docker Hub 官方的namespace 是 library
	# Docker Hub repostory 可以到https://github.com/docker-library/docs 查询，其实就是目录名
	# 返回一个json格式：其中有个 tags 数组
	# 使用 jq 工具来取数据

	# echo $image
	# echo "https://registry.hub.docker.com/v2/namespaces/library/repositories/$image/tags/"

	# 判断是参数是否大于2
	# 第2个参数是tag查询的字符串
	if [[ $# -gt 1 ]]; then

		local tags=$(curl https://registry.hub.docker.com/v2/namespaces/library/repositories/${image}/tags/{tagstr} | jq --arg tstr $tagstr -r '.results[]| select(contains($tstr))')
	else
		# 查询所有数据
		local tags=$(curl https://registry.hub.docker.com/v2/namespaces/library/repositories/${image}/tags/ | jq -r '.results[].images| select(.content_type=image)')
		# local tags=$(curl https://registry.hub.docker.com/v2/namespaces/library/repositories/${image}/tags/)
	fi

	# if [ -n "$2" ]; then
	# tags=$(echo "${tags}" | grep "$2")
	# fi

	# 显示
	# echo "${tags}" | less
	echo "${tags}"

}

# 获取next值
function getNextValue() {

	# 查询的url
	local urlStr=$1

	local nextValue=$(curl $urlStr | jq -r '.next')

	# 返回next值
	echo $nextValue

}

# 根据 repostory 的名称查询所有的Tag
function queryAllTagsByRepoName() {

	# repostory 名称
	# 其实就是镜像的名称
	local repoName=$1

	# 当前页的Tag
	local currentPageTags=$(curl https://registry.hub.docker.com/v2/namespaces/library/repositories/${repoName}/tags/ | jq -r '.results[].name')

	# 将当前页面获取到的Tag添加进所有Tag数组
	local allTags=$currentPageTags

	# 获取 next 值
	local nextV=$(getNextValue https://registry.hub.docker.com/v2/namespaces/library/repositories/${repoName}/tags/)

	echo $nextV

	# 当前页面Tag
	# echo $currentPageTags
	echo ${currentPageTags[@]}
	# next值
	# echo $nextV

	while [[ $nextV != "null" ]]; do
		
		# 当前url
		local current_url=$nextV

		echo $current_url

		# 获取下一页Tag
		local nextTags=$(queryTagsByRepoNameOnePage $current_url)

		# 追加Tag元素进数组
		allTags+=(${nextTags[@]})

		# 获取下一页中的next值
		nextV=$(getNextValue $current_url)

	done

	# 返回Tag数组
	echo ${allTags[@]}
}

# 根据 repostory 名称查询Tag 显示一页的Tag
function queryTagsByRepoNameOnePage() {

	# 查询url
	# 如 https://registry.hub.docker.com/v2/namespaces/library/repositories/mysql/tags/?page=2&page_size=10
	local urlStr=$1

	# local tags=$(curl $urlStr | jq -r '.results[].images| select(.content_type=image)')
	local tags=$(curl $urlStr | jq -r '.results[].name')

	echo $tags
}

# ------------------------------测试------------------------------

# docker_queryimagetag_dockerhub $1

# 测试获取每一页的Tag
# queryTagsByRepoNameOnePage https://registry.hub.docker.com/v2/namespaces/library/repositories/mysql/tags/?page=2 & page_size=10

# 测试获取next值
# getNextValue https://registry.hub.docker.com/v2/namespaces/library/repositories/mysql/tags/?page=25 & page_size=10
# t_nextv=$(getNextValue https://registry.hub.docker.com/v2/namespaces/library/repositories/mysql/tags/?page=25 & page_size=10)
# t_nextv=$(getNextValue https://registry.hub.docker.com/v2/namespaces/library/repositories/mysql/tags/?page=26 & page_size=10)

# echo $t_nextv

# if [[ $t_nextv == "null" ]]; then
#
# 	echo "为null值"
# else
# 	echo $t_nextv
# fi

# 测试根据repostory名称获取所有Tag函数
queryAllTagsByRepoName mysql
