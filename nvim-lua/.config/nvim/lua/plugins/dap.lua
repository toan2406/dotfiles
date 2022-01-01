local dap = require('dap')

local api = vim.api
local installation_path = os.getenv('HOME') .. '/Workspace/Personal'

-- git clone https://github.com/microsoft/vscode-node-debug2.git
-- cd vscode-node-debug2
-- npm install
-- gulp build
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {installation_path .. '/vscode-node-debug2/out/src/nodeDebug.js'},
}

dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require('dap.utils').pick_process,
  },
}

vim.fn.sign_define('DapBreakpoint', {text = '●', texthl = 'GruvboxRed', linehl = '', numhl = ''})

api.nvim_set_keymap('n', '<leader>db', ":lua require('dap').toggle_breakpoint()<CR>", {noremap = true})
api.nvim_set_keymap('n', '<leader>ds', ":lua require('dap').close()<CR>", {noremap = true})
api.nvim_set_keymap('n', '<leader>dc', ":lua require('dap').continue()<CR>", {noremap = true})
api.nvim_set_keymap('n', '<leader>dr', ":lua require('dap').repl.open({}, 'vsplit')<CR><C-w>la", {noremap = true})

api.nvim_set_keymap('n', 'J', ":lua require('debug-helper').step_over({fallback = 'mzJ`z'})<CR>", {noremap = true})
api.nvim_set_keymap('n', 'L', ":lua require('debug-helper').step_into({fallback = 'L'})<CR>", {noremap = true})
api.nvim_set_keymap('n', 'K', ":lua require('debug-helper').step_out({fallback = 'K'})<CR>", {noremap = true})

