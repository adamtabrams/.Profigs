set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

if empty(glob('~/.local/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   autocmd VimEnter * PlugInstall --sync
    " autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/nvim/site/plugged')
    Plug 'altercation/vim-colors-solarized'
    Plug 'sheerun/vim-polyglot'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'tomtom/tcomment_vim'
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'dense-analysis/ale'
    Plug 'yggdroot/indentline'
    Plug 'godlygeek/tabular'
call plug#end()

source $VDOTFILE
