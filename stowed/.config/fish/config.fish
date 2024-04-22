fish_add_path $HOME/.local/share/bob/nvim-bin
fish_add_path ~/.cargo/bin

set -gx fish_greeting ""

set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39 \
--color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78 \
--color=marker:#dc8a78,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39"

set --universal nvm_default_version lts

if status is-interactive
and not set -q TMUX
    exec tmux
end

alias g="git"
alias n="nvim"
alias fd="fdfind"
alias bat="batcat"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/home/kyleg/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
