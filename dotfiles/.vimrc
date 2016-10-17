" VIM configuration file
" Part of the lemonzi/dotfiles distribution

set nocompatible              " be iMproved

"
" VUNDLE PLUGINS
"

filetype off                  " required for plugins to work
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Base
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-sensible'

" Color scheme
Plugin 'nanotech/jellybeans.vim'

" Git integration
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'alexdavid/vim-min-git-status'
Plugin 'gregsexton/gitv'

" Prose
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'reedes/vim-pencil'
Plugin 'reedes/vim-lexical'
Plugin 'plasticboy/vim-markdown'

" Helpers for weird languages
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/MatlabFilesEdition'
Plugin 'djoshea/vim-matlab-fold'
Plugin 'groenewege/vim-less'

" Tags
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'

" File navigation
Plugin 'mileszs/ack.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'EinfachToll/DidYouMean'
Plugin 'tpope/vim-eunuch'

" Custom text objects
Plugin 'kana/vim-textobj-user'
Plugin 'reedes/vim-textobj-sentence'
Plugin 'glts/vim-textobj-comment'
Plugin 'kana/vim-textobj-indent'
" Plugin 'thinca/vim-textobj-between'
" Plugin 'gaving/vim-textobj-argument'
Plugin 'wellle/targets.vim'

" Motions, completions, and syntax checks
Plugin 'tpope/vim-unimpaired'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sleuth'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
Plugin 'jeaye/color_coded'

call vundle#end()

"
" PLUGIN SETTINGS
"

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
let g:indent_guides_start_level = 2
let g:syntastic_always_populate_loc_list = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1
let g:pencil#wrapModeDefault = 'soft'
let g:limelight_conceal_ctermfg = 241
let g:tagbar_type_matlab = {
    \ 'ctagstype' : 'matlab',
    \ 'kinds' : ['f:functions', 'v:variables']
\ }
let g:easytags_async = 1
let g:easytags_auto_update = 1
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
let g:SimpylFold_docstring_preview = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let NERDTreeIgnore=['\.pyc$', '\~$']
let g:Gitv_DoNotMapCtrlKey = 1

"
" AUTOCOMMANDS
"

" Open NERDTree if the terminal is wide enough
"if (&columns > 100)
"    autocmd VimEnter * NERDTree
"    autocmd VimEnter * wincmd p
"endif

" Close the NERDTree if it's the only remaning window
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Autoload Pencil
augroup pencil
    autocmd!
    autocmd FileType markdown,mkd,text,tex call pencil#init()
    autocmd FileType markdown,mkd,text set nocursorline
    autocmd FileType markdown,mkd,text,tex call textobj#sentence#init()
augroup END

"
" CUSTOM BUILTIN SETTINGS
"

colorscheme jellybeans
set cursorline
set ignorecase
set wildignorecase
set hidden
set number
set list  " Display trailing whitespace
set t_Co=256
set term=screen-256color
set mouse=a
set nobackup
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set clipboard=unnamed
set pastetoggle=<F2>
set foldmethod=syntax
set foldlevelstart=5
set foldnestmax=4
set colorcolumn=80
let python_highlight_all = 1

"
" CUSTOM KEY BINDINGS
"

" Split navigation
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <tab> <C-w>w
nnoremap <backspace> <C-w>W

" Easier commands
nnoremap ; :

" Enable folding with the spacebar
nnoremap <space> za

" Toggle spell checking on and off with \s
nnoremap <leader>s :setlocal spell! spelllang=en_us<CR>

" YouCompleteMe mappings
nnoremap <leader>d :YcmCompleter GoTo<CR>
nnoremap <leader>h :YcmCompleter GetDoc<CR>
nnoremap <leader>x :YcmCompleter FixIt<CR>:ccl<CR>

" Search current search in all files with \F
nnoremap <leader>F :AckFromSearch<CR>

" Git shortcuts (all of them start with \g)
nnoremap <leader>gs :Gministatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gl :Gitv --all<CR>
nnoremap <leader>gm :Gblame<CR>
nnoremap <leader>ga :Gwrite<CR>

" Insert-mode magic
inoremap ; <End>;
inoremap ;; ;
inoremap ;<Space> ;<Space>

" Insert end at the line below (super-handy for MATLAB)
nnoremap <leader>e oend<ESC>

" Insert newline after cursor position, move to it, and remain in normal mode.
nnoremap <leader><return> o<ESC>

"
" COMMON TYPOS
"

iab funciton function
iab funtcion function
iab edn end
iab opne open
iab dont don't
iab doesnt doesn't
iab arent aren't
iab wont won't
iab isnt isn't

"
" FOOTER
"

" FileType-specific settings override anything specified here.
filetype plugin indent on
