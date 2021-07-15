vim.g.symbols_outline = {
  highlight_hovered_item = true,
  show_guides = true,
  auto_preview = true,
  position = 'left',
  show_numbers = false,
  show_relative_numbers = false,
  show_symbol_details = true,
  keymaps = {
    close = '<Esc>',
    goto_location = '<CR>',
    focus_location = 'o',
    hover_symbol = '<C-Space>',
    rename_symbol = 'r',
    code_actions = 'a',
  },
  lsp_blacklist = {},
}

vim.api.nvim_set_keymap('n', '<leader>st', ':SymbolsOutline<CR>', {noremap = true})

