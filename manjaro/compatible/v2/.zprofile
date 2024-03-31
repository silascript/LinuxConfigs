

# 导入环境变量配置
# if [[ $XDG_SESSION_TYPE == "wayland" ]] && [[ -f $HOME/.local_sh_profile ]];then
if [[ -f $HOME/.local_sh_profile ]];then

	source $HOME/.local_sh_profile
fi

