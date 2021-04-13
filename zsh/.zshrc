# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  # source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi


alias ll='ls -alF'
alias vi='vim'
alias ls='lsd'

eval $(thefuck --alias)


# zstyle ':completion:*' menu yes select search

# 忽略大小写
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'


# ----------------------------------------------
#					zinit
# ----------------------------------------------
source ~/.zinit/bin/zinit.zsh



# highlighting
zinit ice lucid wait='0' atinit='zpcompinit'
# zinit ice lucid wait='0' atinit"zicompinit; zicdreplay"
zinit light zdharma/fast-syntax-highlighting


# 输入历史搜索
zinit load zdharma/history-search-multi-word

# autosuggestions
# zinit ice lucid wait="0" atload='_zsh_autosuggest_start'
zinit ice lucid wait="0" 
zinit light zsh-users/zsh-autosuggestions

# 补全
# zinit ice lucid wait='0'
# zinit light zsh-users/zsh-completions


# fzf-tab
# 可代替zsh-completions
# 可显示候选菜单
zinit light Aloxaf/fzf-tab


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

# 跟theme与样式相关
# 必须加载，不然OMZ的theme不生效
zinit snippet OMZ::lib/theme-and-appearance.zsh

# -----------------------------------------
#					Themes
# -----------------------------------------

# p10k
# zinit ice depth=1; 
# zinit light romkatv/powerlevel10k

# pure
# zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
# zinit light sindresorhus/pure


# zeta-zsh-theme 
# zinit light skylerlee/zeta-zsh-theme

# OMG Theme
 zinit snippet OMZT::ys
 # zinit snippet OMZT::muse

# ZSH_THEME="zeta"
 autoload -Uz promptinit && promptinit

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
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd -l --blocks name,permission,size,date --color=always --icon=always $realpath'
# 使用bat为预览文件内容着色(系统先预装bat)
zstyle ':fzf-tab:complete:ls:*' fzf-preview '[ -f "$realpath" ] && bat --color=always $realpath || lsd -l --blocks name,permission,size,date --color=always --icon=always $realpath'



# source .profile
source ~/.bash_profile


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
