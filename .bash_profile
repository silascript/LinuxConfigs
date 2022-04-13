


# nodejs
#export NODE_HOME=/opt/NodeJS/node-v14
# export NODE_HOME=/opt/NodeJS/node-v16
# export NODE_PATH=~/nodejs/node_global/bin:$NODE_HOME/bin
# export PATH=$PATH:$NODE_PATH

source ~/.profile


# golang
export PATH=$PATH:/opt/golang/bin
export PATH=$PATH:$(go env GOPATH)/bin

# MySQL
# export PATH=$PATH:/usr/local/mysql-5.7/bin
# export PATH=$PATH:/opt/mysql_5.7/bin

# go
# export GO111MODULE=off
# export GO111MODULE=on
# export GO111MODULE=auto
# export GOPROXY=https://mirrors.aliyun.com/goproxy/
# export GOPROXY=https://goproxy.io

# ruby
export PATH=$PATH:$HOME/.gem/ruby/2.7.0/bin


# vscode 
export PATH=$PATH:/opt/VSCode/


# sdkman
export SDKMAN_DIR="/home/silascript/.sdkman"
[[ -s "/home/silascript/.sdkman/bin/sdkman-init.sh" ]] && source "/home/silascript/.sdkman/bin/sdkman-init.sh"


# rust
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup

export CARGO_HOME="$PATH:$HOME/.cargo/"
export RUSTBINPATH="$PATH:$CARGO_HOME/bin"
#export PATH="$PATH:$HOME/.rvm/bin"
#  
 [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
 source "$HOME/.cargo/env"

#export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/library"


# conda
#[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
export PATH=$PATH:/opt/miniconda3/bin

# komodo edit
export PATH=$PATH:/opt/KomodoEdit/bin


