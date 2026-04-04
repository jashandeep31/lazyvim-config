local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s('scom', {
    t '// --- ',
    i(1, 'Section Title'),
    t ' ---',
  }),
}
