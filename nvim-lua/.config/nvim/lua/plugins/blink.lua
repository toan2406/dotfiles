return {
  'saghen/blink.cmp',
  lazy = false,
  version = 'v0.*',
  config = function()
    local cmp = require('blink.cmp')

    cmp.setup({
      keymap = {
        preset = 'enter',
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
      },
      completion = {
        list = {
          selection = 'auto_insert',
        },
        documentation = {
          auto_show = true,
        },
      },
    })
  end,
}
