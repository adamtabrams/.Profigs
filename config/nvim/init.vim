"##################### PLUG #########################
    if ! filereadable(expand('~/.local/nvim/site/autoload/plug.vim'))
        echo "Downloading junegunn/vim-plug to manage plugins..."
        silent !mkdir -p ~/.local/nvim/site/autoload/
        silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
            \ > ~/.local/nvim/site/autoload/plug.vim
        autocmd VimEnter * PlugInstall
    endif

    call plug#begin('~/.local/nvim/site/plugged')
    Plug 'altercation/vim-colors-solarized'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'tomtom/tcomment_vim'
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'dense-analysis/ale'
    Plug 'yggdroot/indentline'
    Plug 'fatih/vim-go'
    Plug 'vimwiki/vimwiki'
    call plug#end()

"##################### PLUGINS ######################
    let g:fzf_layout = { 'down': '~60%' }
    command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
    command! -bang -nargs=? GFiles
        \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

    let g:ale_fixers = {
        \   'go': ['gofmt','goimports'],
        \   'python': ['black'],
        \   'vue': ['prettier'],
        \   'javascript': ['prettier']
        \}

    let g:vimwiki_url_maxsave = 0

    let g:go_fmt_command = "goimports"
    let g:go_highlight_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_function_calls = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_extra_types = 1
    let g:go_highlight_build_constraints = 1
    let g:go_highlight_generate_tags = 1
    " let g:go_list_type = "quickfix"
    " let g:go_fmt_autosave = 0
    " let g:go_fmt_fail_silently = 1
    " let g:go_auto_type_info = 1

    let g:solarized_termtrans = 1
    let g:solarized_visibility = "high"
    let g:solarized_contrast = "high"
    " let g:solarized_termcolors = 256
    " let g:solarized_diffmode = "normal"

    let g:airline_powerline_fonts = 1
    let g:airline_solarized_bg="dark"

"##################### SETTINGS #####################
    set fileformats=unix,mac,dos
    set wildmode=longest,list,full
    set clipboard+=unnamedplus
    set spelllang=en_us
    set shell=/bin/zsh
    set history=200
    set mouse=a
    set go=a
    set scrolloff=2
    set inccommand=split
    set tabstop=4 shiftwidth=4 expandtab shiftround
    set foldmethod=indent foldlevelstart=99 foldnestmax=3
    set ignorecase smartcase fileignorecase wildignorecase
    set number relativenumber
    set splitbelow splitright
    set nohlsearch
    colorscheme solarized
    syntax enable

    autocmd TermOpen * setlocal nonu nornu
    autocmd TermOpen * IndentLinesDisable
    autocmd BufWritePre * %s:\s\+$::e
    autocmd BufNewFile,BufRead * setlocal formatoptions -=o
    autocmd BufNewFile,BufRead Jenkinsfile setlocal filetype=groovy

"################### REMAPPINGS #####################
"--- Should-Be-Defaults -----------------------------
    cnoremap WW execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
    cnoremap HH vert help
    tnoremap <C-\> <C-\><C-N>
    nnoremap c "_c
    nnoremap <S-Y> y$

"--- Tabbing ----------------------------------------
    function! CleverTab()
        if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
            return "\<Tab>"
        else
            return "\<C-P>"
        endif
    endfunction

    inoremap <silent> <Tab>         <C-R>=CleverTab()<CR>
    inoremap          <S-Tab>       <C-N>

"--- Splits/Buffers ---------------------------------
    nnoremap <C-H> <C-W>h
    nnoremap <C-J> <C-W>j
    nnoremap <C-K> <C-W>k
    nnoremap <C-L> <C-W>l
    tnoremap <C-H> <C-\><C-N><C-W>h
    tnoremap <C-L> <C-\><C-N><C-W>l
    nnoremap <C-N> :bn<CR>
    nnoremap <C-P> :bp<CR>
    tnoremap <C-N> <C-\><C-N>:bn<CR>
    tnoremap <C-P> <C-\><C-N>:bp<CR>

"### G-Motions ######################################
"--- Surrond ----------------------------------------
    nmap gs     ys
    nmap g<S-S> yS

