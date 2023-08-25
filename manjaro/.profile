


# NodeJS
export NODE_HOME=/opt/NodeJS/node-v20
export NODE_PATH="$HOME/nodejs/node_global/bin"
export PATH=$PATH:$NODE_PATH:$NODE_HOME/bin

# ecletron
export ELECTRON_MIRROR=http://npm.taobao.org/mirrors/electron/


# golang
export GOROOT=/opt/golang
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$(go env GOPATH)/bin


# conda
#export PATH=$PATH:"$HOME/miniconda3/bin"
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/silascript/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/silascript/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/silascript/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/silascript/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# ruby
#
# chruby
#if [ -n "$BASH_VERSION" ] || [ -n "$ZSH_VERSION" ]; then
 # source /usr/share/chruby/chruby.sh
 # source /usr/share/chruby/auto.sh
#fi
#
#rbenv

if [ -n "$BASH_VERSION" ]; then
  eval "$(rbenv init - bash)"
elif [ -n "$ZSH_VERSION" ]; then
  eval "$(rbenv init - zsh)"
fi
# 设置ruby镜像源
#export RUBY_BUILD_MIRROR_URL=https://cache.ruby-china.com
# 设置下载工具
export RUBY_BUILD_HTTP_CLIENT=wget




# SDKMan
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Java
#export JAVA_HOME="$SDKMAN_DIR/candidates/java/current"




# Rust
. "$HOME/.cargo/env"
