set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

if empty(glob('~/.local/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   autocmd VimEnter * PlugInstall --sync
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
    Plug 'fatih/vim-go'
call plug#end()

" FZF
let g:fzf_layout = { 'down': '~60%' }
command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=? GFiles
\ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

" ALE
let g:ale_fixers = {
\   'go': ['gofmt','goimports'],
\   'python': ['black'],
\   'vue': ['prettier'],
\   'javascript': ['prettier']
\}

" GO
" let g:go_list_type = "quickfix"
" let g:go_fmt_autosave = 0
" let g:go_fmt_fail_silently = 1
" let g:go_auto_type_info = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

source $VDOTFILE
