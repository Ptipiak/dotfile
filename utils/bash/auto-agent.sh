ssh-add -l &>/dev/null
if [ $? = 2 ]; then
  # ssh agent exist
  [ -f ~/.ssh/ssh-agent ] && eval "$(<~/.ssh/ssh-agent)" &>/dev/null

  ssh-add -l &>/dev/null
  if [ $? = 2 ]; then
    # ssh agent doesn't exist
    (umask 066; ssh-agent > ~/.ssh/ssh-agent)
    eval "$(<~/.ssh/ssh-agent)" &> /dev/null
    ssh-add
  fi
fi
