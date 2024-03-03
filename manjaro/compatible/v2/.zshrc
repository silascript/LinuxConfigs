# Use powerline
# USE_POWERLINE="true"
# Source manjaro-zsh-configuration
# if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  # source /usr/share/zsh/manjaro-zsh-config
# fi
# # Use manjaro zsh prompt
# if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  # source /usr/share/zsh/manjaro-zsh-prompt
# fi

# --------------------------------------------------------------------- #

# alias ll="ls -alF"
alias ls='exa --icons'
# alias ll='exa -a --long --all --header --group --tree --level=2 --icons --time-style=long-iso'
alias ll='exa -a --long --all --header --group --icons --time-style=long-iso'
# 用于显示git目录的git状态
alias lg='exa -a --long --all --header --group --level=2 --icons --time-style=long-iso --git'
# alias ll='exa -a --long --header --group --level=2 --icons'

# --------------------------------------------------------------------- #


# --------------------------------------------------------------------- #
#								 zinit
# --------------------------------------------------------------------- #

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk



# --------------------------------------------------------------------- #



# --------------------------------------------------------------------- #
#                             其他框架插件
# --------------------------------------------------------------------- #

# 加载oh-my-zsh 插件
# git lib
zinit snippet OMZL::git.zsh
zinit snippet OMZ::plugins/git/git.plugin.zsh
# oh-my-zsh 补全插件 忽略大小写、高亮候选项
zinit snippet OMZ::lib/completion.zsh

# 跟theme与样式相关
# 必须加载，不然OMZ的theme不生效
zinit snippet OMZ::lib/theme-and-appearance.zsh

# zinit load 'zsh-users/zsh-history-substring-search'
# zinit ice wait atload='_history_substring_search_config'


# --------------------------------------------------------------------- #
#                             加载插件
# --------------------------------------------------------------------- #


# zinit ice lucid wait='0' atinit='marlonrichert/zsh-autocomplete'
# zinit ice lucid wait='0'
# zinit light marlonrichert/zsh-autocomplete

# fzf-tab
# 可代替zsh-completions
# 可显示候选菜单
zinit light Aloxaf/fzf-tab

# 语法高亮
zinit ice lucid wait='0' atinit='zpcompinit'
zinit light zdharma-continuum/fast-syntax-highlighting

# autosuggestions
# zinit ice lucid wait="0" atload='_zsh_autosuggest_start'
zinit ice lucid wait="0" 
zinit light zsh-users/zsh-autosuggestions

# 输入历史搜索
zinit load zdharma-continuum/history-search-multi-word

# 给man着色
zinit light ael-code/zsh-colored-man-pages

# git相关
zinit light paulirish/git-open

# vi-mod
# zinit ice depth=1
# zinit light jeffreytse/zsh-vi-mode

# 提供 conda的环境信息
# zinit light saravanabalagi/zsh-plugin-condaenv


# --------------------------------------------------------------------- #
#								OMG Theme
# --------------------------------------------------------------------- #

# zinit snippet OMZT::ys
# zinit snippet OMZT::muse
# zinit snippet OMZT::robbyrussell
# zinit snippet OMZT::steeef
# zinit snippet OMZT::af-magic

# --------------------------------------------------------------------- #
#								Themes
# --------------------------------------------------------------------- #

# zinit ice as"command" from"gh-r" \
		  # atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
		  # atpull"%atclone" src"init.zsh"
# zinit light starship/starship


# ys 修改 显示conda环境
zinit ice pick"myys.zsh-theme"
zinit light zhiweichen0012/myys.zsh-theme

# silver
# zinit light reujab/silver

# slimline
# zinit light mengelbrecht/slimline

# hapin
# zinit light hanamiyuna/hapin-zsh-theme

# modesty
# 可以显示 conda的环境信息
# 要配合安装插件：saravanabalagi/zsh-plugin-condaenv
# zinit light saravanabalagi/zsh-theme-modesty

# zinit light TooSchoolForCool/darksoku-zsh-theme

# ys改款
#zinit light oskarkrawczyk/honukai-iterm-zsh

# ys改款
# zinit light aprilnops/zsh-theme

