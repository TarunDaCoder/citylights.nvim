local util = require('citylights.util')
local theme = require('citylights.theme')

local M = {}

function M.colorscheme()
  util.load(theme.setup())
end

return M
