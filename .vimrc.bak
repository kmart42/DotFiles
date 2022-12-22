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
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
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

let mapleader = " "

":ClangFormat command is available. If you use it in normal mode, the whole code will be formatted.
" If you use it in visual mode, the selected code will be formatted.
"let g:clang_format#command = 'clang-format-10'
"let g:clang_format#code_style='llvm'
autocmd FileType c nnoremap <F6> :ClangFormat<CR>
autocmd FileType cpp nnoremap <F6> :ClangFormat<CR>
autocmd FileType cs nnoremap <F6> :ClangFormat<CR>
autocmd FileType python noremap <buffer> <F6> :call Autopep8()<CR>
let g:autopep8_disable_show_diff=1

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
autocmd FileType c nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
autocmd FileType cpp nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

"IDE Features (GoTo, type information, FixIt, and Refractoring):YcmCompleter

"Compile and run with F7
autocmd FileType cpp nnoremap <F7> :w <CR> :!clear ; g++ -Wall -O2 --std=c++17 %; if [ -f a.out ]; then time ./a.out; rm a.out; fi <CR>
autocmd FileType c nnoremap <F7> :w <CR> :!clear ; gcc -Wall -Werror -march=native -lm --std=gnu99 %; if [ -f a.out ]; then time ./a.out; rm a.out; fi <CR>
autocmd FileType cs nnoremap <F7> :w <CR> :!xbuild && cd bin/Debug && mono *.exe <CR>

nnoremap <C-n> :NERDTree<CR>

let g:airline_theme='deus'

" ****************************************

"clipboard modification: use linux's clipboard
set clipboard^=unnamed,unnamedplus

"F3 creates a 'here' check
autocmd FileType c nnoremap <F3> :normal i printf("here\n");<CR>
autocmd FileType cpp nnoremap <F3> :normal i cout<<"here\n"<<endl;<CR>

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

" OmniSharp
let g:omnicomplete_fetch_full_documentation = 1
let g:OmniSharp_autoselect_existing_sln = 1
let g:OmniSharp_popup_position = 'peek'
let g:OmniSharp_highlighting = 3
let g:OmniSharp_diagnostic_exclude_paths = [ 'Temp[/\\]', 'obj[/\\]', '\.nuget[/\\]' ]
let g:OmniSharp_fzf_options = { 'down': '10' }

augroup csharp_commands
    autocmd!
    autocmd FileType cs nmap <buffer> gd <Plug>(omnisharp_go_to_definition)
    autocmd FileType cs nmap <buffer> <Leader><Space> <Plug>(omnisharp_code_actions)
    autocmd FileType cs xmap <buffer> <Leader><Space> <Plug>(omnisharp_code_actions)
    autocmd FileType cs nmap <buffer> <F2> <Plug>(omnisharp_rename)
    autocmd FileType cs nmap <buffer> <Leader>cf <Plug>(omnisharp_code_format)
    autocmd FileType cs nmap <buffer> <Leader>fi <Plug>(omnisharp_find_implementations)
    autocmd FileType cs nmap <buffer> <Leader>fs <Plug>(omnisharp_find_symbol)
    autocmd FileType cs nmap <buffer> <Leader>fu <Plug>(omnisharp_find_usages)
    autocmd FileType cs nmap <buffer> <Leader>dc <Plug>(omnisharp_documentation)
    autocmd FileType cs nmap <buffer> <Leader>cc <Plug>(omnisharp_global_code_check)
    autocmd FileType cs nmap <buffer> <Leader>rt <Plug>(omnisharp_run_test)
    autocmd FileType cs nmap <buffer> <Leader>rT <Plug>(omnisharp_run_tests_in_file)
    autocmd FileType cs nmap <buffer> <Leader>ss <Plug>(omnisharp_start_server)
    autocmd FileType cs nmap <buffer> <Leader>sp <Plug>(omnisharp_stop_server)
    autocmd FileType cs nmap <buffer> <C-\> <Plug>(omnisharp_signature_help)
    autocmd FileType cs imap <buffer> <C-\> <Plug>(omnisharp_signature_help)
    "autocmd BufWritePre *.cs :OmniSharpCodeFormat

" Python

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

let python_highlight_all=1
syntax on

"python with virtualenv support
py3 3
py3 << EOF
import os
import sys
import subprocess
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ["VIRTUAL_ENV"]
    script = os.path.join(project_base_dir, "bin/activate")
    pipe = subprocess.Popen(". %s; env" % script, stdout=subprocess.PIPE, shell=True)
    output = pipe.communicate()[0].decode('utf8').splitlines()
    env = dict((line.split("=", 1) for line in output))
    os.environ.update(env)
EOF
