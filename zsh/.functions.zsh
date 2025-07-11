# fzf config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fzf --zsh)"
# source ~/.oh-my-zsh/lib/key-bindings.zsh
# source ~/.oh-my-zsh/lib/completion.zsh

# Use fd instead of find for fzf
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd for listing path candidates
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -100; else bat -n --color=always --line-range :500 {}; fi"

# Add file and directory preview when using fzf
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :100 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -100'"

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -100' "$@" ;;
    export|unset) fzf --preview "eval 'echo \$' {}"    "$@" ;;
    ssh)          fzf --preview 'dig {}'               "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# bat
export BAT_THEME="Visual Studio Dark+"

# fzf-git
# source ~/packages/fzf-git.sh/fzf-git.sh

# eza
alias lz="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias ls="eza --color=always --icons=always"
alias llz="eza --color=always --long --git --icons=always"
alias lg="lazygit"
alias rr="ranger"
