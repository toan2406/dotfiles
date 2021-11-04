local api, fn = vim.api, vim.fn

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

local function path_join(...)
  local arg = {...}
  return fn.simplify(table.concat(arg, '/'))
end

M.capture = function(title)
  local file_name = snakecase(title) .. '.md'
  local file_path = path_join(M.config.directory, file_name)

  api.nvim_command('tabnew ' .. file_path)
  api.nvim_command('silent lcd ' .. M.config.directory)

  if fn.empty(fn.glob(file_path)) == 1 then
    api.nvim_put(lines(string.format(DEFAULT_TEMPLATE, title)), 'c', false, true)
    api.nvim_command('startinsert')
  end
end

M.screenshot = function()
  local now = os.date('%Y%m%d%H%M%S')
  local buf_name = fn.expand('%:t')
  local img_name = fn.split(buf_name, '\\.')[1] .. '_' .. now .. '.png'

  api.nvim_command('silent !screencapture -i ' .. path_join(M.config.directory, img_name))
  api.nvim_put({'![[' .. img_name .. ']]'}, 'l', true, true)
end

M.setup = function(config)
  M.config = config
end

return M
