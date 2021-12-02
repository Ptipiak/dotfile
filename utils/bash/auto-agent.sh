if [ -r ~/.ssh/ssh-agent ]; then
	echo "agent exist"
	eval "$(<~/.ssh/ssh-agent)"
else
	echo "agent does not exist"
	ssh-agent > ~/.ssh/ssh-agent
	eval "$(<~/.ssh/ssh-agent)"
fi
ssh-add
