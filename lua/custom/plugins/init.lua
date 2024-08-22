-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {}
    end,
  },
  -- bufferline
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require 'config.bufferline'
    end,
  },
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup {
        sort_by = 'case_sensitive',
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
      }
    end,
  },
}
