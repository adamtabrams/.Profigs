export EDITOR="nvim"
export VISUAL="$EDITOR"
export TERMINAL="urxvt"
export BROWSER="firefox"
export READER="mupdf"
export PATH="$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':')$PATH"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export HANK="140.209.68.61"

amixer sset Master 100%-
amixer sset Master mute

# Start graphical server if i3 isn't already running
#[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx
# Switch excape and caps and set colors