let g:jsx_ext_required = 0

set nocompatible " Stops vim from behaving in a strongly vi-compatible way.
filetype off

" -------- Vundle! --------
set rtp+=/etc/vim/bundle/vundle
call vundle#rc('/etc/vim/bundle')
" alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required! 
Plugin 'VundleVim/Vundle.vim'

" My Bundles here:
"
" original repos on github
Plugin 'https://github.com/tpope/vim-vividchalk.git'
Plugin 'https://github.com/Reewr/vim-monokai-phoenix'
Plugin 'https://github.com/crusoexia/vim-monokai'
Plugin 'flazz/vim-colorschemes'
Plugin 'w0rp/ale'
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-fugitive' "Use git directly in vim
Plugin 'mileszs/ack.vim' "Search for words
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdcommenter' "Comment blocks of code
Plugin 'vim-airline/vim-airline' "status bar
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Valloric/YouCompleteMe' "Autocompletion, need to python install.py on first install
Plugin 'https://github.com/godlygeek/tabular'
Plugin 'https://github.com/tpope/vim-unimpaired'
Plugin 'https://github.com/itspriddle/vim-marked'
Plugin 'pangloss/vim-javascript'
Plugin 'altercation/vim-colors-solarized'
Plugin 'reasonml-editor/vim-reason'
Plugin 'ElmCast/elm-vim'

call vundle#end()

" vim-scripts repos

" non github repos
" ...
" -------- end --------

syntax on " Turn on Syntax Highlight
filetype plugin indent on " Turn on file type detection

" colorscheme vividchalk " Change Color scheme in ~/.vim/colors folder
" colorscheme monokai
let g:solarized_termcolors = 256
colorscheme solarized

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/mobile/js/web/* " ctrlp ignores
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

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

" set laststatus=2 " Always show the status line
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%m/%d/%y\ -\ %H:%M\")}
" Status line: format, type, cursor position, % complete, date, and time

"Map :W to :w for people who types too fast.
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

" Copy to clipboard - For Macs only
"map <C-c> y:e ~/copybufferforvimclipboard<CR>P:w !pbcopy<CR><CR>:bdelete!<CR>
"map <C-d> :r !pbpaste<CR><CR>

autocmd BufNewFile,BufRead *.scss setlocal filetype=css
" autocmd FileType css set omnifunc=csscomplete#CompleteCSS
iabbrev [a-z] <C-X><C-O>

au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.erb set filetype=html

" set up ignore for ctrlp
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|node_modules|platforms|Build)$'
let g:ctrlp_working_path_mode = 'r'

" show whitespace as characters
" set list

set t_Co=256
set background=dark

" Silver Searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" fzf fuzzy finder
" If installed using Homebrew
set rtp+=/usr/local/opt/fzf

" Shortcuts Shortcuts
" Available: https://hea-www.harvard.edu/~fine/Tech/vi.html
map <C-f> :FZF<CR>
map <C-i> :PluginInstall<CR>
map <C-N> :NERDTree<CR>
map <C-_> :Ack<CR>

" VIM windows movement
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
nnoremap <Leader>f :Ack!<Space>

" bind K to grep word under cursor
nnoremap K :Ack! "\b<C-R><C-W>\b"<Space>

" Ale Configuration - auto js fix
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
let g:ale_fix_on_save = 1
