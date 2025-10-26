function git_default_branch() {
  git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@'
}

function git_current_branch() {
    git rev-parse --abbrev-ref HEAD
}

alias g='git'
alias gl='git --no-pager log --decorate=short --pretty=oneline -n10'
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
alias gd='git diff'
alias gds='git diff --staged'
alias gs='git status'
alias gst='git status'
alias gsta='git stash push'
alias gstaa='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gcp='git cherry-pick'
alias grom='git rebase -i origin/$(git_default_branch)'
alias grum='git rebase -i upstream/$(git_default_branch)'
alias gfo='git fetch origin'
alias gfu='git fetch upstream'
alias gfom='git fetch origin $(git_default_branch)'
alias gfum='git fetch upstream $(git_default_branch)'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias gp='git push'
alias gpf='git push --force'
alias gsh='git show HEAD'
alias gpl='git pull'
alias guc='git undo-commit'
alias gsqa='git reset $(git merge-base $(git_default_branch) $(git rev-parse --abbrev-ref HEAD))'
alias gfcom='gfom && gcom'
alias gui='git update-index'
alias guc='git undo-commit'

alias ls='lsd'
alias cat='batcat --paging=never'

export PATH="$PATH:/home/.../.local/bin"
export HISTSIZE=1000000
export HISTFILESIZE=1000000

eval "$(oh-my-posh init bash --config ~/.misc/oh-my-posh.json)"
