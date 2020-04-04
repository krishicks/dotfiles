function __gpg_agent_is_started -d "check if gpg agent is already started"
        pgrep gpg-agent >/dev/null 2>/dev/null
        return $status
end

function fish_gpg_agent
        if not __gpg_agent_is_started
                gpgconf --launch gpg-agent
        end
end