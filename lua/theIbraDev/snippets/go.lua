local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt

-- Snippet for error handling
ls.add_snippets("go", {
	-- Trigger with 'ie' (if error)
	s("ie", fmt([[
if err != nil {{
		{}
}}
	]], {
			i(0, "return err")
		})),

	-- Trigger with 'iee' (if error with print)
	s("iee", fmt([[
if err != nil {{
		fmt.Println("Error: {}", err)
		{}
}}
	]], {
			i(1, "description"),
			i(0, "return err")
		})),

	-- Trigger with 'ife' (if error with f prefix - useful for function returns)
	s("ife", fmt([[
if err := {}; err != nil {{
		{}
}}
	]], {
			i(1, "function()"),
			i(0, "return err")
		})),
})
