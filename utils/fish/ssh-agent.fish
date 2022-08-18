function ssh-agent --argument cmd
    set -l default_cred ~/.ssh/ptipiak/ptipiak

    ssh-add -l &>/dev/null
    if test $status -eq 2 && if !test -e ~/.ssh/ssh-agent
      _load_agent ~/.ssh/ssh-agent
    end

    ssh-add -l &>/dev/null
    if test $status -eq 2
      _create_agent
      _add_credential $default_cred
    end
end

function _create_agent
    umask 066 -p | ssh-agent -c > ~/.ssh/ssh-agent
    eval ~/.ssh/ssh-agent &> /dev/null
    trap "exit 1" EXIT
end


function _load_agent --argument-names path
    eval $path &>/dev/null
    trap "exit 1" EXIT
end
  
function _add_credential --argument-names cred
    test -e $cred
    ssh-add "$cred"
    trap "exit 1" EXIT
end
end
