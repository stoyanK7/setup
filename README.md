# Setup

## Install Software

- [lsd](https://github.com/lsd-rs/lsd)
- [bat](https://github.com/sharkdp/bat)
  - Check if executable is `bat` or `batcat`
- [delta](https://github.com/dandavison/delta)
  - Download <https://raw.githubusercontent.com/dandavison/delta/main/themes.gitconfig> to `~/.misc/delta-themes.config`
- [oh-my-posh](https://ohmyposh.dev/)
- [JetBrains Mono NF](https://www.nerdfonts.com/font-downloads)
  - Put under `~/.fonts`

## Setup SSH

```shell
ssh-keygen -t ed25519 -C "your_email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/your_key_name
cat ~/.ssh/your_key_name.pub
```

## Setup Git

```shell
cp .gitconfig ~/.gitconfig
```

Make sure to set name, email and ssh key in `~/.gitconfig`.
