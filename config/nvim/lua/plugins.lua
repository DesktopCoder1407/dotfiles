-- plugins.lua
-- By DesktopCoder1407

vim.cmd([[packadd packer.nvim]])

return require('packer').startup(function(use)
    -- Packer managing itself
    use { 'wbthomason/packer.nvim' }

    -- Status bar (Lualine)
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = false }
    }

    -- Telescope (File Finder)
    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- vim-sneak
    use { 'justinmk/vim-sneak' }

    -- nvim-tree (File explorer)
    use { 
        'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' }
    }

end)
