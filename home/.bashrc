# ~/.bashrc

# If not running interactively, don't do anything
    [[ $- != *i* ]] && return

# Additions by Adam Abrams

    #alias vi="/usr/bin/nvim"
    #alias vim="/usr/bin/nvim"
    #alias vi="~/Applications/nvim-osx64/bin/nvim"
    #alias vim="~/Applications/nvim-osx64/bin/nvim"

    #testing
    export HISTFILE="$HOME/.config/histfile"

    toLow() {
       echo "for f in \$(ls); do rename -v \$f \$(echo \$f | tr [A-Z] [a-z]) \$f; done"
    }

    #use vim controls
        set -o vi
        bind '"kj":"\e"'
        #bind '"kj":vi-movement-mode'

    #ls aliases
        alias ls='ls -G --color=auto'
        alias la='ls -Ga --color=auto'
        alias ll='ls -Gl --color=auto'

    #color aliases
        alias diff='diff --color=auto'
        alias grep='grep --color=auto'

    #how bash starts a line
        PS1='\W\$ '
          #PS1='$(gitprompt)\W\$ '

        alias cs0="PS1=''"
        alias cs1="PS1='\$ '"
        alias cs2="PS1='\W\$ '"
        alias cs3="PS1='[\u@\h \w]\$ '"

    #wifi reset shortcuts
        alias wifi='nmcli radio wifi off && nmcli radio wifi on'
        alias goog='ping www.google.com'

    #ctags shortcuts
    alias mktags='mkdir -p ./.tags && cd ./.tags && ctags -R -f ./tags .. && cd ..'

    #creates dir, file, & symlink for neovim config
        nvimSetup() {
            if [ ! -d ~/.config/nvim ]; then
                echo "Creating ~/.config/nvim"
                mkdir ~/.config/nvim
            fi
            echo "Creating ~/.config/nvim/init.vim"
            touch ~/.config/nvim/init.vim
            echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after" > ~/.config/nvim/init.vim
            echo "let &packpath = &runtimepath" >> ~/.config/nvim/init.vim
            echo "source ~/.vimrc" >> ~/.config/nvim/init.vim
            echo "done"
        }
        export -f nvimSetup
#        if [ -f ~/.config/nvim/init.vim ]; then
#            alias vi="/usr/bin/nvim"
#            alias vim="/usr/bin/nvim"
            #alias vi="~/Applications/nvim-osx64/bin/nvim"
            #alias vim="~/Applications/nvim-osx64/bin/nvim"
#        fi

    #quick access to Vim's swap files
        alias rmswap='vimSwapDel'

        vimSwapDel() {
            if [ $# -eq 1 ]; then
                rm ~/.cache/vim/swap/*$1*.swp
            else
                ls -a ~/.cache/vim/swap
                read -p 'Delete: ' delFile
                rm ~/.cache/vim/swap/*$delFile*.swp
            fi
        }
        export -f vimSwapDel

    #sets up vim native plugin support & installs packages
        alias mkPlugins="nvimPlugins"

        nvimPlugins() {
            if [ ! -d ~/.vim/pack ]; then
                echo "Creating ~/.vim/pack"
                mkdir ~/.vim/pack
            fi
            if [ ! -d ~/.vim/pack/myPlugins ]; then
                echo "Creating ~/.vim/pack/myPlugins"
                mkdir ~/.vim/pack/myPlugins
            fi
            if [ ! -d ~/.vim/pack/myPlugins/start ]; then
                echo "Creating ~/.vim/pack/myPlugins/start"
                mkdir ~/.vim/pack/myPlugins/start
            fi
            echo "done"
        }
        export -f nvimPlugins

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
