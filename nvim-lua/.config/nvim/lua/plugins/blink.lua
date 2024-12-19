return {
  'saghen/blink.cmp',
  lazy = false,
  version = 'v0.*',
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
      },
    })
  end,
}
