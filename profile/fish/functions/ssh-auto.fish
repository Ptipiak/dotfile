function ssh-auto --argument cmd
    ssh-add -l &>/dev/null
    set -l isLoaded test $status -eq 2
    if $isLoaded && not test -e ~/.ssh/ssh-agent
      _create_agent ~/.ssh/ssh-agent
    end

    if $isLoaded
      _load_agent ~/.ssh/ssh-agent
    end
end

function _create_agent -a target
    echo "Agent file created"
    umask 066 -p | ssh-agent -c > $target
    chmod 700 $target
    trap "exit 1" EXIT
end


function _load_agent -a target
    source $target &>/dev/null
    trap "exit 1" EXIT
end
  
function _add_credential -a cred
    test -e $cred
    ssh-add "$cred"
    trap "exit 1" EXIT
end
