#!/bin/sh

apple_path="/Users/aabrams7/Library/Application Support/jesseduffield/lazygit"
desired_path="$HOME/.Profigs/config/jesseduffield/lazygit"

rm -ri "${apple_path}"
ln -s "${desired_path}" "${apple_path}"
