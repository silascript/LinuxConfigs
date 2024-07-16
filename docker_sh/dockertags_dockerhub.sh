# -------------------------------------------------------------------------------------------
#										docker 查询
# 查询 Docker Hub 官方镜像
# https://registry.hub.docker.com/v2/namespaces/library/repositories/repo名称/tags/?page=页码&page_size=每页数量
# Docker Hub 官方镜像的namaspace 是 library
# Docker Hub 官方镜像的repository 即镜像名称，是https://github.com/docker-library/docs中查询，那些目录名就是repo名称，即镜像名
# 以mysql为例：https://registry.hub.docker.com/v2/namespaces/library/repositories/mysql/tags/?page=6&page_size=50
# -------------------------------------------------------------------------------------------

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

		local tags=$(curl -s https://registry.hub.docker.com/v2/namespaces/library/repositories/${image}/tags/{tagstr} | jq --arg tstr $tagstr -r '.results[]| select(contains($tstr))')
	else
		# 查询所有数据
		local tags=$(curl -s https://registry.hub.docker.com/v2/namespaces/library/repositories/${image}/tags/ | jq -r '.results[].images| select(.content_type=image)')
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

	local nextValue=$(curl -s "$urlStr" | jq -r '.next')

	# 返回next值
	echo $nextValue

}

# 获取该镜像所有的Tag数量
function getTagsCount() {

	# 查询url
	local urlStr=$1

	local tagCount=$(curl -s "$urlStr" | jq -r '.count')

	# 返回tag数
	echo $tagCount

}

# 根据 repository的名称查询所有Tag
# 可以自定义每页tag数量
# C表示 count 或 custom
# 俩参数：1. repository 名称，即镜像名 2. 单页显示的tag数
function queryAllTagsByRepoNameC() {

	# repostory 名称
	# 其实就是镜像的名称
	local repoName=$1

	# 单页数量
	local pageSize=$2

	# 无参数的查询url
	local urlStr="https://registry.hub.docker.com/v2/namespaces/library/repositories/${repoName}/tags/"

	# 获取tag的总数
	# local tagsCount=$(curl -s "$urlStr" | jq -r '.count')

	# 第一页url，带上每页数量参数
	local firstPageUrl="${urlStr}?page_size=${pageSize}"

	echo $firstPageUrl

	# 当前页的Tag
	local currentPageTags=$(curl -s "$firstPageUrl" | jq -r '.results[].name')

	# 将当前页面获取到的Tag添加进所有Tag数组
	local allTags=$currentPageTags

	# 获取 next 值
	local nextV=$(getNextValue $firstPageUrl)

	# echo $nextV

	# 遍历获取下一页的Tag
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

# 根据 repostory 的名称查询所有的Tag
function queryAllTagsByRepoName() {

	# repostory 名称
	# 其实就是镜像的名称
	local repoName=$1

	# 当前页的Tag
	local currentPageTags=$(curl -s "https://registry.hub.docker.com/v2/namespaces/library/repositories/${repoName}/tags/" | jq -r '.results[].name')

	# 将当前页面获取到的Tag添加进所有Tag数组
	local allTags=$currentPageTags

	# 获取 next 值
	local nextV=$(getNextValue "https://registry.hub.docker.com/v2/namespaces/library/repositories/${repoName}/tags/")

	# echo $nextV

	# 当前页面Tag
	# echo $currentPageTags
	# echo ${currentPageTags[@]}
	# next值
	# echo $nextV

	# 遍历获取下一页的Tag
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
	local tags=$(curl -s $urlStr | jq -r '.results[].name')

	echo $tags
}

# ------------------------------测试------------------------------

# docker_queryimagetag_dockerhub $1

# 测试获取每一页的Tag
# queryTagsByRepoNameOnePage "https://registry.hub.docker.com/v2/namespaces/library/repositories/mysql/tags/?page=2&page_size=10"

# 测试获取next值
# getNextValue "https://registry.hub.docker.com/v2/namespaces/library/repositories/mysql/tags/?page=25&page_size=10"
# t_nextv=$(getNextValue "https://registry.hub.docker.com/v2/namespaces/library/repositories/mysql/tags/?page=25&page_size=10")
# t_nextv=$(getNextValue "https://registry.hub.docker.com/v2/namespaces/library/repositories/mysql/tags/?page=26&page_size=10")

# echo $t_nextv

# if [[ $t_nextv == "null" ]]; then
#
# 	echo "为null值"
# else
# 	echo $t_nextv
# fi

# 测试根据repostory名称获取所有Tag函数
# queryAllTagsByRepoName mysql
# queryAllTagsByRepoName python

# 测试 queryAllTagsByRepoNameC 函数
queryAllTagsByRepoNameC mysql 100
