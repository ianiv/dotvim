" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set termencoding=utf-8
set encoding=utf-8
set fileformats=unix
set clipboard+=unnamed

set backspace=indent,eol,start
set isk+=_,$,@,%,#,-

nmap <leader>l :set list!<CR>
set nolist                      " don't show invisible characters by default
set listchars=tab:▸\ ,eol:¬,trail:·,extends:#,nbsp:·
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
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set foldcolumn=2
set foldlevelstart=99

" UI
"colorscheme desert
set t_Co=16
set background=dark
colorscheme solarized
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

" Go to next tab
map <c-tab> gt<cr>
" Sudo to write
cmap w!! w !sudo tee % >/dev/null

" C syntax options
let c_space_errors=1
let c_no_comment_fold=1

" Doxygen
let g:load_doxygen_syntax=1
let g:doxygen_enhanced_color=1

" netrw
let g:netrw_silent=1

" Command-T
let g:CommandTMaxHeight=10

function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" Remove trailing whitespace and ^M from code
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
cmap trim :call Preserve("%s/\\s\\+$//e")

" Re-indent whole file
nmap _= :call Preserve("normal gg=G")<CR>
