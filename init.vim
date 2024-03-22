set guicursor=
set scrolloff=8
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

call plug#begin('~/.vim/plugged')
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'ayu-theme/ayu-vim'
call plug#end()

set termguicolors     " enable true colors support
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

let mapleader = " "
nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
nnoremap <leader>o :copen<CR>
inoremap jk <esc>
nnoremap <leader>q :q<CR>
nnoremap <leader>p o<esc>P<CR>
nnoremap <leader>pk o<esc>Pk<CR>
nnoremap <leader>pj o<esc>Pj<CR>

inoremap <c-s> <ESC>:w<CR>
nnoremap <c-s> :w<CR>
vnoremap <leader>p "_dP
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

