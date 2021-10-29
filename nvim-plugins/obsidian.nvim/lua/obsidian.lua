local M = {}

M.capture = function(title)
  vim.cmd('tabnew ~/Workspace/Personal/my-second-brain/' .. title .. '.md')
  vim.cmd('lcd ~/Workspace/Personal/my-second-brain')
end

return M
