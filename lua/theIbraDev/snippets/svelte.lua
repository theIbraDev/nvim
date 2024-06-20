require'luasnip'.filetype_extend("typescript", {"typescript"})
local fmt = require("luasnip.extras.fmt").fmt


local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local isn = ls.indent_snippet_node

ls.add_snippets("svelte", {
    s("test", {
        t('print("hello '),
        i(1),
        t('world")'),
    })
})
