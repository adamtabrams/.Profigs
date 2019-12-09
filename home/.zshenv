#### GENERAL ####
export SHELL="zsh"
export LANG=en_US.UTF-8
export CLICOLOR=1
# export EDITOR="nvim"
# export OPENER="nvim"
# export VISUAL="nvim"
export EDITOR="$HOME/temp/nvim/neovim/build/bin/nvim"
export OPENER="$HOME/temp/nvim/neovim/build/bin/nvim"
export VISUAL="$HOME/temp/nvim/neovim/build/bin/nvim"
export PAGER="bat --paging=always --pager='less -R'"
export MANPAGER="$PAGER --language=man --theme=1337 --terminal-width=+250"

#### FILES/DIRS ####
export ZDOTDIR="$HOME/.config/zsh"
export HISTFILE="$HOME/.config/hist/histfile"

#### PATH ####
export PATH="$HOME/.scripts:$PATH"
export PATH="$HOME/.local/bin:$PATH"
# export PATH="$GOROOT/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/node_modules/.bin:$PATH"

#### BAT ####
export BAT_PAGER="less -R"
export BAT_CONFIG_PATH="$HOME/.config/bat.conf"

#### FZF ####
export FZF_DEFAULT_COMMAND="fd --hidden --exclude .git --type file"
export FZF_DEFAULT_OPTS="--preview='bat {} 2> /dev/null'"
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --bind=ctrl-u:page-up"
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --bind=ctrl-d:page-down"
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --bind=ctrl-f:jump"
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --bind=ctrl-t:toggle-preview"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --hidden --exclude .git --type directory --type symlink"
export FZF_ALT_C_OPTS="--preview-window=right:0:hidden"
export FZF_CTRL_R_OPTS="--preview-window=right:0:hidden"

