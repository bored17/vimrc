let g:mapleader=" "
set t_Co=256
set number
set norelativenumber
set cursorline
set wrap
set showcmd
set wildmenu
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
set cindent "C"
set shiftwidth=4

" set mouse=anv 
"
set ts=4
set expandtab
set autoindent

    

set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse -=a
set encoding=utf-8
set backspace=indent,eol,start
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>
noremap h i
noremap  H I

noremap i k
noremap j h
noremap k j

noremap I 5k
noremap K 5j
noremap L 5l
noremap J 5h

noremap sl :set splitright<CR>:vsplit<CR>
noremap sj :set nosplitright<CR>:vsplit<CR>

noremap si :set nosplitbelow<CR>:split<CR>
noremap sk :set splitbelow<CR>:split<CR>

noremap nn ==

map <LEADER>l <C-w>l
map <LEADER>j <C-w>h
map <LEADER>i <C-w>k
map <LEADER>k <C-w>j

map ti : tabe<CR>
map tl :+tabnext<CR>
map tj :-tabnext<CR>

map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

map s <nop>
map W :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>


call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Auto Complete
"Plug 'Valloric/YouCompleteMe'
Plug 'neoclide/coc.nvim'
"pairs
Plug 'jiangmiao/auto-pairs'


Plug 'tpope/vim-commentary'

"wild
Plug 'gcmt/wildfire.vim'

Plug 'tpope/vim-surround'

"snippets
Plug 'SirVer/ultisnips'


Plug 'honza/vim-snippets'


Plug 'itchyny/vim-cursorword'

Plug 'sickill/vim-monokai'

" Plug 'Yggdroot/indentLine'


Plug 'connorholyday/vim-snazzy'

Plug 'joshdick/onedark.vim'


call plug#end()
set background=dark
set t_Co=256
colorscheme onedark 
highlight Normal guibg=NONE ctermbg=None
"NERDTree
"
map tt :NERDTreeToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=1

"coc.vim
"let g:coc_global_extensions=[
"            \'coc-json',
"            \'coc-vimslp']

set hidden
set shortmess+=c
set updatetime=100

if has("patch-8.1.1564")
    set signcolumn=number
else
    set signcolumn=yes
endif

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction


nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


autocmd CursorHold * silent call CocActionAsync('highlight')




nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)]
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)









"ultisnips
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-r>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

"color 



