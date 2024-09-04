return {
  {
    'numToStr/Navigator.nvim',
    event = 'VeryLazy',
    config = function()
      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }

      require('Navigator').setup({
        auto_save = nil,
        disable_on_zoom = false,
      })

      map('n', '<C-w>h', '<CMD>lua require("Navigator").left()<CR>', opts)
      map('n', '<C-w>j', '<CMD>lua require("Navigator").down()<CR>', opts)
      map('n', '<C-w>k', '<CMD>lua require("Navigator").up()<CR>', opts)
      map('n', '<C-w>l', '<CMD>lua require("Navigator").right()<CR>', opts)
    end,
  },

  {
    'numtostr/FTerm.nvim',
    lazy = true,
  },
}
