"##################### PLUG #########################
    if ! filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
        echo "Downloading junegunn/vim-plug to manage plugins..."
        silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall
    endif

    call plug#begin('~/.local/share/nvim/site/plugged')
    Plug 'altercation/vim-colors-solarized'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-abolish'
    Plug 'tpope/vim-fugitive'
    Plug 'tomtom/tcomment_vim'
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'dense-analysis/ale'
    Plug 'yggdroot/indentline'
    Plug 'fatih/vim-go'
    Plug 'vimwiki/vimwiki'
    Plug 'rust-lang/rust.vim'
    Plug 'racer-rust/vim-racer'
    call plug#end()

"##################### PLUGINS ######################
    let g:fzf_layout = { 'down': '~70%' }
    command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
    command! -bang -nargs=? GFiles
        \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

    let g:ale_fixers = {
        \   'go': ['goimports'],
        \   'rust': ['rustfmt'],
        \   'python': ['black'],
        \   'vue': ['prettier'],
        \   'javascript': ['prettier']
        \}

    let g:ale_rust_rls_config = {
        \   'rust': {
        \     'clippy_preference': 'on'
        \   }
        \ }

    let g:rustlint1 = ['rls', 'cargo']
    let g:rustlint2 = ['rls', 'cargo', 'rustc']

    let g:ale_linters = {
        \   'go': ['gopls', 'gobuild', 'golangci-lint'],
        \   'rust': g:rustlint1
        \}

    let g:ale_go_golangci_lint_options = "--enable-all -D lll"
    let g:ale_rust_ignore_error_codes = ['E0601']

    let g:vimwiki_url_maxsave = 0
    let g:vimwiki_listsyms = " ○◐●✔"
    let g:vimwiki_listsym_rejected = "✖"
    let g:vimwiki_list_ignore_newline = 0
    let g:vimwiki_text_ignore_newline = 0
    let g:vimwiki_hl_cb_checked = 2
    let g:vimwiki_conceallevel = 0

    let g:go_highlight_extra_types = 1
    let g:go_highlight_space_tab_error = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_functions_parameters = 1
    let g:go_highlight_function_calls = 1
    let g:go_highlight_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_string_spellcheck = 1
    let g:go_highlight_format_strings = 1
    let g:go_highlight_variable_declarations = 1
    let g:go_highlight_variable_assignments = 1
    let g:go_highlight_diagnostic_errors = 1
    let g:go_highlight_diagnostic_warnings = 0

    let g:go_fmt_autosave = 0
    let g:go_imports_autosave = 0
    let g:go_imports_mode = "gopls"
    let g:go_gopls_complete_unimported = v:true
    let g:go_gopls_deep_completion = v:true
    let g:go_gopls_matcher = "fuzzy"

    let g:solarized_termtrans = 1
    let g:solarized_visibility = "high"
    let g:solarized_contrast = "high"

    let g:airline_powerline_fonts = 1
    let g:airline_solarized_bg = "dark"

    let g:indentLine_char = '│'

    let g:racer_insert_paren = 1
    let g:racer_experimental_completer = 1

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
    set hidden
    set background=dark
    set iskeyword+=-
    colorscheme solarized
    syntax enable

"##################### AUTOCMDS #####################
    autocmd TermOpen * setlocal nonu nornu
    autocmd TermOpen * IndentLinesDisable
    autocmd TermOpen * startinsert
    autocmd BufWritePre * %s:\s\+$::e
    autocmd BufNewFile,BufRead * setlocal formatoptions -=o
    autocmd BufNewFile,BufRead Jenkinsfile setlocal filetype=groovy
    autocmd FileType yaml set tabstop=2 shiftwidth=2
    autocmd FileType json IndentLinesDisable

