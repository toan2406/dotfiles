vim.g.nvim_tree_disable_window_picker = 1
vim.g.nvim_tree_highlight_opened_files = 2
vim.g.nvim_tree_show_icons = {
  git = 0,
  folders = 0,
  files = 0,
  folder_arrows = 0,
}

require('nvim-tree').setup({
  git = {
    enable = false,
    ignore = false,
  }
})

vim.api.nvim_set_keymap('n', '<C-n>', "&filetype == 'NvimTree' ? ':NvimTreeClose<CR>' : ':NvimTreeFindFile<CR>'", {expr = true})

