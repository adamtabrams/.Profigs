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
    let g:vimwiki_listsyms = " ○◐●✔"
    let g:vimwiki_listsym_rejected = "✖"
    let g:vimwiki_list_ignore_newline = 0
    let g:vimwiki_text_ignore_newline = 0
    let g:vimwiki_hl_cb_checked = 2
    " let g:vimwiki_hl_headers = 1

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
    set autowrite
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
    tnoremap <c-\> <c-\><c-n>
    nnoremap c "_c
    nnoremap <s-y> y$

"--- Tabbing ----------------------------------------
    function! CleverTab()
        if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
            return "\<Tab>"
        else
            return "\<c-n>"
        endif
    endfunction

    inoremap <silent> <Tab>         <c-r>=CleverTab()<CR>
    inoremap          <s-Tab>       <c-n>

"--- Splits/Buffers ---------------------------------
    nnoremap <c-h> <c-w>h
    nnoremap <c-j> <c-w>j
    nnoremap <c-k> <c-w>k
    nnoremap <c-l> <c-w>l
    tnoremap <c-h> <c-\><c-n><c-w>h
    tnoremap <c-l> <c-\><c-n><c-w>l
    nnoremap <c-n> :bn<CR>
    nnoremap <c-p> :bp<CR>
    tnoremap <c-n> <c-\><c-n>:bn<CR>
    tnoremap <c-p> <c-\><c-n>:bp<CR>

"### G-Motions ######################################
"--- Surrond ----------------------------------------
    nmap gs     ys
    nmap g<s-s> yS

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
    nnoremap go<s-c> :GoCoverageToggle<CR>
    nnoremap gor     :GoRun %<CR><c-w>hi
    nnoremap go<s-r> :GoRun<CR><c-w>hi
    nnoremap gob     :GoBuild<CR>
    nnoremap go<s-b> :GoTestCompile<CR>
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
    inoremap <Leader>f <c-x><c-f>
    inoremap <Leader>l <c-x><c-l>
    inoremap <Leader>o <c-x><c-o>
    inoremap <Leader>b <c-x><c-p>
    "^ <c-x><c-p> block complete (hit repeatedly: fuzzy line complete)

"--- Unicode ----------------------------------------
    " inoremap <Leader>d <c-v>u2714
    inoremap <Leader>d <c-v>u2705

"------------------- NORMAL MODE --------------------
"--- Substitute -------------------------------------
    nnoremap <Leader>s     :%s::g<Left><Left>
    nnoremap <Leader><s-s> :%s:<c-r><c-w>::g<Left><Left>

"--- Toggle -----------------------------------------
    nnoremap <silent> <Leader>h :set hlsearch!<CR>
    nnoremap <silent> <Leader>l :IndentLinesToggle<CR>

"--- Splits -----------------------------------------
    nnoremap <silent> <Leader>t :term<CR>a
    nnoremap <silent> <Leader>v :vsp<CR><c-w>l:bn<CR>

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
    nnoremap <silent> <LocalLeader>f             :Files<CR>
    nnoremap          <LocalLeader>~             :Files ~
    nnoremap          <LocalLeader>.             :Files ../
    nnoremap <silent> <LocalLeader>b             :Buffers<CR>
    nnoremap <silent> <LocalLeader>g             :GFiles<CR>
    nnoremap <silent> <LocalLeader>s             :GFiles?<CR>
    nnoremap <silent> <LocalLeader>'             :Marks<CR>
    nnoremap <silent> <LocalLeader>-             :History<CR>
    nnoremap <silent> <LocalLeader>:             :History:<CR>
    nnoremap <silent> <LocalLeader>c             :Commands<CR>
    nnoremap <silent> <LocalLeader>t             :Filetypes<CR>
    nnoremap <silent> <LocalLeader>m             :Maps<CR>
    nnoremap <silent> <LocalLeader>h             :Helptags<CR>
