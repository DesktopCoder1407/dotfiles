-- config.lua
-- By DesktopCoder1407
local opt = vim.opt

-- [[ Indentation ]]
opt.expandtab = true  -- Use <Space> instead of <Tab>
opt.shiftwidth = 0  -- Use 'tabstop' for 'autoindent'
opt.smartindent = true  -- Auto indent
opt.tabstop = 4  -- Size of <Tab> in spaces

-- [[ Display ]]
opt.colorcolumn = {120,'+0'}  -- Column length markers at 120 and textwidth
opt.cursorline = true  -- Highlight the current line the cursor is on
opt.display:append('uhex')  -- Display hex values of unprintable characters
opt.inccommand = 'split'  -- Display commands incrementally with a pop-up window
opt.number = true  -- Show line number
opt.relativenumber = true  -- Show relative line numbers
opt.showmode = false  -- Don't show editor mode on command line
opt.signcolumn = 'auto:1-3'  -- Always display the sign column with up to 3 total spaces
opt.title = true  -- Sets the title of the window
opt.termguicolors = true  -- Allows for full range of colors
opt.wrap = false  -- Turn off word wrap by default
vim.cmd([[colorscheme torte]])  -- Set colorscheme to 'torte'

-- [[ Misc ]]
opt.clipboard:append('unnamedplus')  -- Allows use of the clipboard
opt.history = 50  -- Number of commands and searches to keep in history
opt.scrolloff = 4  -- Up/Down scroll line buffer
opt.sidescrolloff = 8  -- Left/Right scroll column buffer
opt.spelllang = 'en_us'  -- Default spelling language
opt.splitright = true  -- Vertical splitting always splits to the right
opt.undofile = true  -- Allow for undo between sessions
opt.wildmode = 'list:longest'  -- Allow command completion similar to bash

-- [[ Status Line ]]
require('lualine').setup {
    options = { theme = 'ayu_mirage' }
}

-- [[ Plugin Setups ]]
 -- Telescope
require('telescope').setup {
    defaults = {
        dynamic_preview_title = true,
        use_less = false
    }
}
 -- Nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require('nvim-tree').setup {
    view = { width = 32 },
    filters = { dotfiles = true }
}


