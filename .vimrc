if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'
Plug 'altercation/vim-colors-solarized'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

filetype plugin indent on
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab

set number
set title

let mapleader = ","
let g:mapleader = ","

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_show_hidden = 1

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
let g:deoplete#enable_at_startup = 1

inoremap <Up> <NOP>
vnoremap <Up> <NOP>
inoremap <Down> <NOP>
vnoremap <Down> <NOP>
inoremap <Left> <NOP>
vnoremap <Left> <NOP>
inoremap <Right> <NOP>
vnoremap <Right> <NOP>

" Buffer switching
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>

nnoremap <leader>b :ls<CR>:b<Space>

" Maintain undo history between sessions
set undofile 
set undodir=~/.vim/undodir

nnoremap <leader>w :w<cr>

syntax enable
set background=dark
let g:solarized_termtrans = 1 " This gets rid of the grey background
colorscheme solarized

let g:ale_fixers = {
      \'javascript': ['prettier-standard', 'eslint'],
      \'ruby': ['rubocop']
      \}

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_fix_on_save = 1
nmap <leader>d <Plug>(ale_fix)
