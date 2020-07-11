function __gpg_agent_is_started -d "check if gpg agent is already started"
   # the agent was started in another shell
   if test -f $GPG_ENV
      source $GPG_ENV
   end

   # GPG_ENV didn't include SSH_AUTH_SOCK?
   if test -z "$SSH_AUTH_SOCK"
      return 1
   end

   pgrep gpg-agent >/dev/null
   return $status
end


function __gpg_agent_start -d "start a new gpg agent"
   set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
   gpgconf --launch gpg-agent
   echo "set -x SSH_AUTH_SOCK $SSH_AUTH_SOCK" >> $GPG_ENV
end


function fish_gpg_agent --description "Start gpg-agent if not started yet, or uses already started gpg-agent." -a force
   if test -z "$GPG_ENV"
      set -g GPG_ENV $HOME/.gnupg/environment
   end

   if not __gpg_agent_is_started
      __gpg_agent_start
   end
end
