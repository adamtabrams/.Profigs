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
	filetype plugin on
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
	set textwidth=72
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
	set dictionary=
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
	set scrolloff=5
	set sidescrolloff=5
	set display+=lastline
"------------------------------------------------------
" Timing out
"------------------------------------------------------
	set timeoutlen=1200
	set ttimeout
	set ttimeoutlen=50
"------------------------------------------------------
" Filetypes
"------------------------------------------------------
	"autocmd FileType text setlocal formatoptions+=a spell textwidth=90
"------------------------------------------------------
" Theme
"------------------------------------------------------
	set t_Co=256
	try
		colorscheme delek
	catch
	endtry

	hi Folded cterm=bold ctermbg=DarkGray ctermfg=Yellow

	hi StatusLine ctermbg=Black ctermfg=Blue
	hi StatusLineNC ctermbg=Black ctermfg=DarkGreen
	hi User1 ctermbg=Black ctermfg=Red
	hi User2 ctermbg=Black ctermfg=Magenta
	set laststatus=2
	set statusline=%1*%.60f
	set statusline+=%2*%M
	set statusline+=%1*\ B:
	set statusline+=%2*%n%*
	set statusline+=\ %{getcwd()}
	set statusline+=\ %1*[L:%l/%L\ C:%v\ D:%b\ H:%B]%<

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
" Align = append spaces to line until vcol x is reached
"------------------------------------------------------
	function Align(col)
		execute "normal $"
		if virtcol('.') < a:col
			let numApp = a:col - virtcol('.') - 1
			execute "normal " . numApp . "A "
		endif
		execute "normal j"
	endfunction
"------------------------------------------------------
" Tabbing and Autocomplete
"------------------------------------------------------
	inoremap <silent> <Tab> <C-R>=CleverTab()<CR>
	inoremap <S-Tab> <C-N>
	inoremap <C-T> <C-V><Tab>
"------------------------------------------------------
" Autocomplete Filename or Line
"------------------------------------------------------
	inoremap <C-F> <C-X><C-F>
	inoremap <C-L> <C-X><C-L>
	"block completion
	inoremap <C-B> <C-X><C-P>
"------------------------------------------------------
" Navigating Splits
"------------------------------------------------------
	nnoremap <C-H> <C-W>h
	nnoremap <C-J> <C-W>j
	nnoremap <C-K> <C-W>k
	nnoremap <C-L> <C-W>l
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
	nnoremap dD "_d
	"interact with the extended reg
	nnoremap <C-y> "Ey
	nnoremap <C-d> "Ed
	nnoremap <C-e>e :call setreg('e', [])<CR>
	nnoremap <C-e>p a<C-R>e<ESC>kJx
	nnoremap <C-e><S-P> i<C-R>e<ESC>kJx
	nnoremap <C-e><C-P> "ep
"------------------------------------------------------
" Special Jump-to Mark
"------------------------------------------------------
	noremap <C-S> /<++><CR>cf>
	inoremap <C-S> <++>
"------------------------------------------------------
" Essay Formatting
"------------------------------------------------------
	nnoremap <C-F> :setlocal formatoptions+=a spell textwidth=90<CR>
	nnoremap <C-B> :setlocal formatoptions-=a nospell textwidth=72<CR>
"------------------------------------------------------
" Other
"------------------------------------------------------
  "toggle hiding line numbers
	nnoremap <S-Tab> :set nu! rnu!<CR>
  "faster escape in terminal mode
	tnoremap <C-\> <C-\><C-N>
	"allows writing to files with sudo
	cnoremap w!! w !sudo tee > /dev/null %
	"ADD: auto space align

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

"------------------------------------------------------
"--------------------- REMINDERS ----------------------
"------------------------------------------------------
" Visual
"------------------------------------------------------
	" :nohl
	" :redraw

"------------------------------------------------------
"	Folds
"------------------------------------------------------
	" za, zA	= toggle this fold, toggle all folds
	" zr, zR	= remove 1 level from all folds, remove every levels
	" zm, zM	= add 1 level to all folds, add every levels

"------------------------------------------------------
"	Completion
"------------------------------------------------------
	" C-N,  C-P,  C-Y, C-E
	" next, prev, yes, exit
	" C-F,  C-T,       C-L,  C-I,          C-],  C-O,  S
	" file, thesaurus, line, search files, tags, omni, spell

"------------------------------------------------------
"	Buffers
"------------------------------------------------------
	" C-6,  C-^,  :b#,  :b [fname]Tab
	" next, prev, goto, find

"------------------------------------------------------
"	Snippets
"------------------------------------------------------
	" :-1read ~/.vim/snippets/

"------------------------------------------------------
"	Spelling
"------------------------------------------------------
	" z=,  zg,   zw,    ]s,   [s
	" fix, good, wrong, next, prev

"------------------------------------------------------
"	Sessions
"------------------------------------------------------
	" :mks ~/.vim/sessions/name.vim
	" :source !/.vim/sessions/name.vim
	" :mks!                                  = overwrite prev

"------------------------------------------------------
"	Registers
"------------------------------------------------------
	" :reg, "ry, "Ry,    "rp,  C-R,   qr
	" show, to,  append, from, paste, record

"------------------------------------------------------
"	Tag jumping
"------------------------------------------------------
	" :tag, C-],  C-O, C-I
	" show, jump, out, in

"------------------------------------------------------
"	Ctags
"------------------------------------------------------
	" ctags *.c             = generate tags for .c files
	" ctags -R .            = generate recursively from here
	" ctags -L filelist     = generate tags for files in list

"------------------------------------------------------
"	Marks
"------------------------------------------------------
	" :marks, ma,   `a,   'a,   mA,     '0,      :delm aBc
	" show,   mark, goto, line, global, prev vim, delete

"------------------------------------------------------
"	Substitute
"------------------------------------------------------
	" :s/find/rep             = this line, first occurance
	" :%s/find/rep/gc         = whole file, all occurances, must confirm
	" :5,12%s/\<exact\>/rep/I = range, whole word match, case sensitive

"------------------------------------------------------
"	Splits
"------------------------------------------------------
	" C-W, n,   s,     v,    c,     o,    n,    p,    x
	"      new, split, vert, close, only, next, prev, exchange
	" +/-/</>,     =,          _,      H/J/K/L
	" grow/shrink, equal size, expand, move window

"------------------------------------------------------
"	Splits
"------------------------------------------------------
	" :tabnew file, C-WT, gt, gT, #gt, :tabmove #, :tabc, :tabo, :tabdo
	" new, split->tab, prev, next, goto, shift pos, close, only, run

"------------------------------------------------------
"	Tabs
"------------------------------------------------------
	" :tabnew, :tabedit name, :tabn, :tabp, :tabc, :tabo
	" new,     open,          next,  prev,  close, only
