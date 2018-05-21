set fish_greeting ""

set -x PATH /usr/local/go/bin $PATH
set -x GOPATH ~/go
set -x PATH $GOPATH/bin $PATH
set -x PATH ~/.cargo/bin $PATH
set -x JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-amd64

set -x MINIKUBE_WANTUPDATENOTIFICATION false
set -x MINIKUBE_WANTREPORTERRORPROMPT false
set -x MINIKUBE_HOME $HOME
set -x CHANGE_MINIKUBE_NONE_USER true
set -x KUBECONFIG $HOME/.kube/config

set -x PATH $HOME/.rbenv/bin $PATH

set -x FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!{.git,go/pkg}/*" 2> /dev/null'

eval (direnv hook fish)
status --is-interactive; and source (rbenv init -|psub)
