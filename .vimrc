filetype indent plugin on
syntax on

set fileencoding=utf-8
set autoindent smartindent "Automatic indentation set to 8-width tabs following Linux Kernel standards.
set cursorline number 
set splitright mouse=n
set wildmode=longest,list "Bash-like completion
color habamax

" Movement
noremap <Up> g<Up>
noremap g<Up> <Up>
noremap <Down> g<Down>
noremap g<Down> <Down>
noremap Y y$

" Single-button Folding
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

augroup c_functions
	au!
	autocmd BufWinEnter *.c setlocal cindent
	" Keep File Position
	autocmd BufWinLeave *.c mkview!
	autocmd BufWinEnter *.c silent! loadview
augroup END
