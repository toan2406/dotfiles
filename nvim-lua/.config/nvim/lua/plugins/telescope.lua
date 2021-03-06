local actions = require('telescope.actions')
local api = vim.api

require('telescope').setup({
  defaults = {
    layout_config = {
      prompt_position = 'top',
      horizontal = {
        width = {padding = 3},
        height = {padding = 1},
        preview_width = 0.5,
      }
    },
    borderchars = {
      {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
      prompt = {'─', '│', ' ', '│', '╭', '╮', '│', '│'},
      results = {'─', '│', '─', '│', '├', '┤', '╯', '╰'},
      preview = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
    },
    sorting_strategy = 'ascending',
    file_ignore_patterns = {'.git', 'node_modules'},
    mappings = {
      i = {
        ['<Esc>'] = actions.close,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
      }
    }
  },
  pickers = {
    find_files = {
      results_title = false,
    },
    live_grep = {
      results_title = false,
    },
    buffers = {
      theme = 'ivy',
      previewer = false,
    },
    help_tags = {
      results_title = false,
    },
    grep_string = {
      results_title = false,
    }
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = true,
      override_file_sorter = true,
    }
  }
})

require('telescope').load_extension('fzy_native')

api.nvim_set_keymap('n', '<leader>ff', '<CMD>Telescope find_files hidden=true<CR>', {noremap = true})
api.nvim_set_keymap('n', '<leader>fg', '<CMD>Telescope live_grep<CR>', {noremap = true})
api.nvim_set_keymap('n', '<leader>fb', '<CMD>Telescope buffers<CR>', {noremap = true})
api.nvim_set_keymap('n', '<leader>fh', '<CMD>Telescope help_tags<CR>', {noremap = true})
api.nvim_set_keymap('n', '<leader>fw', '<CMD>Telescope grep_string<CR>', {noremap = true})

api.nvim_set_keymap('n', '<leader>p', '<leader>ff', {noremap = false})
api.nvim_set_keymap('n', '<leader>s', "<CMD>Telescope grep_string search= only_sort_text=true<CR>", {noremap = true})
api.nvim_set_keymap('n', '<leader>b', '<leader>fb', {noremap = false})
api.nvim_set_keymap('n', '<leader>w', '<leader>fw', {noremap = false})

