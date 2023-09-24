" Vim config
" By DesktopCoder1407
set autoindent expandtab smartindent shiftwidth=0 tabstop=4  " Indentation size of 4 (spaces only)
set nowrap colorcolumn=+0,120  " Show standard column length
set hidden  " Don't delete buffers on file switch.
set noshowmode laststatus=2  " Always show the status bar
set number  " Line numbers
set scrolloff=4 sidescrolloff=8  " Screen padding
set splitright  " Vertical split always splits to the right
set title  " Dynamic window title
set cursorline termguicolors | syntax on | color koehler " Colorization
set wildmenu wildmode=longest,list  " Command completion

" -- Functions
function! ToggleTerminal()
    if bufwinnr('bash') == -1
        terminal
        wincmd J
        resize 8
    else
        execute 'bd! ' . bufnr('bash')
    endif
endfunction

" -- Keybinds
noremap <silent> <F2> <Cmd>set invspell<CR>
noremap <silent> <F9> <Cmd>call ToggleTerminal()<CR>
tnoremap <silent> <F9> <Cmd>call ToggleTerminal()<CR>
noremap Y y$
