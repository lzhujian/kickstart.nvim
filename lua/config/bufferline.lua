local bufferline = require 'bufferline'

local hide = {
  qf = true,
}
bufferline.setup {
  options = {
    mode = 'buffers',
    max_name_length = 30,
    sort_by = 'none',
    close_command = 'bdelete! %d', -- 点击关闭按钮关闭
    right_mouse_command = 'bdelete! %d', -- 右键点击关闭
    indicator = {
      icon = '▎', -- 分割线
      style = 'underline',
    },
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'File Explorer',
        highlight = 'Directory',
        text_align = 'left',
        separator = true,
        padding = 1,
      },
    },
    custom_filter = function(bufnr)
      return not hide[vim.bo[bufnr].filetype]
    end,
  },
}

for i = 1, 6 do
  vim.keymap.set('n', '<leader>' .. i, function()
    bufferline.go_to(i, true)
  end, { desc = 'Move to tab index ' .. i })
end

vim.keymap.set('n', '<C-j>', '<Cmd>BufferLineMovePrev<CR>', { desc = 'Move current buffer previous' })
vim.keymap.set('n', '<C-k>', '<Cmd>BufferLineMoveNext<CR>', { desc = 'Move current buffer next' })
vim.keymap.set('n', '<C-h>', ':BufferLineCyclePrev<CR>', { desc = 'Move to previous buffer tab' })
vim.keymap.set('n', '<C-l>', ':BufferLineCycleNext<CR>', { desc = 'Move to next buffer tab' })

-- close current tab --
vim.keymap.set('n', '<C-x>', function()
  if vim.bo.modified then
    vim.notify('No write since last change', vim.log.levels.ERROR)
    return
  end
  local buf = vim.fn.bufnr()
  bufferline.cycle(-1)
  vim.cmd.bdelete(buf)
end)

vim.api.nvim_create_user_command('CL', 'BufferLineCloseLeft', {})
vim.api.nvim_create_user_command('CR', 'BufferLineCloseRight', {})
