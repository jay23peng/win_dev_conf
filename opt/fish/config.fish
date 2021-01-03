
# set -g -x DOCKER_HOST tcp://dockervm.local:2375
set -g -x DOCKER_HOST tcp://localhost:2375
set -g -x FZF_DEFAULT_COMMAND 'fd -a -j 4'
set -g -x FZF_DEFAULT_OPTS '--bind=tab:up,btab:down,ctrl-u:page-up,ctrl-d:page-down'
set -g -x EDITOR '/Users/jesse.peng/u/dex/config/mac/bin/em'

# https://emacs.stackexchange.com/questions/50485/copy-or-paste-between-terminal-emacs-26-and-mac-apps
# set -x LC_ALL "en_US.UTF-8"

alias ls="exa"
alias nvm="fnm"

