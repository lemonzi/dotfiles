"
" VUNDLE
"

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" list of plugins
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'nanotech/jellybeans.vim'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'Townk/vim-autoclose'
Plugin 'airblade/vim-gitgutter'
Plugin 'mileszs/ack.vim'
Plugin 'majutsushi/tagbar'
Plugin 'ciaranm/detectindent'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'groenewege/vim-less'
Plugin 'alexdavid/vim-min-git-status'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'xolox/vim-easytags'

call vundle#end()            " required

filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

"
" CUSTOM
"

filetype plugin on

"set background=dark
"colorscheme solarized
colorscheme jellybeans
set cursorline
set smartcase
set hidden
set ruler
set number
set t_Co=256
"set tw=80
set mouse=a
set nobackup
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set wildignorecase
"set expandtab
"set shiftwidth=4
"set softtabstop=4
"set tabstop=4
"set shiftwidth=4

" Airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" VimGrep configuration
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" NERDTree configuration
" if (&columns > 100)
"     autocmd VimEnter * NERDTree
"     autocmd VimEnter * wincmd p
" endif

" VimMarkdown configuration
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1

" Quit when only the NERDTree window is present
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Detect indent automatically
:autocmd BufReadPost * :DetectIndent 
:let g:detectindent_preferred_indent = 4

" key bindings
nnoremap <Leader>kws :%s/\s\+$//<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

