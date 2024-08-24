return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = true,
  keys = function()
    local harpoon = require('harpoon')

    return {
      {
        '<leader>hm',
        function()
          harpoon:list():add()
        end,
        desc = 'Harpoon File',
      },
      {
        '<leader>hh',
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = 'Harpoon Quick Menu',
      },
    }
  end,
}
