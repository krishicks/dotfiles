set fish_greeting ""

# go
set -x PATH /usr/local/go/bin $PATH
set -x GOPATH ~/go
set -x PATH $GOPATH/bin $PATH

# rust
set -x PATH ~/.cargo/bin $PATH


# git
set -x GIT_EDITOR vim

# rbenv
set -x PATH $HOME/.rbenv/bin $PATH

# fzf
set -x FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!{.git,go/pkg}/*" 2> /dev/null'

# direnv
eval (direnv hook fish)

# rbenv
status --is-interactive; and source (rbenv init -|psub)