"--- ALE Linting ------------------------------------
    nnoremap <silent> gaa :ALEFirst<CR>
    nnoremap <silent> gag :ALEFirst<CR>
    nnoremap <silent> gan :ALENextWrap<CR>
    nnoremap <silent> gap :ALEPreviousWrap<CR>
    nnoremap <silent> gao :lopen<CR>
    nnoremap <silent> gac :lclose<CR>
    nnoremap <silent> gaf :ALEFix<CR>
    " set omnifunc=ale#completion#OmniFunc

"--- vim-go -----------------------------------------
    nnoremap goi     :GoInstall<CR>
    nnoremap got     :GoTest<CR>
    nnoremap gof     :GoTestFunc<CR>
    nnoremap goa     :GoAlternate<CR>
    nnoremap go<S-C> :GoCoverageToggle<CR>
    nnoremap gor     :GoRun %<CR><C-W>hi
    nnoremap go<S-R> :GoRun<CR><C-W>hi
    nnoremap gob     :GoBuild<CR>
    nnoremap go<S-B> :GoTestCompile<CR>
    nnoremap gon     :cnext<CR>
    nnoremap gop     :cprevious<CR>
    nnoremap goc     :cclose<CR>
    nnoremap gol     :lclose<CR>


"### Leader Keys ####################################
    let mapleader = ","
    nnoremap <Leader><Leader> <Leader>
    inoremap <Leader><Leader> <Leader>

"------------------- INSERT MODE --------------------
"--- Autocomplete -----------------------------------
    inoremap <Leader>f <C-X><C-F>
    inoremap <Leader>l <C-X><C-L>
    inoremap <Leader>o <C-X><C-O>
    inoremap <Leader>b <C-X><C-P>
    "^ <C-X><C-P> block complete (hit repeatedly: fuzzy line complete)

"--- Unicode ----------------------------------------
    " inoremap <Leader>d <C-V>u2714
    inoremap <Leader>d <C-V>u2705

"------------------- NORMAL MODE --------------------
"--- Substitute -------------------------------------
    nnoremap <Leader>s     :%s::g<Left><Left>
    nnoremap <Leader><S-S> :%s:<C-R><C-W>::g<Left><Left>

"--- Toggle -----------------------------------------
    nnoremap <silent> <Leader>h :set hlsearch!<CR>
    nnoremap <silent> <Leader>l :IndentLinesToggle<CR>

"--- Splits -----------------------------------------
    nnoremap <silent> <Leader>t :term<CR>a
    nnoremap <silent> <Leader>v :vsp<CR><C-W>l:bn<CR>

"--- Resize -----------------------------------------
    nnoremap <silent> <Leader>< :exe "vertical resize " . (winwidth(0) * 5/4)<CR>
    nnoremap <silent> <Leader>> :exe "vertical resize " . (winwidth(0) * 3/4)<CR>
    nnoremap <silent> <Leader>k :exe "resize " . (winheight(0) * 5/4)<CR>
    nnoremap <silent> <Leader>j :exe "resize " . (winheight(0) * 3/4)<CR>

"### FZF ############################################
    let maplocalleader = "\<Space>"
    nnoremap <silent> <LocalLeader><LocalLeader> :BLines<CR>
    nnoremap <silent> <LocalLeader>l             :Lines<CR>
    nnoremap <silent> <LocalLeader>r             :Rg<CR>
    nnoremap          <LocalLeader>~             :Files ~
    nnoremap <silent> <LocalLeader>f             :Files<CR>
    nnoremap          <LocalLeader>.             :Files ../
    nnoremap <silent> <LocalLeader>b             :Buffers<CR>
    nnoremap <silent> <LocalLeader>g             :GFiles<CR>
    nnoremap <silent> <LocalLeader>c             :GFiles?<CR>
    nnoremap <silent> <LocalLeader>m             :Marks<CR>
    nnoremap <silent> <LocalLeader>h             :History<CR>
    nnoremap <silent> <LocalLeader>:             :History:<CR>
    nnoremap <silent> <LocalLeader><S-F>         :Filetypes<CR>
    nnoremap <silent> <LocalLeader><S-M>         :Maps<CR>
    nnoremap <silent> <LocalLeader><S-C>         :Commands<CR>
    nnoremap <silent> <LocalLeader><S-H>         :Helptags<CR>
