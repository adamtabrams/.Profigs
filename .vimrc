" Made by Adam Abrams
"------------------------------------------------------
"---------------------- SETTINGS ----------------------
"------------------------------------------------------
" Defaults
"------------------------------------------------------
	set nocompatible
	set encoding=utf-8
	set mouse=
	set background=dark
	set noexpandtab
	set noerrorbells
	set novisualbell
	set softtabstop=0
	set ruler
"------------------------------------------------------
" General
"------------------------------------------------------
	"filetype plugin on
	filetype plugin indent on
	set fileformats=unix,dos,mac
	set history=200
	set autowrite
	set autoread
	set hidden
	set backspace=2
	set wildmenu
	set wildignore+=tags,.pyc,.swp
	set wildmode=longest,list,full
	set path+=**
	set tags+=./.tags;$HOME
"------------------------------------------------------
" Display
"------------------------------------------------------
	syntax enable
	set lazyredraw
	set showmatch
	set title
"------------------------------------------------------
" Status bar
"------------------------------------------------------
	set cmdheight=1
	set laststatus=2
"------------------------------------------------------
" Text formatting
"------------------------------------------------------
	set textwidth=90
	set wrap
	set linebreak
	set formatoptions+=j
	set formatoptions-=o
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufNewFile,BufRead * setlocal formatoptions -=o
"------------------------------------------------------
" Indentation
"------------------------------------------------------
	set tabstop=2
	set shiftwidth=2
	set shiftround
	set autoindent
	set smartindent
	set smarttab
"------------------------------------------------------
" Searching
"------------------------------------------------------
	set ignorecase
	set smartcase
	set incsearch
	set nohlsearch
	if has("nvim")
		set inccommand=split
	endif
"------------------------------------------------------
" Numbering
"------------------------------------------------------
	set number
	set relativenumber
"------------------------------------------------------
" Spelling
"------------------------------------------------------
	set spelllang=en_us
	set spellfile=~/.vim/spell/en.utf-8.add
"------------------------------------------------------
" Completion
"------------------------------------------------------
	set complete-=i
	set complete+=.,w,b,u,t,k,kspell
	"set dictionary=
	"set dictionary+=/usr/share/dict/words
"------------------------------------------------------
" Folding
"------------------------------------------------------
	set foldenable
	set foldmethod=indent
	set foldlevelstart=99
	set foldnestmax=3
"------------------------------------------------------
" Scrolling
"------------------------------------------------------
	set scrolloff=2
	set sidescrolloff=5
	set display+=lastline
"------------------------------------------------------
" Timing out
"------------------------------------------------------
	set timeoutlen=1200
	set ttimeout
	set ttimeoutlen=50
"------------------------------------------------------
" Theme
"------------------------------------------------------
	set t_Co=256
	try
		colorscheme solarized
	catch
	endtry

	hi StatusLine ctermbg=Black ctermfg=LightBlue
	hi StatusLineNC ctermbg=Black ctermfg=Blue
	hi User1 ctermbg=Black ctermfg=Magenta
	hi User2 ctermbg=Black ctermfg=Red
	hi User3 ctermbg=Black ctermfg=LightBlue
	set statusline=%3*%.60f
	set statusline+=%2*%M
	set statusline+=%1*\ B:
	set statusline+=%2*%n%*
	set statusline+=%1*%=
	set statusline+=\ [L:%l/%L\ C:%v\ D:%b\ H:%B]%<

"------------------------------------------------------
"-------------------- REMAPPINGS ----------------------
"------------------------------------------------------
" CleverTab = tab when left of cursor blank, else autocomplete
"------------------------------------------------------
	function! CleverTab()
		if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
			return "\<Tab>"
		else
			return "\<C-P>"
		endif
	endfunction
"------------------------------------------------------
" Tabbing and Autocomplete
"------------------------------------------------------
	inoremap <silent> <Tab> <C-R>=CleverTab()<CR>
	inoremap <S-Tab> <C-N>
	"inoremap <C-T> <C-V><Tab>
"------------------------------------------------------
" Autocomplete Filename or Line
"------------------------------------------------------
	inoremap <C-F> <C-X><C-F>
	inoremap <C-L> <C-X><C-L>
	"block complete (hit repeatedly: fuzzy line complete)
	inoremap <C-B> <C-X><C-P>
"------------------------------------------------------
" Navigating Splits
"------------------------------------------------------
	nnoremap <C-H> <C-W>h
	nnoremap <C-J> <C-W>j
	nnoremap <C-K> <C-W>k
	nnoremap <C-L> <C-W>l
	tnoremap <C-H> <C-\><C-N><C-W>h
	tnoremap <C-J> <C-\><C-N><C-W>j
	tnoremap <C-K> <C-\><C-N><C-W>k
	tnoremap <C-L> <C-\><C-N><C-W>l
"------------------------------------------------------
" Navigating Buffers
"------------------------------------------------------
	nnoremap <C-N> :bn<CR>
	nnoremap <C-P> :bp<CR>
	tnoremap <C-N> <C-\><C-N>:bn<CR>
	tnoremap <C-P> <C-\><C-N>:bp<CR>
"------------------------------------------------------
" Better Scrolling
"------------------------------------------------------
	nnoremap <Space> <C-D>
	nnoremap <S-Space> <C-U>
"------------------------------------------------------
" Yank Delete and Paste
"------------------------------------------------------
	"proper yank-to-line-end
	nnoremap <S-Y> y$
	"delete to Black Hole reg
	nnoremap d<C-D> "_d
	"interact with the extended reg
	nnoremap yY "Ey
	nnoremap dD "Ed
	nnoremap <C-e>e :call setreg('e', [])<CR>
	nnoremap <C-e>p a<C-R>e<ESC>kJx
	nnoremap <C-e><S-P> i<C-R>e<ESC>kJx
	nnoremap <C-e><C-P> "ep
"------------------------------------------------------
" Special Jump-to Mark
"------------------------------------------------------
	noremap <C-Space> /<++><CR>cf>
	inoremap <C-Space> <Esc>/<++><CR>cf>
	inoremap <C-S> <++>
"------------------------------------------------------
" Essay Formatting
"------------------------------------------------------
	nnoremap <C-F> :setlocal formatoptions+=a spell<CR>
	nnoremap <C-B> :setlocal formatoptions-=a nospell<CR>
"------------------------------------------------------
" Auto Closing
"------------------------------------------------------
	iabbrev {  {<CR>}<ESC>O
	iabbrev {; {<CR>};<ESC>O
	iabbrev {, {<CR>},<ESC>O
	iabbrev </ </<C-X><C-O>
"------------------------------------------------------
" Other
"------------------------------------------------------
  "faster escape in terminal mode
	tnoremap <C-\> <C-\><C-N>
	"allows writing to files with sudo
	cnoremap w!! w !sudo tee > /dev/null %

	nnoremap <silent> <S-Tab> :set hlsearch!<CR>

"------------------------------------------------------
"---------------------- CSCOPE ------------------------
"------------------------------------------------------
	if has("cscope")
		set csprg=/usr/bin/cscope
		set csto=0
		set cst
		set cscopequickfix=a-,c-,d-,e-,f-,g-,i-,s-,t-
		set cscopepathcomp=3

		if filereadable(".cscope.out")
				silent cs add .cscope.out
		endif

		nnoremap \ :cs<CR>:cs find<Space>
		nnoremap <C-\><C-\> :make tags<CR>
		nnoremap <C-\>a :cs add .cscope.out<CR>
	endif
