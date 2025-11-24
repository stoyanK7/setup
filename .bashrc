function git_default_branch() {
  git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@'
}

function git_current_branch() {
    git rev-parse --abbrev-ref HEAD
}

alias g='git'
gl() {
  # Check whether -n or --max-count is already present
  local has_n=false
  for arg in "$@"; do
    case "$arg" in
      -n*|--max-count*)
        has_n=true
        ;;
    esac
  done

  # Build args, inserting -n25 if missing
  local args=()
  if ! $has_n; then
    args+=("-n25")
  fi
  args+=("$@")

  git --no-pager log --decorate=short \
    --pretty=format:"%x1b[36m%h%x1b[0m | %s | %x1b[33m%cr%x1b[0m | %x1b[32m%an%x1b[0m | %x1b[35m%d%x1b[0m" \
    --color=always \
    "${args[@]}" \
  | column -t -s "|"
}
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcm='git checkout $(git_default_branch)'
alias gcom='git checkout origin/$(git_default_branch)'
alias gcum='git checkout upstream/$(git_default_branch)'
alias ga='git add'
alias gaa='git add --all'
alias gap='git add --patch'
alias gc='git commit'
alias gca='git commit --amend'
alias gac='gaa && git commit -m'
alias gaaca='gaa & gca'
alias gd='git diff'
alias gds='git diff --staged'
alias gs='git status'
alias gst='git status'
alias gsta='git stash push'
alias gstaa='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gcp='git cherry-pick'
alias grom='git rebase origin/$(git_default_branch)'
alias grum='git rebase upstream/$(git_default_branch)'
alias gfo='git fetch origin'
alias gfu='git fetch upstream'
alias gfom='git fetch origin $(git_default_branch)'
alias gfum='git fetch upstream $(git_default_branch)'
alias gfcom='gfom && gcom'
alias gfcum='gfum && gcum'
alias gfrom='gfom && grom'
alias gfrum='gfum && grum'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias gp='git push'
alias gpf='git push --force'
alias gsh='git show HEAD'
alias gpl='git pull'
alias gsqa='git reset $(git merge-base $(git_default_branch) $(git rev-parse --abbrev-ref HEAD))'
alias gui='git update-index'
alias guc='git undo-commit'

alias ls='lsd'
alias cat='batcat --paging=never'

export PATH="$PATH:/home/.../.local/bin"
export HISTSIZE=1000000
export HISTFILESIZE=1000000

source /etc/bash_completion

eval "$(oh-my-posh init bash --config ~/.misc/oh-my-posh.json)"
