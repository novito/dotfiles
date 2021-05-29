" Install vim-plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

" Open NERDTree by default
au VimEnter *  NERDTree

call plug#begin()

let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']

" ==== Plugins ===================== {{{
" ==================================
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive' " git plugin
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'scrooloose/nerdcommenter'
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
Plug 'christoomey/vim-tmux-navigator' " Tmux - Vim integration
Plug 'rking/ag.vim'

" Color scheme
Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()
" }}}

" ==== General ===================== {{{
" ==================================
"
set foldmethod=syntax " fold based on syntax
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " dont fold by default
set foldlevel=1 " this is just what i use
set modelines=0 " turn off modelines
set tabstop=2  " 2 space indents by default
set shiftwidth=2 " ...
set softtabstop=2 " ...
set expandtab " ...
set encoding=utf-8 " Always use UTF8 encodding
set scrolloff=3 " Min. lines to keep above or below the cursor when scrolling
set autoindent " Auto indent new lines
set hidden " Don't unload buffers when leaving them
set wildmenu " Enable command-line like completion
set wildmode=list:longest " List all matches and complete till longest common string
set visualbell " Disable annoying beep
set ruler " Show current cursor position
set backspace=indent,eol,start " Backspace over everything in insert mode
set laststatus=2 " Always show the status line
set relativenumber " Use relative line numbers
set number " Show current line number
set ignorecase " Ignore case when searching
set smartcase " Be case sensitive when there are capital letters
set gdefault " Globally replace be default
set incsearch " Start searching after first letter
set showmatch " Show the matching paren when hovering over one
set hlsearch " Highlight found search results
set splitbelow " Split below be default
set splitright " Split to the right by default
set winminwidth=5 " Windows can not get smaller than 5 columns
set winwidth=110 " Windows are set to 110 columns by default
set textwidth=79 " Wrap text around the 79 column
set formatoptions=qrn1 " Misc formating options
set colorcolumn=100 " Color the 100th column
set pastetoggle=<F3> " Go into paste mode with F3
set complete=.,b,u,] " Tab complete correctly
set t_Co=256 " Give me all the colors pls
set nobackup " Don't make backups
set nowritebackup " Don't make backups
set noswapfile " Don't make swap files
set list " Show unprintable characters
set listchars=tab:▸\  " Char representing a tab
set listchars+=extends:❯ " Char representing an extending line
set listchars+=precedes:❮ " Char representing an extending line in the other direction
set listchars+=nbsp:␣ " Non breaking space
set listchars+=trail:· " Show trailing spaces as dots
set showbreak=↪  " Show wraped lines with this char
set linebreak " Don't break lines in the middle of words
set fillchars+=vert:\  " Don't show pipes in vertical splits
set background=dark " I use a dark background
set nowrap " Don't wrap lines
set synmaxcol=300 " do not highlight very long lines
set cmdheight=2 " Give more space for displaying messages.
colorscheme gruvbox 
" }}}
"

" ==== Leader Mappings ============= {{{
" ==================================
let mapleader="\<Space>"
nmap <leader>n :NERDTreeFind<CR>
nnoremap <Leader>v :e $MYVIMRC<cr>
nnoremap <Leader>ve :source $MYVIMRC<cr>
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
" Ag
nnoremap \ :Ag<SPACE>
" }}

" ==== Plugin specific configs ============= {{{
" ==================================

" Look for all the files in CtrlP
let g:ctrlp_max_files=0
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Make NERDTree prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" }}}

set mouse=a " allow using mouse to resize windows
