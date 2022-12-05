# Return immediately if restic is not found
if (( ! $+commands[autorestic] )); then
  return
fi

# If the completion file doesn't exist yet, we need to autoload it and
# bind it to `restic`. Otherwise, compinit will have already done that.
if [[ ! -f "$ZSH_CACHE_DIR/completions/_autorestic" ]]; then
  typeset -g -A _comps
  autoload -Uz _autorestic
  _comps[autorestic]=_autorestic
fi

autorestic completion zsh > "$ZSH_CACHE_DIR/completions/_autorestic" &|
