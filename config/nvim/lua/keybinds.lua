-- keybinds.lua
-- By DesktopCoder1407

local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true}
--Format is keymap({mode}, {lhs}, {rhs}, {opts})

-- Remap switching windows to to <SHIFT> + Arrows
keymap('n', '<S-Left>', '<C-W>h', default_opts)
keymap('n', '<S-Up>', '<C-W>j', default_opts)
keymap('n', '<S-Down>', '<C-W>k', default_opts)
keymap('n', '<S-Right>', '<C-W>l', default_opts)

-- Remap moving windows to <ALT> + <SHIFT> + Arrows
keymap('n', '<A-S-Up>', '<C-W>J', default_opts)
keymap('n', '<A-S-Down>', '<C-W>K', default_opts)
keymap('n', '<A-S-Left>', '<C-W>H', default_opts)
keymap('n', '<A-S-Right>', '<C-W>L', default_opts)

-- Function key keybinds
--keymap('', '<F1>', ':help<CR>', default_opts)  -- Set by default
keymap('', '<S-F1>', ':NvimTreeToggle<CR>', default_opts)
keymap('', '<F2>', ':set invspell<CR>', default_opts)
