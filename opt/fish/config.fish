# alias
alias ls="exa"
alias nvm="fnm"

# set -g -x DOCKER_HOST tcp://dockervm.local:2375
set -g -x DOCKER_HOST tcp://localhost:2375
set -g -x FZF_DEFAULT_COMMAND 'fd -a -j 4'
set -g -x FZF_DEFAULT_OPTS '--bind=tab:up,btab:down,ctrl-u:page-up,ctrl-d:page-down'
set -g -x EDITOR '/Users/jesse.peng/u/dex/config/mac/bin/em'

# https://emacs.stackexchange.com/questions/50485/copy-or-paste-between-terminal-emacs-26-and-mac-apps
# set -x LC_ALL "en_US.UTF-8"

# bobthefish
# set -g theme_use_abbreviated_branch_name yes
# set -g theme_display_k8s_context yes
# set -g theme_display_k8s_namespace yes
# set -g theme_display_vagrant yes

# enable new line mode by enable below and disable theme_use_abbreviated_branch_name. For now has issues with vi cursor
set -g fish_prompt_pwd_dir_length 0
set -g theme_newline_cursor yes
set -g theme_newline_prompt '➜ '

# vi key binding
fish_vi_key_bindings
bind -M insert \cl forward-char
bind -M insert \c\[ "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end"

# vi cursor for all terminal
## https://github.com/fish-shell/fish-shell/issues/1403
## will be resolved globally in 3.2.0
## function fish_vi_cursor_wa --on-variable fish_bind_mode
##     switch $fish_bind_mode
##         case replace_one
##             printf '\e]50;CursorShape=2\x7'   
##         case replace
##             printf '\e]50;CursorShape=2\x7'              
##         case insert
##             printf '\e]50;CursorShape=1\x7'
##         case default
##             printf '\e]50;CursorShape=0\x7'
##         case "*"
##             printf '\e]50;CursorShape=0\x7'
##     end
## end
## fish_vi_cursor_wa