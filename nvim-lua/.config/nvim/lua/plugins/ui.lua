return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-lua/lsp-status.nvim',
      'SmiteshP/nvim-navic',
      {
        dir = '~/.dotfiles/nvim-plugins/codecompanion-lualine.nvim',
        name = 'codecompanion-lualine',
      },
    },
    event = 'VeryLazy',
    opts = function()
      local palette = require('gruvbox').palette

      return {
        options = {
          icons_enabled = false,
          theme = 'gruvbox',
          component_separators = '|',
          section_separators = '',
        },
        sections = {
          lualine_a = {
            {
              "require('debug-helper').status()",
              color = { fg = palette.bg0, bg = palette.bright_red, gui = 'bold' },
            },
            'mode',
          },
          lualine_b = { 'branch' },
          lualine_c = {
            'filename',
            'filetype',
            {
              'navic',
              color_correction = nil,
              navic_opts = nil,
            },
          },
          lualine_x = {
            -- https://github.com/nvim-lualine/lualine.nvim/issues/1201#issuecomment-2206974843
            'require("lsp-status").status():gsub("%%", "")',
            'codecompanion',
            {
              'diagnostics',
              sources = { 'nvim_diagnostic' },
              sections = { 'error', 'warn', 'info', 'hint' },
            },
          },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        extensions = { 'fzf' },
      }
    end,
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = 'BufRead',
    opts = {
      enabled = false,
      debounce = 200,
      indent = {
        highlight = { 'CursorColumn', 'Whitespace' },
        char = '',
      },
      whitespace = {
        highlight = { 'CursorColumn', 'Whitespace' },
        remove_blankline_trail = false,
      },
      scope = {
        enabled = false,
      },
    },
  },

  {
    'norcalli/nvim-colorizer.lua',
    event = 'VeryLazy',
    opts = {
      'css',
      'javascript',
      'html',
      'reason',
    },
  },
}
