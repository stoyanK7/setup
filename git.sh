#!/bin/bash

echo "Configuring Git..."

if ! command -v git &> /dev/null; then
    echo "Git is not installed."
    exit 1
fi

git config --global user.name "name"  # Replace this
git config --global user.email "email"  # Replace this
git config --global commit.gpgsign true
git config --global user.signingkey ~/.ssh/git_key.pub
git config --global core.editor nano
git config --global core.autocrlf input
git config --global init.defaultBranch main
git config --global rerere.enabled true
git config --global gpg.format ssh
git config --global pull.rebase false
git config --global pull.ff only

git config --global alias.unstage 'reset HEAD --'
git config --global alias.last 'log -1 HEAD'
