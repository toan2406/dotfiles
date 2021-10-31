local M = {}
local DEFAULT_TEMPLATE = [[
---
tags: []
---

# %s

]]

local function lines(str)
  local result = {}
  for line in str:gmatch('([^\n]*)\n?') do
    table.insert(result, line)
  end
  return result
end

local function snakecase(str)
  return str:lower():gsub('%s+', '_')
end

M.capture = function(title)
  local file_name = snakecase(title)

  vim.cmd('tabnew ' .. M.config.directory .. '/' .. file_name .. '.md')
  vim.cmd('lcd ' .. M.config.directory)
  vim.api.nvim_put(lines(string.format(DEFAULT_TEMPLATE, title)), '', false, true)
  vim.cmd('startinsert')
end

M.setup = function(config)
  M.config = config
end

return M
