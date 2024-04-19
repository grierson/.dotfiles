fish_add_path $HOME/.local/share/bob/nvim-bin
fish_add_path ~/.cargo/bin

set -gx fish_greeting ""

set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --follow -g \"!.git/\" 2> /dev/null"
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

alias g="git"
alias gg="g a .; and g c -a"
alias lg="lazygit"
alias n="nvim"
