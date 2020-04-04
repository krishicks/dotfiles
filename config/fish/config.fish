set fish_greeting ""

# go
set -x PATH $HOME/go/bin $PATH

# git
set -x GIT_EDITOR vim

# fzf
set -x FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!{.git,go/pkg}/*" 2> /dev/null'


