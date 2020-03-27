#### GENERAL ########################################
    export SHELL="zsh"
    export LANG=en_US.UTF-8
    export EDITOR="nvim"
    export OPENER="$EDITOR"
    export VISUAL="$EDITOR"
    export PAGER="bat"
    export MANPAGER="col -bx | $PAGER --language=man"
    export GIT_PAGER="$PAGER"

#### SCRIPT VARS ####################################
    export TERMINAL="/Applications/Alacritty.app/Contents/MacOS/alacritty"
    export DMENU_OSX_CACHE_DIR="${HOME}/.cache/dmenu-osx"

#### COLORS #########################################
    export CLICOLOR=1
    export GREP_OPTIONS="--color=auto"

#### FILES/DIRS #####################################
    export ZDOTDIR="$HOME/.config/zsh"
    export HISTFILE="$HOME/.config/hist/histfile"

#### PATH ###########################################
    export PATH="$HOME/.scripts:$PATH"
    export PATH="$HOME/.local/bin:$PATH"
    export PATH="$HOME/.cargo/bin:$PATH"
    export PATH="$HOME/node_modules/.bin:$PATH"

#### GO #############################################
    # export GOROOT=$(find /usr/local/Cellar/go -name "libexec" -maxdepth 2 | sort -r | head -1)
    export GOPATH="$HOME/go"
    export PATH="$GOPATH/bin:$PATH"

#### BAT ############################################
    export BAT_PAGER="less -R"
    export BAT_CONFIG_PATH="$HOME/.config/bat/bat.conf"

#### FZF ############################################
    fzf_base_command="fd --hidden --exclude .git --follow"
    export FZF_DEFAULT_COMMAND="$fzf_base_command --type file"
    export FZF_DEFAULT_OPTS="--preview='bat {} 2> /dev/null'"
    export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --preview-window=':hidden'"
    export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --bind=ctrl-u:page-up"
    export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --bind=ctrl-d:page-down"
    export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --bind=ctrl-f:jump"
    export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --bind=ctrl-t:toggle-preview"

    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="$fzf_base_command --type directory --type symlink"
    export FZF_ALT_C_OPTS="--preview-window=right:0:hidden"
    export FZF_CTRL_R_OPTS="--preview-window=right:0:hidden"

#### FONTS ##########################################
    export LF_ICONS="di=:fi=:ln=:or=:ex=:*.c=:*.cc=:*.clj=:*.coffee=:*.cpp=:*.css=:*.d=:*.dart=:*.erl=:*.exs=:*.fs=:*.go=:*.h=:*.hh=:*.hpp=:*.hs=:*.html=:*.java=:*.jl=:*.js=:*.json=:*.lua=:*.md=:*.php=:*.pl=:*.pro=:*.py=:*.rb=:*.rs=:*.scala=:*.ts=:*.vim=:*.cmd=:*.ps1=:*.sh=:*.bash=:*.zsh=:*.fish=:*.tar=:*.tgz=:*.arc=:*.arj=:*.taz=:*.lha=:*.lz4=:*.lzh=:*.lzma=:*.tlz=:*.txz=:*.tzo=:*.t7z=:*.zip=:*.z=:*.dz=:*.gz=:*.lrz=:*.lz=:*.lzo=:*.xz=:*.zst=:*.tzst=:*.bz2=:*.bz=:*.tbz=:*.tbz2=:*.tz=:*.deb=:*.rpm=:*.jar=:*.war=:*.ear=:*.sar=:*.rar=:*.alz=:*.ace=:*.zoo=:*.cpio=:*.7z=:*.rz=:*.cab=:*.wim=:*.swm=:*.dwm=:*.esd=:*.jpg=:*.jpeg=:*.mjpg=:*.mjpeg=:*.gif=:*.bmp=:*.pbm=:*.pgm=:*.ppm=:*.tga=:*.xbm=:*.xpm=:*.tif=:*.tiff=:*.png=:*.svg=:*.svgz=:*.mng=:*.pcx=:*.mov=:*.mpg=:*.mpeg=:*.m2v=:*.mkv=:*.webm=:*.ogm=:*.mp4=:*.m4v=:*.mp4v=:*.vob=:*.qt=:*.nuv=:*.wmv=:*.asf=:*.rm=:*.rmvb=:*.flc=:*.avi=:*.fli=:*.flv=:*.gl=:*.dl=:*.xcf=:*.xwd=:*.yuv=:*.cgm=:*.emf=:*.ogv=:*.ogx=:*.aac=:*.au=:*.flac=:*.m4a=:*.mid=:*.midi=:*.mka=:*.mp3=:*.mpc=:*.ogg=:*.ra=:*.wav=:*.oga=:*.opus=:*.spx=:*.xspf=:*.pdf="