# pure
# zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
# zinit light sindresorhus/pure

# roundy
# zinit light nullxception/roundy

# Icon definition for Command's Exit Status
# Note: If your custom symbol overlaps the background or didn't have enough width,
#       you can add space at the end of your defined symbol.
# ROUNDY_EXITSTATUS_GOOD="﫟"
# You can also using hex code like this
# ROUNDY_EXITSTATUS_BAD=$'\uf658 '

# Minimal time (in ms) for the Time Execution of Command is displayed in prompt
# Set to 0 to disable it
# ROUNDY_TEXC_MIN_MS=5

# Overriding username info
# ROUNDY_USER_CONTENT_NORMAL=" %n "
# ROUNDY_USER_CONTENT_ROOT=" %n "

# Working Directory Info Mode
# Valid choice are : "full", "short", or "dir-only"
# Example Output
#   full     : /etc/httpd/conf/extra
#   short    : /e/h/c/extra
#   dir-only : extra
# ROUNDY_DIR_MODE="dir-only"
# ROUNDY_DIR_MODE="full"

# Whether drawing a gap between a prompt
# ROUNDY_PROMPT_HAS_GAP=true


# common
# zinit light jackharrisonsherlock/common


# OMG EXtern Themes


# zinit light jackharrisonsherlock/common

# zinit light joshjon/bliss-zsh

# zinit light LasaleFamine/phi-zsh-theme

# zinit light sfabrizio/ozono-zsh-theme

# zinit light Daivasmara/daivasmara.zsh-theme

# zinit light skylerlee/zeta-zsh-theme

# zinit light ChesterYue/ohmyzsh-theme-passion




# alien theme
# zinit light eendroroy/alien 
# alien theme 设置
# export ALIEN_THEME="gruvbox"
# export ALIEN_SECTION_TIME_FORMAT=%H:%M:%S 
# export ALIEN_SECTIONS_LEFT=(
  # exit
  # user
  # path
  # vcs_branch:async
  # vcs_status:async
  # vcs_dirty:async
  # newline
  # ssh
  # venv
  # prompt
# )
# export ALIEN_SECTIONS_RIGHT=(
  # time
# )

# alien-minimal theme
# zinit light eendroroy/alien-minimal
# alien-minimal theme 设置
# export AM_VI_PROMPT_POS=left_start

# autoload -Uz promptinit && promptinit


# --------------------------------------------------------------------- #
#                              插件配置
# --------------------------------------------------------------------- #

# history 插件配置
# zstyle :plugin:history-search-multi-word reset-prompt-protect 1
# 选项数量
# zstyle ":history-search-multi-word" page-size "8"
# 高亮
zstyle ":history-search-multi-word" highlight-color "fg=yellow,bold"
# zstyle ":history-search-multi-word" highlight-color "fg=cyan,bold"
# active选项背影色
zstyle ":plugin:history-search-multi-word" active "bg=blue"
# active选项样式
# Effect on active history entry. Try: standout, bold, bg=blue (default underline)
# zstyle ":plugin:history-search-multi-word" active "underline"
# zstyle ":plugin:history-search-multi-word" active "standout,bold"


# autosuggestions 插件设置
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#f2c867,bg=#6b798e,bold,underline"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#f2c867 bg=none,bold,underline"



# fzf-tab 插件设置
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:*' popup-min-size 50 8
# 使用 exa 实现在右侧预览目录
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# zstyle ':fzf-tab:complete:cd:*' popup-pad 50 0



# --------------------------------------------------------------------- #
#                              其他zsh配置
# --------------------------------------------------------------------- #

# 手动设置忽略大小写敏感
# 开启oh-my-zsh内置的补全功能会得到相同效果
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'



# --------------------------------------------------------------------- #

# docker 相关脚本
# 查看docker IP及端口占用情况的脚本
if [[ -f $HOME/docker_sh/docker_info.sh ]];then
	
	source $HOME/docker_sh/docker_info.sh 
fi

# 使用163 docker hub镜像根据tag查询脚本
if [[ -f $HOME/docker_sh/dockertags_163.sh ]];then
	
	source $HOME/docker_sh/dockertags_163.sh 
fi


