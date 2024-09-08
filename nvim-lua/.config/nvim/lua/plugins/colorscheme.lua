return {
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('gruvbox').setup({
        bold = false,
        italic = {
          strings = false,
          operators = false,
          comments = true,
        },
        invert_selection = false,
        contrast = '',
      })

      vim.cmd [[colorscheme gruvbox]]
    end,
  },

  {
    'jacoborus/tender.vim',
    enabled = false,
  },
}
