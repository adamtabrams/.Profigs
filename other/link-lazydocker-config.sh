#!/bin/sh

apple_path="${HOME}/Library/Application Support/jesseduffield/lazydocker"
desired_path="${HOME}/.Profigs/config/jesseduffield/lazydocker"

temp_dir=$(mktemp -d)
cp -r "${apple_path}/" "${temp_dir}"
echo "Moved any existing configs to ${temp_dir}"
rm -r "${apple_path}"
mkdir -p "$desired_path"
ln -s "${desired_path}" "${apple_path}"
