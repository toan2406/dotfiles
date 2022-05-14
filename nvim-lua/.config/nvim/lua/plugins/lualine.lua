local colors = require('gruvbox.colors')

require('lualine').setup({
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
        color = {fg = colors.bg0, bg = colors.bright_red, gui = 'bold'},
      },
      'mode',
    },
    lualine_b = {'branch'},
    lualine_c = {'filename', 'filetype'},
    lualine_x = {
      'require("lsp-status").status()',
      {
        'diagnostics',
        sources = {'nvim_diagnostic'},
        sections = {'error', 'warn', 'info', 'hint'},
      },
    },
    lualine_y = {'progress'},
    lualine_z = {'location'},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {},
  },
  extensions = {'fzf'},
})

