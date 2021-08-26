require('neorg').setup({
  load = {
    ['core.defaults'] = {},
    ['core.keybinds'] = {
      config = {
        default_keybinds = true,
        neorg_leader = '<leader>o'
      }
    },
    ['core.norg.dirman'] = {
      config = {
        workspaces = {
          my_workspace = '~/Dropbox/neorg'
        }
      }
    }
  }
})

