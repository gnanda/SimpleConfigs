set nocompatible

" Other stuff
set expandtab  
set tabstop=4  
set shiftwidth=4  
set autoindent  
set smartindent  
set bg=dark  
set nowrap  

set title
set number
set ruler
set relativenumber

set scrolloff=4
set sidescrolloff=8

set undofile
set undodir=~/.vimlocal/undo
set nobackup
set dir=~/.vimlocal/swap

set wildmenu
set wildmode=list:longest
set wildchar=<Tab>

set ignorecase
set incsearch
set hlsearch
set smartcase

set matchpairs+=<:>
set nowrap
set virtualedit=onemore,block


" Extra stuff
set colorcolumn=+1
highlight ColorColumn ctermbg=darkgrey
nnoremap <C-M> :nohlsearch<CR><C-M>
" let g:mapleader = "\<space>"
" let mapleader = g:mapleader

vnoremap / /\v
nnoremap / /\v
vnoremap ? ?\v
nnoremap ? ?\v

" imap jk <Esc> 
inoremap jk <Esc>

" Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

nnoremap Y y$
" noremap <silent> <Space> :silent nohl<Bar>echo<CR>

function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

if &term =~ '^\(xterm\|screen\|screen-256color\|rxvt\|rxvt-unicode\)' && $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

filetype plugin indent on
syntax on
