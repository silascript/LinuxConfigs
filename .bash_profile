
source ~/.profile


# . "$HOME/.cargo/env"


# NetworkMode

# 查询 Docker 容器 ip 占用情况

# 查询 IPv4Address 主要用于 自定义网桥下容器 IP的查询
# function docker_ipv4_allcontainers(){
	# docker inspect -f '{{.Name}}: {{range .NetworkSettings.Networks}}{{.IPAMConfig.IPv4Address}}{{end}}' $(docker ps -aq)
# }

# 查询 Docker 所有容器已指派的端口号
# function docker_ports_allcontainers(){
	# docker inspect --format='{{.Name}}: {{range $conf := .HostConfig.PortBindings}}{{(index $conf 0).HostPort}} {{end}}' $(docker ps -aq)
# }

source ./docker_info.sh







