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
nnoremap <leader>c :nohlsearch

" Search and Replace
nmap <Leader>s :%s//g<Left><Left>

" ------------------------------------------------------ 
""" Window split navigation 
" reference: https://vim.fandom.com/wiki/Switch_between_Vim_window_splits_easily


"Ctrl+kjhl navigation
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k

" Alt+arrow navigation
"nmap <silent> <A-up> :wincmd k<CR>
"nmap <silent> <A-Down> :wincmd j<CR>
"nmap <silent> <A-Left> :wincmd h<CR>
"nmap <silent> <A-Right> :wincmd l<CR>

" ------------------------------------------------------
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
""" Optional configs 

" Eliminate using additional keys
nnoremap ; :
" nnoremap Q @q

