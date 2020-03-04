#!/bin/sh
# Generate list of installed progs: brew leaves

progs_list=" \
neovim
zsh
zsh-syntax-highlighting
lazygit
git-delta
lazydocker
pacapt
bat
fzf
ripgrep
fd
lf
gnu-sed
jq
docker-completion
kubernetes-cli
kubernetes-helm
coreutils
sc-im
htop
tree
watch
httpie
hub
tig
wrk
golangci/tap/golangci-lint
shellcheck"
# grip
# black
# flake8
# go

echo "$progs_list" | xargs brew install
