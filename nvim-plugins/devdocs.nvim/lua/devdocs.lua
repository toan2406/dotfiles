local curl = require('plenary.curl')

local M = {}

M.download = function()
  -- M.config.docs_download
  -- local cmd = io.popen('sh', 'w')
  -- cmd:write([[
  -- touch ~/Downloads/hello1
  -- ]])
  -- cmd.close()

  -- print(debug.getinfo(1).short_src)
  -- print(debug.getinfo(1).source)
  -- print(string.gsub(debug.getinfo(1).source, '^@(.+/)[^/]+$', '$1'))
  -- local res = string.gsub(debug.getinfo(1).source, "^@(.+/)[^/]+$", "%1")
  -- print(res)

  -- os.execute([[
  -- /Users/toannguyen/.dotfiles/nvim-plugins/devdocs.nvim/lua/download.rb
  -- ]])

  for _, doc in ipairs(M.config.docs_download) do
    local url = 'https://documents.devdocs.io/' .. doc:gsub('@', '~') .. '/index.json'
    curl.get(url, {
      accept = 'application/json',
      callback = function(out)
        local entries = vim.json.decode(out.body).entries
        print(vim.inspect(entries[1].name))
        -- print(vim.inspect(out.body))
      end
    })
  end
end

M.setup = function(config)
  M.config = config
end

return M
