" Install vim-plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

" Open NERDTree by default
au VimEnter *  NERDTree

call plug#begin()

" ==== Plugins ===================== {{{
" ==================================
Plug 'tpope/vim-surround'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'tpope/vim-fugitive' " git plugin
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'scrooloose/nerdcommenter'
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Color scheme
Plug 'gruvbox-community/gruvbox'

" Initialize plugin system
call plug#end()
" }}}

" ==== General ===================== {{{
" ==================================
set tabstop=2  " 2 space indents by default
set shiftwidth=2 " ...
set softtabstop=2 " ...
set encoding=utf-8 " Always use UTF8 encodding
set scrolloff=3 " Min. lines to keep above or below the cursor when scrolling
set autoindent " Auto indent new lines
set hidden " Don't unload buffers when leaving them
set visualbell " Disable annoying beep
set ruler " Show current cursor position
set relativenumber " Use relative line numbers
set number " Show current line number
set ignorecase " Ignore case when searching
set smartcase " Be case sensitive when there are capital letters
set gdefault " Globally replace be default
set incsearch " Start searching after first letter
set hlsearch " Highlight found search results
set splitbelow " Split below be default
set splitright " Split to the right by default
set pastetoggle=<F3> " Go into paste mode with F3
set nobackup " Don't make backups
set nowritebackup " Don't make backups
set noswapfile " Don't make swap files
set nowrap " Don't wrap lines
colorscheme gruvbox 
" }}}
"

" ==== Leader Mappings ============= {{{
" ==================================
let mapleader="\<Space>"
nmap <leader>n :NERDTreeFind<CR>
nnoremap <Leader>v :e $MYVIMRC<cr>
nnoremap <Leader>ve :source $MYVIMRC<cr>

" Telescope finder maps
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" }}}

"" ==== Mappings ==================== {{{
" ==================================
inoremap kj <ESC> 
nmap <C-n> :NERDTreeToggle<CR>
" Clear out highlights
nnoremap <C-x> :noh<CR> 
:nmap ; :
" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>
" Navigate between buffers
nnoremap <silent> [q :bnext<CR>
nnoremap <silent> ]q :bprevious<CR>
" Copy file path 
nnoremap <leader>cF :let @*=expand("%:p")<CR>
" }}

" ==== Plugin specific configs ============= {{{
" ==================================

" Make NERDTree prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" }}}
