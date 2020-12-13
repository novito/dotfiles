" this will install vim-plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif
    
call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']

Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
" color scheme
Plug 'morhetz/gruvbox'
Plug 'Raimondi/delimitMate'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'peitalin/vim-jsx-typescript'
Plug 'HerringtonDarkholme/yats.vim'
    
call plug#end()

" ==== General ===================== {{{
" ==================================

filetype plugin indent on
syntax enable
set tabstop=2  " 2 space indents by default
set shiftwidth=2 " ...
set softtabstop=2 " ...
set expandtab " ...
set undofile " Save a file of all of the undos
set undolevels=1000 " Maximum number of changes that can be undone
set encoding=utf-8 " Always use UTF8 encodding
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
set complete=.,b,u,] " Tab complete correctly
set list " Show unprintable characters
set listchars=tab:▸\  " Char representing a tab
set listchars+=extends:❯ " Char representing an extending line
set listchars+=precedes:❮ " Char representing an extending line in the other direction
set listchars+=nbsp:␣ " Non breaking space
set listchars+=trail:· " Show trailing spaces as dots
set showbreak=↪  " Show wraped lines with this char
set linebreak " Don't break lines in the middle of words
set fillchars+=vert:\  " Don't show pipes in vertical splits
set nowrap " Don't wrap lines
set synmaxcol=300 " do not highlith very long lines
set guitablabel=\[%N\]\ %t\ %M  "show file name and whether it has been modified
" configs recommended by coc nvim
set nobackup
set nowritebackup
" color scheme configs
set background=dark 
colorscheme gruvbox
" }}}

" ==== Mappings ==================== {{{
" ==================================

" `noremap` means to make a nonrecursive mapping
" that means that vim will not take other mapping
" into account when doing your new map

" Disable useless and annoying keys
noremap Q <Nop>

" Remap :E to :e
cnoreabbrev <expr> E getcmdtype() == ":" && getcmdline() == "E" ? "e" : "E"
" Remap :W to :w
cnoreabbrev <expr> W getcmdtype() == ":" && getcmdline() == "W" ? "w" : "W"

" Remap semicolon to colon
:nmap ; :

" Clear out highlights
nnoremap <c-l> :noh<cr>

" Always use very magic regex mode when searching
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v

" Personal prefrence, use tab so switch between open / closing braces
nnoremap <tab> %
vnoremap <tab> %

" Resize windows with the arrow keys
nnoremap <up> <C-W>+
nnoremap <down> <C-W>-
nnoremap <left> 3<C-W>>
nnoremap <right> 3<C-W><

" Don't use those stupid arrow keys!
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Don't need help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Fast escapes. If your would like Eric to pair with you, you need at least jj
inoremap jj <ESC>
inoremap jk <ESC>
inoremap kj <ESC>
" }}}

" Nerdtree
map <C-n> :NERDTreeToggle<CR>

" ==== Leader Mappings ============= {{{
" ==================================

" Peronal pref: Use comma for leader key
let mapleader=","

" Clear out highlights
nnoremap <leader><space> :noh<cr>

" Coc nvim settings
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" }}}
