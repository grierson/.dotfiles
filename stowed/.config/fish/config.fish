fish_add_path $HOME/.local/share/bob/nvim-bin
fish_add_path ~/.cargo/bin

set -gx fish_greeting ""

set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39 \
--color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78 \
--color=marker:#dc8a78,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39"

set -gx ZELLIJ_AUTO_ATTACH true

alias g="git"
alias n="nvim"
alias fd="fdfind"
alias bat="batcat"

if status is-interactive
    eval (zellij setup --generate-auto-start fish | string collect)
end
