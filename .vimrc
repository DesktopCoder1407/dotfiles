" Plugins
set nocompatible
filetype off
"set rtp+=~/.vim/bundle/Vundle.vim

"call vundle#begin()

"Plugin 'VundleVim/Vundle.vim'
"Plugin 'ycm-core/YouCompleteMe'

"call vundle#end()
filetype plugin indent on

" Settings
set autoindent expandtab smartindent shiftwidth=0 tabstop=4  " Four space automatic indentation
syntax on
set cursorline number splitright
set wildmode=longest,list  " Bash-like command completion
color habamax
let g:ycm_enable_semantic_highlighting=1
set mouse=n
set foldmethod=syntax foldnestmax=3 foldcolumn=2

" -- Keymappings --

" Move up/down visual lines when wrapped.
noremap <Up> g<Up>
noremap g<Up> <Up>
noremap <Down> g<Down>
noremap g<Down> <Down>

"nnoremap gd <Cmd>YcmCompleter GoTo<Enter>

nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

noremap Y y$

vmap c> :s/^/\/\/<CR>
vmap c< :s/^\/\///<CR>

" -- Autocommands --

augroup filePositionKeep
    autocmd BufWinLeave *.c mkview!
    autocmd BufWinEnter *.c silent! loadview
augroup END

augroup setFolding
    autocmd BufWinEnter * setlocal foldmethod=syntax foldcolumn=2
augroup END

augroup c_functions
    autocmd BufWinEnter *.c setlocal nosmartindent cindent
    autocmd BufWritePost *.c silent execute '!gcc %' | redraw!
augroup END
