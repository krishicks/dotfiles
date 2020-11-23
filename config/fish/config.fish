set fish_greeting ""

# Start a new ssh-agent, or if already started, add ssh-agent config to env for
# new shell. See ./functions/
#fish_ssh_agent
fish_gpg_agent

function is_command
        command -v $argv >/dev/null
end

# git
set -x GIT_EDITOR vim
set -x EDITOR $GIT_EDITOR

if test -d /usr/local/go/bin
        set -x PATH /usr/local/go/bin $PATH
end

if test -d $HOME/bin
        set -x PATH $HOME/bin $PATH
end

if is_command go
        set -x GOPATH ~/go
        set -x PATH $GOPATH/bin $PATH
        set -x GOPRIVATE github.com/hashicorp
end

is_command rust; and set -x PATH ~/.cargo/bin $PATH

is_command git; and set -x GIT_EDITOR vim

if is_command rbenv
        set -x PATH $HOME/.rbenv/bin $PATH
        if status --is-interactive
                source (rbenv init -|psub)
        end
end

is_command fzf; and set -x FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!{.git,go/pkg}/*" 2> /dev/null'

is_command direnv; and eval (direnv hook fish)

if is_command npm
        set -x PATH $HOME/.node_modules/bin $PATH
        set -x npm_config_prefix $HOME/.node_modules
end

if test -d $HOME/workspace/git/github.com/hashicorp/cloud-monorepo/cloud-makefiles/bin
  set -x PATH $HOME/workspace/git/github.com/hashicorp/cloud-monorepo/cloud-makefiles/bin $PATH
end

set -x DOCKER "docker"

set fish_function_path $fish_function_path $HOME/.config/fish/plugin-foreign-env/functions

# nix
# Set up the per-user profile.
# This part should be kept in sync with nixpkgs:nixos/modules/programs/shell.nix
#
# Append ~/.nix-defexpr/channels to $NIX_PATH so that <nixpkgs>
# paths work when the user has fetched the Nixpkgs channel.
set -x NIX_PATH $NIX_PATH $HOME/.nix-defexpr/channels

# Set up environment.
# This part should be kept in sync with nixpkgs:nixos/modules/programs/environment.nix
set -x NIX_PROFILES /nix/var/nix/profiles/default $HOME/.nix-profile

# Set $NIX_SSL_CERT_FILE so that Nixpkgs applications like curl work.
if test -e /etc/ssl/certs/ca-certificates.crt;
  set -x NIX_SSL_CERT_FILE /etc/ssl/certs/ca-certificates.crt
end

set -x PATH $HOME/.nix-profile/bin $PATH
