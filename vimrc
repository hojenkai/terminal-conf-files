" ============== GENERAL CONFIG ============= 
" set nocompatible
" filetype plugin indent on  " Load plugins according to detected filetype.
syntax on
filetype on 
set hidden
set hlsearch
set laststatus=2
set tabstop=4
set shiftwidth=4 expandtab

" execute 'highlight Comment ' . pinnacle#italicize('Comment')
" execute 'highlight link EndOfBuffer ColorColumn'

" autocmd FileType javascript,typescript,json setlocal foldmarker={,}
"
" ===========================================

" =============== FOLD OPTIONS ==============
set foldenable
set foldmethod=indent
set foldlevel=1
highlight Folded ctermbg=gray
highlight Folded ctermfg=black
" hi Folded ctermbg=none
" hi Visual  guifg=#000000 guibg=#014804 gui=none
" ===========================================

" ============= RELATIVE NUMBERS ============ 
set relativenumber 
autocmd InsertLeave * :set relativenumber
autocmd InsertEnter * :set relativenumber! number

" ===========================================


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'chriskempson/base16-vim'
" Plugin to search/repace globally
Plugin 'greplace.vim'

" NERD Tree with GIT support
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Vim-airline plugin
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Snippets
Plugin 'SirVer/ultisnips'

" ============= GO LANG PLUGINS =============
Plugin 'fatih/vim-go'
" ===========================================

" ============ JAVASCRIPT PLUGINS ===========
" Syntax highlighting and improved indentation
" Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'

" Complete square and curly braces and parenthesees
Plugin 'Raimondi/delimitMate'

" Go to definition, code refactoring
" Plugin 'marijnh/tern_for_vim'

" Code vim - scratch pad 
" Plugin 'metakirby5/codi.vim'

" This does what it says on the tin. It will check your file on open too, not just on save.
" " You might not want this, so just leave it out if you don't.
let g:syntastic_check_on_open=1
imap <C-c> <CR><Esc>O
" ===========================================

Plugin 'dbext.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Open NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree

" ================ NERD TREE ================
" Open nerd tree when no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:NERDTreeWinPos = "right"
map <C-n> :NERDTreeToggle<CR>
" ===========================================
"

" ================= AIRLINE =================
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='badwolf'

map <C-k> :bn<CR>
map <C-j> :bp<CR>
" ===========================================
"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Ctrl P 
set runtimepath^=~/.vim/bundle/ctrlp.vim
helptags ~/.vim/bundle/ctrlp.vim/doc

" Define ignored directories
set wildignore+=*/tmp/*,*.so,*.swp,*.zip " Default
set wildignore+=*/build/*,*/target/*,*/out/*,*.class " Java output files
set wildignore+=*.ipr,*.iws " IDEA files
set wildignore+=*/node_modules " Node modules

" Load .vimrx_background if present
if filereadable(expand("~/.vimrc_background"))
	let base16colorspace=256
	source ~/.vimrc_background
endif

