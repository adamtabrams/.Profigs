#------------------------------------------------------
#--------------- Made by Adam Abrams ------------------
#------------------------------------------------------
# General Settings
#------------------------------------------------------
	HISTFILE=~/.histfile
	HISTSIZE=10000
	SAVEHIST=10000
	setopt appendhistory autocd extendedglob notify
	unsetopt beep nomatch
	bindkey -v
	export KEYTIMEOUT=1
	stty -ixon
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
	alias sx='setsid sxiv'
	alias x='sxiv'
#------------------------------------------------------
# Other
#------------------------------------------------------
	alias mkdir='mkdir -pv'
	alias mkprint='lpr -o sides=two-sided-long-edge -o collate=true -o media=letter -P $(lsprinter)'
	alias savekeypass='pkill ssh-agent && eval $(ssh-agent) && ssh-add'
	alias savekeypass2='eval $(ssh-agent) && ssh-add'
#------------------------------------------------------
# Colors
#------------------------------------------------------
	alias ls='ls -hN --color=auto --group-directories-first'
	alias diff='diff --color=auto'
	alias grep='grep --color=auto'
#------------------------------------------------------
# Functions
#------------------------------------------------------
  ## Clears terminal and list directories
	cl() { cd "$1" && clear && ls -hN --color=auto --group-directories-first; }
	## Changes working directory when vifm exits
	vimfm()
	{
		local dst="$(command vifm --choose-dir - "$@")"
		if [ -z "$dst" ]; then
			echo 'Directory picking cancelled/failed'
			return 1
		fi
		cd "$dst"
	}
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
	source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
