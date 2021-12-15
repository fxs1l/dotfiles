"Initiate neovim plugins
call plug#begin()
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-sleuth'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'vimlab/split-term.vim'
call plug#end()

" ------------------------------------------------------

" Map the leader key to SPACE
let mapleader="\<SPACE>"

" ------------------------------------------------------
""" Line numbering
set number " Enable line numbering

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
" ------------------------------------------------------
""" Search configuration

set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.

" Use <leader>c to clear the highlighting of :set hlsearch.
nnoremap <leader>c :nohlsearch <CR>

" Search and Replace
nmap <Leader>s :%s//g<Left><Left>

" ------------------------------------------------------ 
""" Window navigation
" reference: 
" https://vim.fandom.com/wiki/Switch_between_Vim_window_splits_easily

" Ctrl+kjhl navigation
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k

" Alt+arrow navigation
"nmap <silent> <A-up> :wincmd k<CR>
"nmap <silent> <A-Down> :wincmd j<CR>
"nmap <silent> <A-Left> :wincmd h<CR>
"nmap <silent> <A-Right> :wincmd l<CR>

" Increase window height 
nmap <s-l> :wincmd < <CR>
nmap <s-h> :wincmd > <CR>
nmap <s-k> :wincmd + <CR>
nmap <s-j> :win cmd - <CR>

" Switch window positons
function! SwitchWindow()
  CHADopen
  :wincmd r <CR>
  CHADopen
endfunction
nmap <s-r> call: SwitchWindow() <CR> 

"Switch to next buffer"
nmap <a-right> :bnext <CR>
nmap <a-left> :bprevious <CR>
"------------------------------------------------------
""" CHAD Tree configuration 

" Toggle CHADTree window
nnoremap <c-o> <cmd>CHADopen<cr>

" Start CHADTree without the focus on the sidebar 
"autocmd VimEnter * CHADopen --nofocus 

" Start CHADTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
if argc() > 0 || exists("s:std_in") 
  autocmd VimEnter * CHADopen --nofocus
endif


" Exit Vim if CHADtree is the only window remaining 
autocmd BufEnter * if (winnr("$") == 1 && &filetype == "CHADTree") | q | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
" autocmd BufEnter * if bufname('#') =~ 'CHADTree\d\+' && bufname('%') !~ 'CHADTree\d\+' && winnr('$') > 1 |
"     \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif


" ------------------------------------------------------
""" Airline configuration

let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_theme= 'atomic'

"------------------------------------------------------
""" Split-term configuration

set splitbelow
set splitright
noremap <C-T> :5Term <CR>

"------------------------------------------------------
""" Indent blackine configuration
let g:indent_blankline_filetype_exclude = ['help']

"------------------------------------------------------
""" Optional configs 

" Allow the use of the mouse
set mouse=a

" Eliminate using additional keys
" nnoremap ; :
" nnoremap Q @q

