set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'rhysd/vim-clang-format'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'tmux/tmux'
"Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'lifepillar/vim-solarized8'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

":ClangFormat command is available. If you use it in normal mode, the whole code will be formatted.
" If you use it in visual mode, the selected code will be formatted.
"let g:clang_format#command = 'clang-format-10'
"let g:clang_format#code_style='llvm'
nnoremap <F6> :ClangFormat<CR>

"YCM Notes
"To edit flags, file .ycm_extra_conf.py in ~/.vim/bundle/YouCompleteMe
"Change to C++ when the time comes
" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd") 
"Installation: sudo apt install build-essential cmake python3-dev
"cd ~/.vim/bundle/YouCompleteMe
"python3 install.py --clangd-completer (clangd)
"To restart YCM: :YcmRestartServer
"YCM to recompile (with F5):
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
"IDE Features (GoTo, type information, FixIt, and Refractoring):YcmCompleter

let g:airline_theme='deus'

" ****************************************

"clipboard modification: use linux's clipboard
set clipboard^=unnamed,unnamedplus

"F7 creates a 'here' check
nnoremap <F7> :normal i printf("here\n");<CR>

" Set solarized8 dark colors:
"set background=dark
"colorscheme solarized8
"set t_Co=256
"let g:solarized_termcolors=256

"if exists('+termguicolors')
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"set termguicolors
"endif

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" Turn on syntax highlighting.
syntax on

" Turn off modelines
set modelines=0

" Automatically wrap text that extends beyond the screen length.
set wrap
" Vim's auto indentation feature does not work properly with text copied from outisde of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
" set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5
" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling in Vim
set ttyfast

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Show line numbers
set number

" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

autocmd bufnewfile *.c so ~/.vim/c_header.txt
autocmd bufnewfile *.c exe "1," . 5 . "g/File Name     :.*/s//File Name     : " .expand("%")
autocmd bufnewfile *.c exe "1," . 5 . "g/Creation Date :.*/s//Creation Date : " .strftime("%m-%d-%Y")
autocmd Bufwritepre,filewritepre *.c execute "normal ma"
autocmd Bufwritepre,filewritepre *.c exe "1," . 5 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.c execute "normal `a"

autocmd bufnewfile *.cpp so ~/.vim/cpp_header.txt
autocmd bufnewfile *.cpp exe "1," . 5 . "g/File Name     :.*/s//File Name     : " .expand("%")
autocmd bufnewfile *.cpp exe "1," . 5 . "g/Creation Date :.*/s//Creation Date : " .strftime("%m-%d-%Y")
autocmd Bufwritepre,filewritepre *.cpp execute "normal ma"
autocmd Bufwritepre,filewritepre *.cpp exe "1," . 5 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.cpp execute "normal `a"
