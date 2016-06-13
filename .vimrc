" set nocompatible
" set diffexpr=MyDiff()
" function MyDiff()
"   let opt = '-a --binary '
"   if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"   if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"   let arg1 = v:fname_in
"   if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"   let arg2 = v:fname_new
"   if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"   let arg3 = v:fname_out
"   if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"   let eq = ''
"   if $VIMRUNTIME =~ ' '
"     if &sh =~ '\<cmd'
"       let cmd = '""' . $VIMRUNTIME . '\diff"'
"       let eq = '"'
"     else
"       let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"     endif
"   else
"     let cmd = $VIMRUNTIME . '\diff'
"   endif
"   silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
" endfunction

" czcionka
set guifont=Meslo\ LG\ S\ for\ Powerline\ 10
" set guifont=Monaco\ for\ Powerline\ 10
"set guifont=Terminess\ Powerline\ 9

" elementy gui
set guioptions=aegit
set guioptions-=a
set guioptions-=A
set guioptions-=aA

" kodowanie
set encoding=utf-8
set fileencoding=utf-8

" usuwa wiadomoÅ›Ä‡ powitalnÄ…
set shortmess=aI

" omnicompletion
filetype plugin on
au FileType php setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType c setl ofu=ccomplete#CompleteCpp
au FileType css setl ofu=csscomplete#CompleteCSS

" zmiana jÄ™zyka na angielski
" language English_United States

" domyÅ›lny folder
" cd E:/ 

" NERDTree bind
map <F6> :NERDTreeToggle<CR>

" pathogen
"call pathogen#infect() 

" pokaz numery linijek
set number

" EOL w zjebanych plikach
" set fileformats+=dos
" set filetype+=dos
" autocmd FileType php setlocal noeol binary fileformat=dos
set noeol

" ukrywa bufory zamiast zamykania ich
set hidden

" kopiuje poprzedniÄ… indentacje
set copyindent

" skok do nawiasu
set showmatch

" ignoruje wielkosc liter przy wyszukiwaniu
set ignorecase
set smartcase

set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you typet
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set titlestring=Vim                " change the terminal's title
" set visualbell           " don't beep slow scroll dont turn this on
" set noerrorbells         " don't beep

" taby
set tabstop=4
set shiftwidth=4
" set expandtab
set autoindent
" tabs vs spaces

" nnoremap ; :


" sort css
map <leader>s ?{<CR>jV/^\s*\}\=$<CR>k:sort<CR>:let @/=''<CR>

" highlight 80th column (slow)
" hi ColorColumn ctermbg=lightgrey guibg=lightgrey
" set cc=80

" ctrl+p
" cmd+t
map <C-p> :CommandT<CR>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

set modelines=0
set wildmenu
set wildmode=list:longest
set showmode
set showcmd
set ruler
set undofile " undo changes after closing editor

" backspace
set backspace=2
set backspace=indent,eol,start

" podwojne j wraca do normal mode
inoremap jj <ESC>

" js beautifly
nnoremap <leader>ff :%!js-beautify -j -q -B -f -<CR>

syntax enable
" set background=dark

" F5 - zmiana schematu kolorÃ³w: light/dark
" call togglebg#map("<F5>")

" powerline
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" airline fonts
let g:airline_powerline_fonts = 1

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
let base16colorspace=256

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" plugins below
Plugin 'gmarik/vundle'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tcomment_vim'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
" Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
" Plugin 'godlygeek/tabular'

Plugin 'altercation/vim-colors-solarized'
Plugin 'w0ng/vim-hybrid'
Plugin 'tomasr/molokai'
Plugin 'duythinht/vim-coffee'
Plugin 'MaxSt/FlatColor'

Plugin 'tpope/vim-fugitive'
" Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'nvie/vim-flake8'
Plugin 'fatih/vim-go'
" Plugin 'joonty/vdebug' 
Plugin 'airblade/vim-gitgutter'
Plugin 'davidhalter/jedi-vim'
Plugin 'morhetz/gruvbox'
Plugin 'python-rope/ropevim'

let ropevim_vim_completion=1
" rope

autocmd BufNewFile,BufReadPost *.go set filetype=go
" set filetype for go files

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_enable_highlighting=0
let g:syntastic_python_flake8_post_args='--ignore=E302'
let g:syntastic_disabled_filetypes=['php']

" by default turn off syntastic use ctrl-w E to toggle between
" enabled/disabled
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>e :SyntasticToggleMode<CR>

filetype plugin indent on

" temporary files location
set backupdir=~/.vimtmp
set dir=~/.vimtmp
set undodir=~/.vimtmp

"speed?
set ttyfast " u got a fast terminal
" set ttyscroll=3
" set lazyredraw " to avoid scrolling problems
" Syntax coloring lines that are too long just slows down the world
" set synmaxcol=128

set ttimeoutlen=100 " escape fix for nvim

" motyw
" set t_ut=
colors hybrid

" fix theme bracket colors ()
" hi MatchParen ctermfg=189 ctermbg=60 " change color
let loaded_matchparen = 1 " disable

set background=dark
" let g:molokai_original = 1
" colors molokai
" let g:hybrid_use_Xresources = 1
" let g:badwolf_darkgutter = 1
