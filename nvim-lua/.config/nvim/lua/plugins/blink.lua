return {
  {
    'saghen/blink.compat',
    lazy = true,
    version = '*',
    opts = {},
  },

  {
    'saghen/blink.cmp',
    lazy = false,
    version = 'v0.*',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      local cmp = require('blink.cmp')

      cmp.setup({
        keymap = {
          preset = 'enter',
          ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
          ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
        },
        completion = {
          trigger = {
            show_on_insert_on_trigger_character = false,
          },
          list = {
            selection = 'auto_insert',
          },
          documentation = {
            auto_show = true,
          },
          menu = {
            draw = {
              columns = { { 'label', 'label_description', gap = 1 }, { 'kind', 'source_name' } },
            },
          },
        },
        sources = {
          default = { 'lsp', 'path', 'snippets', 'buffer' },
          completion = {
            enabled_providers = { 'lsp', 'path', 'snippets', 'buffer', 'nvim_lsp' },
          },
          providers = {
            nvim_lsp = {
              name = 'nvim_lsp',
              module = 'blink.compat.source',
              score_offset = -3,
            },
          },
        },
      })
    end,
  },
}
