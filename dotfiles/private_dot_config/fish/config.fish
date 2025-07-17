function third_party
  pyenv init - | source
  zoxide init fish | source
  fnm env --use-on-cd | source
end

if status is-interactive
  # set -U $fish_greeting
  third_party
  alias l "ls -altr -h"
  source ~/.config/fish/functions/greeting.fish
end
