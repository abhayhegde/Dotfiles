" Setup {{{1
set nocompatible              " be iMproved, required
filetype on
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins
syntax on
if !exists("g:syntax_on")
    syntax enable
endif
" Plugins {{{1 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()

" Operational {{{2
Plugin 'VundleVim/Vundle.vim'
Plugin 'mhinz/vim-startify'
Plugin 'mileszs/ack.vim'
Plugin 'mbbill/undotree'
Plugin 'terryma/vim-expand-region'
	let g:tex_flavor='latex'
	let g:vimtex_view_method='zathura'
	let g:vimtex_quickfix_mode=0
	let g:vimtex_compiler_progname = 'nvr'
" Color themes {{{2 
Plugin 'arcticicestudio/nord-vim'
Plugin 'ajmwagar/vim-deus'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
	let g:airline_theme="deus"
	let g:airline#extensions#whitespace#enabled=0
" Writing {{{2 
Plugin 'skywind3000/vim-keysound'
Plugin 'logico/typewriter-vim'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
	let g:limelight_conceal_ctermfg=1
" Markdown {{{3
Plugin 'suan/instant-markdown-d' 
Plugin 'suan/vim-instant-markdown'
	let g:instant_markdown_autostart = 0
	let g:instant_markdown_mathjax = 1
	"let g:instant_markdown_slow = 1
	let g:instant_markdown_autoscroll = 1
	let g:instant_markdown_python = 0
	let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
	let g:pandoc#syntax#conceal#use = 1
	let g:pandoc#folding#fdc = 0
" TEX {{{3 
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
	let g:UltiSnipsExpandTrigger = '<tab>'
	let g:UltiSnipsJumpForwardTrigger = '<tab>'
	let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
	let g:UltiSnipsSnippetsDir = "~/.vim/bundle/vim-snippets/UltiSnips"
Plugin 'lervag/vimtex'
Plugin 'KeitaNakamura/tex-conceal.vim'
	set conceallevel=2
	set concealcursor=nc
	let g:tex_conceal='abdmg'
	hi Conceal ctermbg=none
call vundle#end()            " required
" Colorscheme {{{1 
set t_Co=256
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark
colorscheme deus
let g:deus_termcolors=256
" Options {{{1 
" Normal options {{{2
set encoding=utf-8
set number
set autoread
set completeopt=longest,menuone
set wildmode=list:longest,full
set wildmenu                "turn on wild menu
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set magic " Make regex a little easier to type
set formatoptions=tacqwn   
"Show incomplete commands
set linespace=5
set backup
set backupdir=~/.vim/backups
set cul                       "highlight current line
hi CursorLine term=none cterm=none ctermbg=3      
set iskeyword+=:
let python_highlight_all=1
set ruler                     " show the line number on the bar
set more                      " use more prompt
set mouse=a
set hidden
set noautowrite               " don't automagically write on :next
set lazyredraw                " don't redraw when don't have to
set noshowmode
set autoindent 
set smartindent    						" auto/smart indent
set smarttab                  " tab and backspace are smart
set tabstop=3                 " 6 spaces
set shiftwidth=3
set softtabstop=4
set scrolloff=10				   " keep at least 10 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right
set history=200
set backspace=indent,eol,start
set linebreak
set cmdheight=1               " command line two lines high
set undolevels=1000           " 1000 undos
set updatecount=100           " switch every 100 chars
set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion
set ttyfast                   " we have a fast terminal
set noerrorbells              " No error bells please
set shell=bash
set fileformats=unix
set wildmode=longest:full
set wildmenu                  " menu has tab completion
let maplocalleader='`'        " all my macros start with ,
set laststatus=2
let mapleader = "`"
set confirm
set title
set relativenumber
" Enable folding
set foldmethod=marker
set foldlevel=99
set showcmd
set splitbelow
set splitright
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=2
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!

" Searching {{{2
set incsearch                 " incremental search
set ignorecase                " search ignoring case
set smartcase 
set hlsearch                  " highlight the search set showmatch 
set diffopt=filler,iwhite     " ignore all whitespace and sync
set matchtime=3
" # : jump forward word under cursor - default vim
" highlight current word under cursor but not Jump like *#
noremap <leader>3 :let @/ = expand('<cword>')<C-M>
noremap <leader># :let @/ = '\<'.expand('<cword>').'\>'<C-M> 

" Spelling {{{2
if v:version >= 700
  " Enable spell check for text files
  autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en
endif
:set spell spelllang=en_us

" Mappings {{{2 
map <S-u> :redo<CR>
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
" NERDTree
map <C-t> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowHidden=1  "  Always show dot files
" Useful extras
nnoremap '.  :exe ":FZF " . expand("%:h")<CR>
"" / = /
nnoremap '/  :e /<C-d>
"" b = buffers
"nnoremap 'b  :Buffers<cr>
" d = documents
nnoremap 'd  :FZF ~/Documents/<cr>
"" f = fzf
nnoremap 'f  :FZF<cr>
"" g = grep (ripgrep)
"nnoremap 'g  :Rg
"" h = home
nnoremap 'h  :FZF ~/<cr>
"" r = bashrc
nnoremap 'r  :e ~/.bashrc<cr>
"" v = vimrc
nnoremap 'v  :e $MYVIMRC<cr>
"" toggle last buffer
nnoremap ''  :b#<cr>
"" e = notes
nnoremap 'p  :InstantMarkdownPreview<cr>
nnoremap 'th  :tabfirst<CR>
nnoremap 'tj  :tabnext<CR>
nnoremap 'tk  :tabprev<CR>
nnoremap 'tl  :tablast<CR>
nnoremap 'tt  :tabedit<Space>
nnoremap 'tn  :tabnew<Space>
nnoremap 'tm  :tabm<Space>
nnoremap 'td  :tabclose<CR>
nnoremap 'ue  :UltiSnipsEdit<CR>
:map <F3> :r! date +"\%Y-\%m-\%d \%H:\%M:\%S"<cr>
hi! Normal ctermbg=NONE guibg=NONE
nnoremap <space> za
"vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
"    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
"omap s :normal vs<CR>
" Autocmd {{{2
augroup pandoc_syntax
        au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
        au! BufNewFile,BufFilePre,BufRead *.md colorscheme deus
augroup END
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
autocmd Filetype python nnoremap <buffer> <leader>m :w<CR>:vert ter python3 "%"<CR>
autocmd Filetype cpp nnoremap <buffer> <leader>m :w<CR>:!g++ % -o %< && ./%<<CR>

