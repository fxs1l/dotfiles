"Initiate neovim plugins
call plug#begin()
""" Colorschemes """
Plug 'arcticicestudio/nord-vim'
"Plug 'drewtempelmeyer/palenight.vim'

""" Editing """
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-sleuth'
Plug 'lukas-reineke/indent-blankline.nvim'

""" Neovim utilities """
Plug 'ryanoasis/vim-devicons'
Plug 'vimlab/split-term.vim'
Plug 'lambdalisue/suda.vim'
Plug 'preservim/nerdtree'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
call plug#end()

" ---------- General options ------------------
" Map the leader key to SPACE
let mapleader="\<SPACE>"

" Sync neovim to X11 clipboard
set clipboard+=unnamedplus

" --------- Colorscheme configuration --------

" set background=dark
colorscheme nord 

if (has("termguicolors"))
  set termguicolors
endif

" Italics for my favorite color scheme
" let g:palenight_terminal_italics=1

" ------------ Line numbering configuration ------------
set number 

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

" --------------- Search configuration -----------------

set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.

" Use <leader>c to clear the highlighting of :set hlsearch.
nnoremap <leader>c :nohlsearch <CR>

" Search and Replace
nmap <Leader>s :%s//g<Left><Left>

" --------------- Window navigation --------------------

" reference: 
" https://vim.fandom.com/wiki/Switch_between_Vim_window_splits_easily

" Ctrl+kjhl navigation
"nmap <c-h> <c-w>h
"nmap <c-l> <c-w>l
"nmap <c-j> <c-w>j
"nmap <c-k> <c-w>k

" Alt+arrow navigation
nmap <silent> <A-up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" Increase window height 
nmap <s-l> :wincmd < <CR>
nmap <s-h> :wincmd > <CR>
nmap <s-k> :wincmd + <CR>
nmap <s-j> :wincmd - <CR>

" Switch window positons
nmap <s-r> :wincmd r <CR> 

" Switch to next buffer"
nmap <a-right> :bnext <CR>
nmap <a-left> :bprevious <CR>

" Close buffer
nmap <s-w> :bd <CR>

"----------- NERDTree configuration ---------------------

" Toggle NERDTree window
nnoremap <c-o> :NERDTreeToggle<CR>

" Start NERDTree when Vim is started without file arguments.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" ------------- Suda configuration --------------------

cnoremap w!! :SudaWrite <CR>

"------------- Airline configuration ------------------

"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline_symbols = {}
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ' ln:' 
"let g:airline_symbols.maxlinenr = ' '
"let g:airline_symbols.dirty='⚡'
"let g:airline_theme= 'palenight'
"let g:airline_symbols.linenr = '☰'
"  

"---------- Split-term configuration -------------------

set splitbelow
set splitright
noremap <C-T> :5Term <CR>

"-------- Indent blankhine configuration ---------------

let g:indent_blankline_filetype_exclude = ['help']
let g:indentLine_setColors=0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2

"--------------- Optional configs ---------------------

" Allow the use of the mouse
" set mouse=a

" Eliminate using additional keys
" nnoremap ; :
" nnoremap Q @q