"################### FUNCTIONS ######################
    function! ResizeMode()
        let key = nr2char(getchar())
        while key != "q" && key != "\<ESC>"
            if key == "h"
                vertical resize -5
            elseif key == "l"
                vertical resize +5
            elseif key == "j"
                resize +5
            elseif key == "k"
                resize -5
            elseif key == "="
                wincmd =
            endif
            redraw
            let key = nr2char(getchar())
        endwhile
        return ""
    endfunction

    function! GetMotion()
        let a = getchar()
        let b = ""
        let c = ""
        if a >= char2nr("0") && a <= char2nr("9")
            let b = GetMotion()
        elseif a == char2nr("i")
            let c = getchar()
        elseif a == char2nr("t") || a == char2nr("f")
            let c = getchar()
        elseif a == char2nr("T") || a == char2nr("F")
            let c = getchar()
        endif
        return nr2char(a) . b . nr2char(c)
    endfunction

    function! ChangeReplace(...)
        let motion = get(a:, 1)
        if a:0 == 0
            let motion = GetMotion()
        endif
        exe 'norm "_c'.motion.trim(getreg("+"))
        " let save_cursor = getcurpos()
        " norm ==
        " call setpos(".", save_cursor)
        call repeat#set(":call ChangeReplace('".motion."')\<CR>",-1)
        return ""
    endfunction

    function! CleverTab()
        if pumvisible()
            return "\<c-n>"
        elseif strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
            return "\<Tab>"
        endif
        return "\<c-n>"
    endfunction

    function! OmniTab()
        if pumvisible()
            return "\<c-p>"
        endif
        return "\<c-x>\<c-o>"
    endfunction

    function! CompletionStatus()
        call complete(col('.'), ['✔', '●', '◐', '○', '✖', ' '])
        return ""
    endfunc

"################### REMAPPINGS #####################
"--- Hotfix -----------------------------------------
    cnoremap 3636  <c-u>undo<CR>

"--- Should-Be-Defaults -----------------------------
    cnoremap WW     execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
    tnoremap <c-\>  <c-\><c-n>
    nnoremap c      "_c
    nnoremap <s-y>  y$

"--- Functions ---------------------------------------
    nnoremap <silent> <c-w>r      <c-w>t:call ResizeMode()<CR>
    nnoremap <silent> <c-w><s-r>  :call ResizeMode()<CR>

    nnoremap <silent> g<s-c>      :call ChangeReplace()<CR>

    inoremap <silent> <c-c>       <c-r>=CompletionStatus()<CR>

    inoremap <silent> <Tab>       <c-r>=CleverTab()<CR>
    inoremap <silent> <s-Tab>     <c-r>=OmniTab()<CR>

"--- Autocomplete -----------------------------------
    inoremap <c-f>  <c-x><c-f>
    inoremap <c-l>  <c-x><c-l>
    inoremap <c-b>  <c-x><c-p>
    "^ <c-x><c-p> block complete (continue completing where left off)

"--- Splits/Buffers ---------------------------------
    nmap gw  <c-w>
    tmap gw  <c-\><c-w>

    nnoremap <silent> gn       :bn<CR>
    nnoremap <silent> gp       :bp<CR>
    tnoremap <silent> gn       :bn<CR>
    tnoremap <silent> gp       :bp<CR>
    nnoremap <silent> gbd      :bd<CR>
    nnoremap <silent> gb<s-d>  :bd \| sbn<CR>

"--- Coding -----------------------------------------
    nnoremap gon      :cnext<CR>
    nnoremap gop      :cprevious<CR>
    nnoremap goq      :cclose<CR>:lclose<CR>
    nnoremap gos      :%s//g<Left><Left>
    nnoremap go<s-s>  :%s/<c-r><c-w>//g<Left><Left>
    nnoremap gth      :set hlsearch!<CR>
    nnoremap gtl      :IndentLinesToggle<CR>

    nnoremap g<s-a>   i<c-r>=repeat(" ",col("'m")-col("."))<CR><ESC>
    vnoremap g<s-a>   s<c-r>=repeat(" ",col("'m")-col("."))<CR><ESC>

