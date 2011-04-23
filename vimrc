" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set termencoding=utf-8
set encoding=utf-8
set fileformats=unix
set clipboard+=unnamed

set backspace=indent,eol,start
set isk+=_,$,@,%,#,-

set nolist                      " don't show invisible characters by default
set listchars=tab:»·,trail:·,extends:#,nbsp:·
set pastetoggle=<F2>            " when in insert mode, press <F2> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented

filetype plugin indent on
syntax on

" Search options
set hlsearch
set incsearch
set ignorecase
set smartcase
" ctrl-n clears search higlight
nmap <silent> <C-n> :noh<CR>

" Formatting
set autoindent
set smartindent
set shiftwidth=2
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set tabstop=2
set softtabstop=2
set expandtab
set foldcolumn=2
set foldlevelstart=99

" UI
colorscheme desert
set guioptions=Acgtm
set guifont=DejaVu_Sans_Mono:h12
set wildmenu
set mouse=a
set noerrorbells
set cmdheight=3
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2
set showmatch                   " set show matching parenthesis
set lazyredraw                  " don't update the display while executing macros

" Other options
set ruler
set number
set numberwidth=3
set sessionoptions+=resize
set browsedir=buffer
set completeopt-=preview

" Disable backups
set nobackup
set noswapfile

" Mappings
let mapleader=","

" Go to next tab
map <c-tab> gt<cr>
" Sudo to write
cmap w!! w !sudo tee % >/dev/null
" Remove trailing whitespace and ^M from code
cmap trim %s/[ \r\t]\+$//g

" C syntax options
let c_space_errors=1
let c_no_comment_fold=1

" Doxygen
let g:load_doxygen_syntax=1
let g:doxygen_enhanced_color=1

" netrw
let g:netrw_silent=1

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
