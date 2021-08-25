require('neorg').setup({
  load = {
    ['core.defaults'] = {},
    ['core.norg.concealer'] = {},
    ['core.norg.dirman'] = {
      config = {
        workspaces = {
          my_workspace = '~/Dropbox/neorg'
        }
      }
    }
  }
})