"--- SURROUND ----------------------------------------
    nmap gs      ys
    nmap g<s-s>  yS

    nmap dsf     dt(ds(
    nmap dsm     dt[ds[
    nmap dsl     dt{ds{
    nmap dsv     dt<ds<

"--- ALE LINTING ------------------------------------
    nnoremap <silent> gaa  :ALEFirst<CR>
    nnoremap <silent> gan  :ALENextWrap<CR>
    nnoremap <silent> gap  :ALEPreviousWrap<CR>
    nnoremap <silent> gaf  :ALEFix<CR>
    nnoremap <silent> gad  :ALEDetail<CR>

"--- VIM-GO -----------------------------------------
    autocmd FileType go nnoremap goi      :GoInfo<CR>
    autocmd FileType go nnoremap got      :GoTest<CR>
    autocmd FileType go nnoremap go<s-t>  :GoTestFunc!<CR>
    autocmd FileType go nnoremap goa      :GoAlternate<CR>
    autocmd FileType go nnoremap go<s-a>  :e <c-r>%<LEFT><LEFT><LEFT>_test<CR>
    autocmd FileType go nnoremap goc      :GoCoverageToggle<CR>
    autocmd FileType go nnoremap go<s-c>  :GoCoverageBrowser<CR>
    autocmd FileType go nnoremap gor      :GoRun %<CR>
    autocmd FileType go nnoremap go<s-r>  :GoRun %<Space>
    autocmd FileType go nnoremap gd       :GoDef<CR>
    autocmd FileType go nnoremap g<s-d>   :sp<CR>:GoDef<CR>
    autocmd FileType go nnoremap gob      :GoBuild<CR>
    autocmd FileType go nnoremap go<s-b>  :GoTestCompile<CR>
    autocmd FileType go nnoremap go<s-b>  :GoTestCompile<CR>
    autocmd FileType go nnoremap gtl      :set list!<CR>
    autocmd FileType go IndentLinesDisable
    autocmd FileType go highlight link Whitespace Conceal
    autocmd FileType go set list listchars=tab:\|\ "comment to keep prev space

"--- VIM-RUST ---------------------------------------
    augroup Racer
        " autocmd!
        autocmd FileType rust nmap gd       <Plug>(rust-def)
        autocmd FileType rust nmap g<s-d>   <Plug>(rust-def-split)
        autocmd FileType rust nmap <s-k>    <Plug>(rust-doc)
        autocmd FileType rust nmap gor      :Crun<CR>
        autocmd FileType rust nmap go<s-r>  :Crun<Space>
        autocmd FileType rust nmap got      :Ctest<CR>
        autocmd FileType rust nmap go<s-t>  :RustTest<CR>
        autocmd FileType rust nmap gob      :Cbuild<CR>
        autocmd FileType rust nmap gtr      :let g:ale_linters['rust'] = g:rustlint1<CR>
        autocmd FileType rust nmap gt<s-r>  :let g:ale_linters['rust'] = g:rustlint2<CR>
    augroup END

"--- Leader Key -------------------------------------
    let mapleader = ","

"--- FZF --------------------------------------------
    let maplocalleader = "\<Space>"
    nnoremap <LocalLeader><LocalLeader>  :BLines<CR>
    nnoremap <LocalLeader>l              :Lines<CR>
    nnoremap <LocalLeader>b              :Buffers<CR>
    nnoremap <LocalLeader>r              :Rg<CR>
    nnoremap <LocalLeader>f              :Files<CR>
    nnoremap <LocalLeader>~              :Files ~
    nnoremap <LocalLeader>.              :Files ../
    nnoremap <LocalLeader>g              :GFiles<CR>
    nnoremap <LocalLeader>s              :GFiles?<CR>
    nnoremap <LocalLeader>'              :Marks<CR>
    nnoremap <LocalLeader>-              :History<CR>
    nnoremap <LocalLeader>:              :History:<CR>
    nnoremap <LocalLeader>c              :Commands<CR>
    nnoremap <LocalLeader>m              :Maps<CR>
    nnoremap <LocalLeader>h              :Helptags<CR>
    nnoremap <LocalLeader>t              :Filetypes<CR>
    nnoremap <LocalLeader><s-t>          :set filetype=<CR>
