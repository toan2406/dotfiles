require('harpoon').setup({})

vim.keymap.set('n', '<leader>hm', function()
  require('harpoon.mark').add_file()
end)

vim.keymap.set('n', '<leader>hh', function()
  require('harpoon.ui').toggle_quick_menu()
end)

