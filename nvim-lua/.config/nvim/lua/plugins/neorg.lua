require('neorg').setup({
  load = {
    ['core.defaults'] = {},
    ['core.norg.concealer'] = {
      config = {
        icons = {
          todo = {
            enabled = true,
            done = {
              enabled = true,
              icon = '✓'
            },
            pending = {
              enabled = true,
              icon = '-'
            },
            undone = {
              enabled = true,
              icon = ' '
            },
          },
          quote = {
            enabled = true,
            icon = '∣'
          },
          heading = {
            enabled = true,
            level_1 = {
              enabled = true,
              icon = '◉'
            },
            level_2 = {
              enabled = true,
              icon = '○'
            },
            level_3 = {
              enabled = true,
              icon = '✿'
            },
            level_4 = {
              enabled = true,
              icon = '•'
            },
          },
          marker = {
            enabled = true,
            icon = '!'
          },
        }
      }
    },
    ['core.keybinds'] = {
      config = {
        default_keybinds = true,
        neorg_leader = '<leader>o'
      }
    },
    ['core.norg.dirman'] = {
      config = {
        workspaces = {
          my_workspace = '~/Dropbox/org'
        }
      }
    }
  }
})

