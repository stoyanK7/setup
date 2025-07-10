# Git aliases
# Inspired by https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh
alias g='git'
alias gl='git --no-pager log --decorate=short --pretty=oneline -n10'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcm='git checkout $(git_main_branch)'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit --verbose'
alias gc!='git commit --verbose --amend --no-edit'
alias gca='git commit --verbose --all'
alias gca!='git commit --verbose --all --amend --no-edit'
alias gd='git diff'
alias gds='git diff --staged'
alias gst='git status'
alias gsta='git stash push'
alias gstaa='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gcp='git cherry-pick'
alias grom='git rebase -i origin/$(git_main_branch)'
alias gfo='git fetch origin'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias gpv='git push --verbose'


# Taken from https://github.com/ohmyzsh/ohmyzsh/blob/f8022980a3423f25e3d5e1b6a60d2372a2ba006b/plugins/git/git.plugin.zsh#L35
git_main_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local ref
  for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk,mainline,default,stable,master}; do
    if command git show-ref -q --verify $ref; then
      echo ${ref:t}
      return 0
    fi
  done

  # If no main branch was found, fall back to master but return error
  echo master
  return 1
}

# Enhanced git clone function
git-clone() {
  if [ $# -eq 0 ]; then
    echo "Usage: git-clone <repo_url>"
    return 1
  fi

  repo_url="$1"
  repo_name=$(basename --suffix .git "$repo_url")

  git clone "$repo_url" && \
  cd "$repo_name" && \
  git maintenance start
}
