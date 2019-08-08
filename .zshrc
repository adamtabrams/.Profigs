#------------------------------------------------------
#--------------- Made by Adam Abrams ------------------
#------------------------------------------------------
# General Settings
#------------------------------------------------------
	HISTFILE=~/.histfile
	HISTSIZE=10000
	SAVEHIST=10000
	setopt appendhistory extendedhistory incappendhistory
	setopt histfindnodups nohistbeep sharehistory
	setopt histignorespace
	setopt autocd extendedglob notify
	unsetopt beep nomatch
	bindkey -v
	export KEYTIMEOUT=1
	stty -ixon
	autoload -Uz zmv
#------------------------------------------------------
# Prompt setting
#------------------------------------------------------
	autoload -Uz promptinit
	promptinit
	PROMPT='%F{blue}>%f '
	RPROMPT='%F{yellow}%2~%f'
#------------------------------------------------------
# Completion settings
#------------------------------------------------------
	zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
	zstyle ':completion:*' max-errors 1
	zstyle ':completion:*' prompt 'That command has %e errors'
	zstyle ':completion:*' rehash true
	zstyle :compinstall filename '/home/school/.zshrc'
	autoload -Uz compinit
	compinit
#------------------------------------------------------
# History searching
#------------------------------------------------------
	autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
	zle -N up-line-or-beginning-search
	zle -N down-line-or-beginning-search
	bindkey "^[[A" up-line-or-beginning-search
	bindkey "^[[B" down-line-or-beginning-search
	bindkey -M vicmd "k" up-line-or-beginning-search
	bindkey -M vicmd "j" down-line-or-beginning-search
#------------------------------------------------------
# Aliases
#------------------------------------------------------
	alias vim='nvim'
	alias vi='nvim'
	alias vifm='vimfm'
	alias v='vimfm $(pwd)'
	alias m='setsid mupdf'
	alias s='setsid sxiv'
	alias lg='lazygit'
	alias yay='pacapt'
	alias pacman='pacapt'
	alias sc='scim'
#------------------------------------------------------
# Other
#------------------------------------------------------
	alias mkdir='mkdir -pv'
	alias mkprint='lpr -o sides=two-sided-long-edge -o collate=true -o media=letter -P $(lsprinter)'
	alias myip='ifconfig | grep "inet 10" | awk '\''{print $2}'\'''
#------------------------------------------------------
# Fuzzy Nav
#------------------------------------------------------
	alias cf='cd $(echo -e "$(2>/dev/null find ~/* -type d | grep -v '.git')\n$HOME/.Profigs" | fzf)'
	alias cf.='cd $(2>/dev/null find ./* -type d | grep -v '.git' | fzf)'
#------------------------------------------------------
# Colors
#------------------------------------------------------
	alias ls='ls -hpG'
	alias grep='grep --color=always'
#------------------------------------------------------
# Functions
#------------------------------------------------------
	## Changes working directory when vifm exits
	## use :cq[uit] to cancel directory change
	vimfm()
	{
		local dst="$(command vifm --choose-dir - "$@")"
		if [ -z "$dst" ]; then
			echo 'Directory picking cancelled/failed'
			return 1
		fi
		cd "$dst"
	}
	## allows for private key and terminal passwords to be saved
	## to save git https passwords run:
	## git config --global credential.helper /usr/lib/git-core/git-credential-libsecret
	if [ -n "$DESKTOP_SESSION" ];then
		eval $(gnome-keyring-daemon --start) > /dev/null
		export SSH_AUTH_SOCK
	fi
#------------------------------------------------------
# Dirstack
#------------------------------------------------------
	DIRSTACKFILE="$HOME/.cache/zsh/dirs"
	if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
		dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
		[[ -d $dirstack[1] ]] && cd $dirstack[1]
	fi
	chpwd() {
		print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
	}
	DIRSTACKSIZE=20
	setopt AUTO_PUSHD PUSHD_SILENT PUSHD_TO_HOME
	## Remove duplicate entries
	setopt PUSHD_IGNORE_DUPS
	## This reverts the +/- operators.
	setopt PUSHD_MINUS
#------------------------------------------------------
# Plugins
#------------------------------------------------------
	source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
