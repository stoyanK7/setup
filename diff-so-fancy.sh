#!/bin/bash

echo "Installing diff-so-fancy..."

curl -o /usr/local/bin/diff-so-fancy https://github.com/so-fancy/diff-so-fancy/releases/download/v1.4.4/diff-so-fancy
chmod +x /usr/local/bin/diff-so-fancy

echo "Configuring diff-so-fancy..."
git config --global core.pager "diff-so-fancy | less --tabs=4 -RF"
git config --global interactive.diffFilter "diff-so-fancy --patch"
