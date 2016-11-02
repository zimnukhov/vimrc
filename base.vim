syntax on

set number

" remove compatibility with vi
set nocompatible

" prevent some exploits in modelines
set modelines=0

" use jj to exit insert mode
inoremap jj <Esc>

" use space as leader key
let mapleader = " "

" F mappings
map <F2> <Esc>:set mouse=a<CR>
map <F3> <Esc>:set mouse=<CR>
map <F6> <Esc>A<CR>import pdb;pdb.set_trace()<Esc>
map <F7> :s:^:#<CR>:noh<CR>
map <F8> :e ++enc=cp1251<CR>

" move on wrapped lines
nnoremap j gj
nnoremap k gk

" no shift
nnoremap ; :

" tab navigation
" hl:
nnoremap <C-L> gt
nnoremap <C-H> gT

" arrows:
map <S-Left> gT
map <S-Right> gt

" splits
" splits navigation
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

" open vertical split to the right
set splitright

" highlight cursor line
set cursorline

" tab settings
set shiftwidth=4
set tabstop=4
set expandtab
set autoindent

" better indentation for python
filetype indent on

" cindent is still needed for some files (e.g. .proto)
set cindent

let python_highlight_all = 1

" use one level of indentation after open parenthesis
let g:pyindent_open_paren = '&sw'

" search
set hlsearch
highlight Search ctermfg=black
inoremap <tab> <C-n>
highlight Pmenu ctermfg=1 ctermbg=4 guibg=grey30
highlight PmenuSel ctermfg=4 ctermbg=1
set ignorecase

" double slash to search for visually selected text
vnoremap // y/<C-R>"<CR>

" use /g in substitution by default
" set gdefault

" restore cursor position
set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
    if line("'\"") <= line("$")
      normal! g`" 
      return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END 

" swap directory
set directory=~/.vim/swap//
set directory+=.

" undo files
if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
endif
set undodir=~/.vim/undo//
set undofile

" backup files
if isdirectory($HOME . '/.vim/backup') == 0
    :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir=~/.vim/backup//
set backup

" shows number of selected lines in visual line mode and other stuff
set showcmd

cnoreabbrev tn tabnew

" tree view in file explorer
let g:netrw_liststyle=3

