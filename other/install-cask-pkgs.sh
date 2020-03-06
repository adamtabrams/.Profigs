#!/bin/sh
# Generate list of installed progs: brew cask list

taps_list=" \
homebrew/cask-fonts"

progs_list=" \
amethyst
alacritty
brave-browser
font-firacode-nerd-font
karabiner-elements"

echo "$taps_list" | xargs brew tap

echo "$progs_list" | xargs brew cask install
