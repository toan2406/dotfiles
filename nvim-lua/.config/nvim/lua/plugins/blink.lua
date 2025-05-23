return {
  {
    'saghen/blink.compat',
    lazy = true,
    version = '*',
    opts = {},
  },

  {
    'saghen/blink.cmp',
    version = '*',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'giuxtaposition/blink-cmp-copilot',
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
            selection = {
              preselect = false,
              auto_insert = true,
            },
          },
          documentation = {
            auto_show = true,
          },
          menu = {
            draw = {
              columns = { { 'label', 'label_description', gap = 1 }, { 'kind', 'source_name', gap = 1 } },
            },
          },
          accept = {
            dot_repeat = true,
          },
        },
        sources = {
          default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
          providers = {
            lsp = {
              fallbacks = {},
            },
            nvim_lsp = {
              name = 'nvim_lsp',
              module = 'blink.compat.source',
              score_offset = -3,
            },
            copilot = {
              name = 'copilot',
              module = 'blink-cmp-copilot',
              score_offset = 100,
              async = true,
            },
          },
        },
        appearance = {
          use_nvim_cmp_as_default = true,
        },
        cmdline = {
          completion = {
            list = {
              selection = {
                preselect = false,
                auto_insert = true,
              },
            },
            menu = {
              auto_show = true,
            },
          },
        },
      })
    end,
  },
}
