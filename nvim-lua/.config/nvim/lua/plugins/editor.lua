return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      local wk = require('which-key')

      wk.setup({
        preset = 'classic',
        delay = function(ctx)
          return 200
        end,
        filter = function(mapping)
          return mapping.desc and mapping.desc ~= ''
          -- return true
        end,
        plugins = {
          marks = true,
          registers = true,
          presets = {
            operators = true,
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
          },
        },
        win = {
          border = 'none',
          padding = { 0, 1 },
          wo = {
            winblend = 0,
          },
        },
        icons = {
          mappings = false,
          colors = false,
        },
      })

      wk.add({
        { '<leader>p', desc = 'Find Files' },
        { '<leader>s', desc = 'Live Grep' },
        { '<leader>b', desc = 'Find Buffers' },
        { '<leader>w', desc = 'Grep Word' },

        { '<leader>f', group = 'find' },
        { '<leader>ff', desc = 'Find Files' },
        { '<leader>fg', desc = 'Live Grep' },
        { '<leader>fb', desc = 'Find Buffers' },
        { '<leader>fw', desc = 'Grep Word' },
        { '<leader>fh', desc = 'Find Help Tags' },
        { '<leader>f/', desc = 'Search History' },
        { '<leader>f:', desc = 'Command History' },
        { '<leader>fc', desc = 'Find Commands' },
        { '<leader>fm', desc = 'Find Marks' },
        { '<leader>ft', desc = 'Find Git Changed Files' },
        { '<leader>fa', desc = 'Find Normal Mappings' },
        { '<leader>fp', desc = 'Find Projects' },

        { '<leader>g', group = 'git' },
        { '<leader>gg', desc = 'Open Status Window' },
        { '<leader>gv', desc = 'Open Commit Browser' },
        { '<leader>gl', desc = 'List Previous Revisions' },
        { '<leader>go', desc = 'Open On Github' },
        { '<leader>gh', desc = 'Open File History' },

        { '<leader>l', group = 'language' },
        { '<leader>ld', desc = 'Go To Definition' },
        { '<leader>lv', desc = 'Go To Definition In Split' },
        { '<leader>lf', desc = 'Format' },
        { '<leader>lh', desc = 'Hover' },

        { '<leader>z', group = 'note' },
        { '<leader>zf', desc = 'Open Notes' },
        { '<leader>zs', desc = 'Search Notes' },
        { '<leader>zt', desc = 'Open Notes By Tag' },
        { '<leader>zn', desc = 'New Note' },

        { '<leader>d', group = 'debug' },
      })
    end,
  },

  {
    'justinmk/vim-sneak',
    event = 'VeryLazy',
    config = function()
      local g = vim.g
      local api = vim.api

      g['sneak#label'] = 1
      g['sneak#use_ic_scs'] = 1

      api.nvim_set_keymap('', 'f', '<Plug>Sneak_f', { noremap = false })
      api.nvim_set_keymap('', 'F', '<Plug>Sneak_F', { noremap = false })
      api.nvim_set_keymap('', 't', '<Plug>Sneak_t', { noremap = false })
      api.nvim_set_keymap('', 'T', '<Plug>Sneak_T', { noremap = false })

      vim.cmd [[autocmd ColorScheme * highlight Sneak      guifg=#282828 guibg=#fabd2f]]
      vim.cmd [[autocmd ColorScheme * highlight SneakLabel guifg=#282828 guibg=#fabd2f]]
    end,
  },

  {
    'ggandor/leap.nvim',
    keys = {
      {
        's',
        function()
          require('leap').leap({
            target_windows = vim.tbl_filter(
              function(win) return vim.api.nvim_win_get_config(win).focusable end,
              vim.api.nvim_tabpage_list_wins(0)
            )
          })
        end,
      },
    },
    config = function()
      require('leap').add_default_mappings()

      vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
    end,
  },

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      local npairs = require('nvim-autopairs')

      npairs.setup()

      npairs.get_rule("'")[1]:with_pair(function()
        if vim.bo.filetype == 'reason' then
          return false
        end
      end)

      npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))

      -- Insert `(` after select function or method item
      -- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      -- local cmp = require('cmp')
      -- cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({map_char = {tex = ''}}))
    end,
  },

  {
    'tpope/vim-surround',
    event = 'VeryLazy',
  },

  {
    'b3nj5m1n/kommentary',
    event = 'VeryLazy',
    config = function()
      vim.g.kommentary_create_default_mappings = false

      vim.api.nvim_set_keymap('n', '<leader>cc', '<Plug>kommentary_line_default', {})
      vim.api.nvim_set_keymap('n', '<leader>c', '<Plug>kommentary_motion_default', {})
      vim.api.nvim_set_keymap('v', '<leader>c', '<Plug>kommentary_visual_default<Esc>', {})

      require('kommentary.config').configure_language('default', {
        prefer_single_line_comments = true,
      })
    end,
  },

  {
    'chentoast/marks.nvim',
    event = 'VeryLazy',
    config = true,
  },
}
