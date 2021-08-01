local g = vim.g
local api = vim.api

g.ale_linters_explicit = 1
g.ale_lint_on_text_changed = 'never'
g.ale_lint_on_insert_leave = 0
g.ale_lint_on_enter = 0
g.ale_fix_on_save = 0

g.ale_set_loclist = 0
g.ale_set_quickfix = 1
g.ale_open_list = 0

g.ale_linters = {
  javascript = {'eslint', 'prettier'},
  ruby = {'rubocop'},
}
g.ale_fixers = {
  javascript = {'prettier'},
  typescript = {'prettier'},
  json = {'prettier'},
  ruby = {'rubocop'},
}
g.ale_ruby_rubocop_executable = 'bundle'

api.nvim_set_keymap('n', '<leader>af', '<Plug>(ale_fix)', {noremap = false, silent = false})

