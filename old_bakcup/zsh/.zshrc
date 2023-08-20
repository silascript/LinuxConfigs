# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  # source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi


# alias ll='ls -alF'
alias ll='ls -al'
alias vi='vim'

# 使用lsd代替ls命令
# alias ls='lsd'

eval $(thefuck --alias)


# zstyle ':completion:*' menu yes select search

# 忽略大小写
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'


# ----------------------------------------------
#					zinit
# ----------------------------------------------

# export ZINIT_HOME="$HOME/.zinit/bin/"

# source "$ZINIT_HOME/zinit.zsh"

source ~/.zinit/bin/zinit.zsh



# highlighting
zinit ice lucid wait='0' atinit='zpcompinit'
# zinit ice lucid wait='0' atinit"zicompinit; zicdreplay"


# 输入历史搜索
zinit load zdharma-continuum/history-search-multi-word


# 补全
# zinit ice lucid wait='0'
# zinit light zsh-users/zsh-completions


# fzf-tab
# 可代替zsh-completions
# 可显示候选菜单
zinit light Aloxaf/fzf-tab


# autosuggestions
# zinit ice lucid wait="0" atload='_zsh_autosuggest_start'
zinit ice lucid wait="0" 
zinit light zsh-users/zsh-autosuggestions

# 语法高亮
zinit light zdharma-continuum/fast-syntax-highlighting


# 快速目录跳转
#  配合fzf-tab 实现补全菜单
# zinit ice lucid wait='1'
# zinit light skywind3000/z.lua



# 交互式CD
# zinit light changyuheng/zsh-interactive-cd

# 给man着色
zinit light ael-code/zsh-colored-man-pages


# git相关
zinit light paulirish/git-open




# 实时补全插件
# zinit light 'https://github.com/marlonrichert/zsh-autocomplete'





# -----------------------------------------
#				其他框架插件
# -----------------------------------------
# 加载oh-my-zsh 插件
# git lib
zinit snippet OMZL::git.zsh
# oh-my-zsh 补全插件 忽略大小写、高亮候选项
zinit snippet OMZ::lib/completion.zsh
# 压缩解压相关插件
# zinit snippet OMZ::plugins/extract


# 跟theme与样式相关
# 必须加载，不然OMZ的theme不生效
zinit snippet OMZ::lib/theme-and-appearance.zsh

# OMZ plugins
# zinit snippet OMZL::virtualenv

# -----------------------------------------
#					Themes
# -----------------------------------------

# p10k
# zinit ice depth=1; 
# zinit light romkatv/powerlevel10k

# pure
# zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
# zinit light sindresorhus/pure



# -------------------------------------------
#				OMG Theme
# -------------------------------------------
# zinit snippet OMZT::ys
# zinit snippet OMZT::muse
# zinit snippet OMZT::robbyrussell
# zinit snippet OMZT::steeef
# zinit snippet OMZT::af-magic


# OMG EXtern Themes
# zinit light jackharrisonsherlock/common

# zinit light joshjon/bliss-zsh

# zinit light LasaleFamine/phi-zsh-theme

zinit light sfabrizio/ozono-zsh-theme

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
  # battery
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

# ---------------------------------------------------
#					插件配置
# ---------------------------------------------------

# history 插件配置
# zstyle :plugin:history-search-multi-word reset-prompt-protect 1
# 高亮颜色
zstyle ":history-search-multi-word" highlight-color "fg=yellow,bold"
# standout, bold, bg=blue
zstyle ":plugin:history-search-multi-word" active "bg=blue"


# zsh-comletions
# 激活补全功能
# autoload -Uz compinit
# compinit


# fzf-tab配置
# zstyle ':completion:complete:*:options' sort false


# fzf-tab 预览设置(右侧显示候选项所在目录或文件内容)
# 使用lsd 为预览目录着色(系统先预装lsd)
# zstyle ':fzf-tab:complete:cd:*' fzf-preview '[ -f "$realpath" ] && bat --color=always $realpath'

# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd -l --blocks name,permission,size,date --color=always --icon=always $realpath'

# 使用 exa 预览
zstyle ':fzf-tab:complete:(cd|ll|ls|exa):*' fzf-preview 'exa -a1 --color=always $realpath'

# zstyle ':fzf-tab:complete:(ll|ls|exa):*' fzf-preview 'exa -1 --color=always $realpath'

# zstyle ':fzf-tab:complete:(cd|exa|ls|ll):*' fzf-preview '[ -f "$realpath" ] && bat --theme=gruvbox-dark --color=always || exa -1 --color=always'

# zstyle ':fzf-tab:complete:(cd|exa|ls|ll):*' fzf-preview 'exa -1 --color=always && bat --theme=gruvbox-dark --color=always '


# -------------------------------------
#			其他配置
# -------------------------------------

# 使用lsd代替ls命令
# alias ls='lsd'

# 使用exa代替ls命令
alias ls='exa --icons'


# source .profile
source ~/docker_sh/docker_info.sh
# source ~/.bash_profile

# sdkman
[[ -s "/home/silascript/.sdkman/bin/sdkman-init.sh" ]] && source "/home/silascript/.sdkman/bin/sdkman-init.sh"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# [[ -s "/home/silascript/.sdkman/bin/sdkman-init.sh" ]] && source "/home/silascript/.sdkman/bin/sdkman-init.sh"

