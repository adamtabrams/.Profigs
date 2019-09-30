#### GENERAL ####
export EDITOR="nvim"
export OPENER="nvim"
export VISUAL="nvim"
export SHELL="zsh"
export LANG=en_US.UTF-8
export CLICOLOR=1
export PAGER="bat"
export MANPAGER="bat --decorations=never"
export BAT_PAGER="less -R"
export BAT_CONFIG_PATH="$HOME/.config/bat.conf"

#### FILES/DIRS ####
export ZDOTDIR="$HOME/.config/zsh"
export VDOTFILE="$HOME/.config/vimrc"
export MYVIMRC="$VDOTFILE"
export HISTFILE="$HOME/.config/histfile"

#### PATH ####
export PATH="$HOME/.scripts/general:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/node_modules/.bin:$PATH"

#### FZF ####
export FZF_DEFAULT_OPTS="--bind=ctrl-d:page-down,ctrl-u:page-up,ctrl-f:jump"
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --bind=ctrl-t:toggle-preview"
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --preview='bat {} 2> /dev/null'"
export FZF_DEFAULT_COMMAND="fd -t f"
export FZF_CTRL_T_OPTS="--preview='bat {} 2> /dev/null'"
export FZF_CTRL_T_COMMAND="fd -t f"
export FZF_ALT_C_OPTS="--preview-window=right:0:hidden"
export FZF_ALT_C_COMMAND="fd -t d"
export FZF_CTRL_R_OPTS="--preview-window=right:0:hidden"

