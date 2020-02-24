#!/bin/sh
# Generate list of installed progs: brew leaves

progs_list=" \
neovim
zsh
zsh-syntax-highlighting
lazygit
lazydocker
pacapt
task
bat
fzf
ripgrep
fd
lf
grip
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
# black
# flake8
# go

echo "$progs_list" | xargs brew install
