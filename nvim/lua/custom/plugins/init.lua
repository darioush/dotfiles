-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

---@module 'lazy'
---@type LazySpec
return {
  {
    'linrongbin16/gitlinker.nvim',
    cmd = 'GitLink',
    keys = {
      { '<leader>gy', '<cmd>GitLink<cr>', mode = { 'n', 'v' }, desc = 'Copy git link' },
      { '<leader>gY', '<cmd>GitLink!<cr>', mode = { 'n', 'v' }, desc = 'Open git link' },
    },
    opts = {},
  },
}
