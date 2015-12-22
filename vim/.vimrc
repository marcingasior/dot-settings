" set line numbers"
set nu
" set files encoding
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

" replace tab with spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent


set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell

" set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start

" enable mouse"
set mouse=a


syntax enable
syntax on

" set leader to be ','"
let mapleader = ","

" no menus, scrollbars, or other junk
set guioptions=

" disable backup and swap files
set nobackup
set noswapfile

" use the OS clipboard
set clipboard=unnamed

" store more command history
set history=100 " Store more history (default is 20)
" store a bunch of undo history
set undolevels=400

" enable spell checking
set spell
" allow buffer switching without saving
set hidden



"Show matching brackets/parenthesis
set showmatch
"Don't blink
set matchtime=0
"Find as you type search
set incsearch
"Highlight search terms
set hlsearch
"Windows can be 0 line high
set winminheight=0
"Case insensitive search
set ignorecase
"Case sensitive if we type an uppercase
set smartcase

function! DiffWithFileFromDisk()
    let filename=expand('%')
    let diffname = filename.'.fileFromBuffer'
    exec 'saveas! '.diffname
    diffthis
    vsplit
    exec 'edit '.filename
    diffthis
endfunction

let Tlist_Use_Right_Window   = 1
let @t='>>j'
nmap <Leader>j :CommandTJump<CR>
nmap <Leader>l : set list!<CR>
nmap <Leader>k :call DiffWithFileFromDisk()<CR>
nmap <Leader>f :Ack 
nmap <Leader>g :Tlist<CR>
nmap <Leader>r :TagbarToggle<CR>
nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>z :FufFile<CR>
nmap <Leader>e :Explore<CR>
nmap <Leader>w :bp\|bd #<CR>
nmap <Leader>q <C-W>q<CR>
nmap <Leader>Q :qa!<CR>
nmap <Leader>c :diffthis<CR>
nmap <Leader>o :diffoff!<CR>

let showmarks_enable = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatusFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['jshint']


""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_theme             = 'powerlineish'
let g:airline_powerline_fonts = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim/js-beautifier
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json 
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx 
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>


"start plugin manager"
call plug#begin('~/.vim/plugged')
Plug 'avakhov/vim-yaml'
Plug 'bling/vim-airline'

" L9 is dependency for fuzzy finder "
Plug 'eparreno/vim-l9'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'
Plug 'maksimr/vim-jsbeautify'
Plug 'majutsushi/tagbar'
Plug 'moll/vim-node'
Plug 'mustache/vim-mustache-handlebars'
Plug 'pangloss/vim-javascript'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-leiningen'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'vim-scripts/FuzzyFinder'
" Plug 'wincent/Command-T'
" Plug 'vim-scripts/ShowMarks'
" Plug 'ervandew/supertab'
" Plug 'vim-scripts/taglist.vim'
" 

  if $COLORTERM == 'gnome-terminal' || $TERM == 'xterm' || $TERM == 'screen'
    set t_Co=256
  endif

  try
    colorscheme Monokai
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme desert  
  endtry
call plug#end()


