" Neovim config
" By DesktopCoder1407

set expandtab smartindent shiftwidth=0 tabstop=4  " Indentation
set cursorline number scrolloff=2 splitright  " Visual display
set wildmode=longest,list  " Bash-like command completion
color habamax

noremap <silent> <F2> <Cmd>set invspell<CR>

" Arrow keys move up/down one visual line when wrapped.
noremap <Up> g<Up>
noremap g<Up> <Up>
noremap <Down> g<Down>
noremap g<Down> <Down>
