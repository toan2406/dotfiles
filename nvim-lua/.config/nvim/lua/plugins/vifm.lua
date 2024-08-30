return {
  'toan2406/vifm.vim',
  lazy = false,
  config = function()
    vim.api.nvim_set_keymap('n', '<leader>e', ':Vifm<CR>', { noremap = true, silent = true })
  end,
}
