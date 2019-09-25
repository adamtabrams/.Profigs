#------------------------------------------------------
#--------------- Made by Adam Abrams ------------------
#------------------------------------------------------
# General Settings
#------------------------------------------------------
    HISTFILE="$HOME/.config/histfile"
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
    zstyle ':completion:*' max-errors 0
    zstyle ':completion:*' prompt 'That command has %e errors'
    zstyle ':completion:*' rehash true
    zstyle ':completion:*' menu select
    zmodload zsh/complist
    zstyle :compinstall filename "$HOME/.config/zsh/.zshrc"
    autoload -Uz compinit
    compinit
    # Include hidden files.
    _comp_options+=(globdots)
#------------------------------------------------------
# Vim key tab complete menu
#------------------------------------------------------
    bindkey -M menuselect 'h' vi-backward-char
    bindkey -M menuselect 'k' vi-up-line-or-history
    bindkey -M menuselect 'l' vi-forward-char
    bindkey -M menuselect 'j' vi-down-line-or-history
    # bindkey -v '^?' backward-delete-char
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
    alias lg='lazygit'
    alias ldk='lazydocker'
    alias yay='pacapt'
    alias sc='scim'
#------------------------------------------------------
# Configs
#------------------------------------------------------
    alias .zsh='nvim $ZDOTDIR/.zshrc'
    alias .env='nvim $HOME/.zshenv'
    alias .vim='nvim $VDOTFILE'
    alias .nvim='nvim $HOME/.config/nvim/init.vim'
    alias .hist='nvim $HISTFILE'
#------------------------------------------------------
# Testing
#------------------------------------------------------
    alias la='ls -HpGA'
    alias ll='ls -HpGl'
    alias pls='sudo'
    alias v='nvim'
    alias k='kubectl'
    alias j='jump'
    alias t='task'
#------------------------------------------------------
# Other
#------------------------------------------------------
    alias mkdir='mkdir -pv'
    alias mkprint='lpr -o sides=two-sided-long-edge -o collate=true -o media=letter -P $(lsprinter)'
    alias myip='ifconfig | grep "inet 10" | awk '\''{print $2}'\'''
#------------------------------------------------------
# Colors
#------------------------------------------------------
    alias ls='ls -HpG'
    alias grep='grep --color=always'
#------------------------------------------------------
# Functions
#------------------------------------------------------
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
    DIRSTACKSIZE=10
    setopt AUTO_PUSHD PUSHD_SILENT PUSHD_TO_HOME
    ## Remove duplicate entries
    setopt PUSHD_IGNORE_DUPS
    ## This reverts the +/- operators.
    setopt PUSHD_MINUS
#------------------------------------------------------
# Change cursor shape for different vi modes.
#------------------------------------------------------
    function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] ||
        [[ $1 = 'block' ]]; then
        echo -ne '\e[1 q'
    elif [[ ${KEYMAP} == main ]] ||
        [[ ${KEYMAP} == viins ]] ||
        [[ ${KEYMAP} = '' ]] ||
        [[ $1 = 'beam' ]]; then
        echo -ne '\e[5 q'
    fi
    }
    zle -N zle-keymap-select
    zle-line-init() {
        zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
        echo -ne "\e[5 q"
    }
    zle -N zle-line-init
    echo -ne '\e[5 q' # Use beam shape cursor on startup.
    preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
#------------------------------------------------------
# Edit line in vim with ctrl-e:
#------------------------------------------------------
    autoload edit-command-line; zle -N edit-command-line
    bindkey -M vicmd 'v' edit-command-line
#------------------------------------------------------
# Plugins
#------------------------------------------------------
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source <(kubectl completion zsh)
    source <(helm completion zsh)
    [ -f $HOME/.config/zsh/jump.zsh ] && source $HOME/.config/zsh/jump.zsh
    [ -f $HOME/.config/zsh/fzf.zsh ] && source $HOME/.config/zsh/fzf.zsh

