local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s('tcom', {
    t { '/**', ' * ' },
    i(1, 'Short description.'),
    t { '', ' *', ' * @param ' },
    i(2, 'paramName'),
    t { ' ' },
    i(3, 'Parameter description.'),
    t { '', ' * @returns ' },
    i(4, 'Return value description.'),
    t { '', ' */' },
  }),
}
