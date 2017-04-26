set nocompatible " Stops vim from behaving in a strongly vi-compatible way.
filetype off

" -------- Vundle! --------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required! 
Plugin 'VundleVim/Vundle.vim'

" My Bundles here:
"
" original repos on github
Plugin 'https://github.com/tpope/vim-vividchalk.git'
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'AutoComplPop'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'https://github.com/scrooloose/syntastic'
Plugin 'https://github.com/godlygeek/tabular'
Plugin 'https://github.com/tpope/vim-unimpaired'
Plugin 'https://github.com/itspriddle/vim-marked'
Plugin 'pangloss/vim-javascript'

call vundle#end()

" vim-scripts repos

" non github repos
" ...
" -------- end --------

syntax on " Turn on Syntax Highlight

filetype plugin indent on " Turn on file type detection

colorscheme vividchalk " Change Color scheme in ~/.vim/colors folder
" colorscheme vimgirl " Change Color scheme in ~/.vim/colors folder


set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/mobile/js/web/* " ctrlp ignores

set pastetoggle=<C-z>

set showcmd " Display Commands on screen bottom right
set showmode " Display current mode: insert, replace, normal?

set backspace=indent,eol,start " Allow Backspacing over autoIndent, line breaks(join lines), and over start of insert

set hidden " Fix- Vim refuse to hide buffers because they contain changes

set wildmenu " Enables menu at bottom of vim/gvim window
set wildmode=list:longest,full " When completion in command line via tab, completions will show

set ignorecase " Case insensitive searching
set smartcase " Case-Sensitive if expression has capital letter

set smartindent " Auto Indent when hit Enter

set number " Show Line Numbers
set ruler " Show Cursor Position

set incsearch " Highlight matches as you type
set hlsearch " Highlight matches

set wrap " Search wrap- research from top when hit end of file
set so=10 " Set at least lines visible above or below cursor. large offset = vertically centered

set title " Screen title to currently opened file

set visualbell " Vim flash screen instead of beep on error

set nobackup " Don't make backup before overwriting file
set nowritebackup

set directory=$HOME/.vim/tmp//,. " Keep swap files in one location

set tabstop=2 " 2 spaces for a tab
set expandtab " Use space whenever tab is pressed
set shiftwidth=2 " Change number of space chars inserted for indentation

set laststatus=2 " Always show the status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%m/%d/%y\ -\ %H:%M\")}
" Status line: format, type, cursor position, % complete, date, and time

"In Macvim, disable GUI
if has("gui_running")
  set guioptions=egmrt
endif

"Type fast, :W instead of :w fix.
:ca W w
:ca Q q

"code folding
set foldmethod=indent
set foldnestmax=5 " sometimes fold may define too many folds
set nofoldenable " don't fold by default
set foldlevel=1 " depth of folds to be displayed

"leader key
let mapleader=","

" html tag format after hitting Enter
" i,n,o means insert mode, normal mode, o mode?
inoremap <expr> <CR> '<CR>' . (search('\V>\%#<','bcn') ? '<Esc>O' : '')
nnoremap <leader>m :silent !open -a Marked\ 2.app '%:p'<cr>

" Copy to clipboard
map <C-c> y:e ~/copybufferforvimclipboard<CR>P:w !pbcopy<CR><CR>:bdelete!<CR>
map <C-d> :r !pbpaste<CR><CR>

autocmd BufNewFile,BufRead *.scss setlocal filetype=css
" autocmd FileType css set omnifunc=csscomplete#CompleteCSS
iabbrev [a-z] <C-X><C-O>

au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.erb set filetype=html

" set up ignore for ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|node_modules|platforms|Build)$'
let g:ctrlp_working_path_mode = 'a'

" syntastic
let g:syntastic_javascript_checkers = ['eslint']

" show whitespace as characters
set list

set t_Co=256
set background=dark

" Silver Searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
