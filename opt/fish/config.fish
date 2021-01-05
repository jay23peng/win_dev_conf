
# set -g -x DOCKER_HOST tcp://dockervm.local:2375
set -g -x DOCKER_HOST tcp://localhost:2375
set -g -x FZF_DEFAULT_COMMAND 'fd -a -j 4'
set -g -x FZF_DEFAULT_OPTS '--bind=tab:up,btab:down,ctrl-u:page-up,ctrl-d:page-down'
set -g -x EDITOR '/Users/jesse.peng/u/dex/config/mac/bin/em'

# https://emacs.stackexchange.com/questions/50485/copy-or-paste-between-terminal-emacs-26-and-mac-apps
# set -x LC_ALL "en_US.UTF-8"

# bobthefish
# set -g theme_display_vagrant yes
# set -g theme_display_k8s_context yes
# set -g theme_display_k8s_namespace yes
# set -g theme_title_display_path yes
# set -g theme_title_use_abbreviated_path no 
set -g theme_newline_cursor yes
set -g theme_newline_prompt '➜ '
set -g fish_prompt_pwd_dir_length 0

# vi key binding
fish_vi_key_bindings
bind -M insert \cl forward-char
bind -M insert \c\[ "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end"

# alias
alias ls="exa"
alias nvm="fnm"

