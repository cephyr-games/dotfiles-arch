-- custom color theme for Neovim
local c = {
	fg = "#f071ae", -- @@txt_main@@
	bg = "#211111", -- @@dark_main@@
	bg_light = "#ab3d77", -- @@light_base@@

	sel = "#00236d", -- @@txt_sel@@
	highlight = "#e571f0", -- @@txt_highlight@@
	pale = "#cf3680", -- @@txt_pale@@
	dark = "#1f1f1f", -- @@txt_dark@@

	white = "#ffefef", -- @@txt_white@@
	red = "#d1261d", -- @@txt_red@@
	orange = "#dF6350", -- @@txt_orange@@
	yellow = "#f2e82e", -- @@txt_yellow@@
	green = "#53bf26", -- @@txt_green@@
	cyan = "#82d4fC", -- @@txt_cyan@@
	blue = "#6287FC", -- @@txt_blue@@

	type = "#8351FC", -- @@lsp_type@@
	string = "#82d4fC", -- @@lsp_string@@
	primitive = "#ffefef", -- @@lsp_primitive@@
	macro = "#f2e82e", -- @@lsp_macro@@
	keyword = "#e571f0", -- @@lsp_keyword@@
	builtin = "#e571f0", -- @@lsp_builtin@@
	func = "#6287FC", -- @@lsp_function@@
	property = "#6287FC", -- @@lsp_property@@
	exception = "#d1261d", -- @@lsp_exception@@
	variable = "#f071ae", -- @@lsp_variable@@
}

-- helper to apply the same highlight to multiple groups
local function group(groups, opts)
	for _, g in ipairs(groups) do
		vim.api.nvim_set_hl(0, g, opts)
	end
end

local function set_highlights()
	-- Normal
	group({
		"Normal",
		"NormalFloat",
		"SignColumn",

		"NormalFloat",
		"FloatBorder",
		"LspInfoBorder",

		"WhichKey",
		"WhichKeyNormal",
		"WhichKeyBorder",
	}, { fg = c.fg, bg = c.bg })

	group({ "PmenuThumb" }, { fg = c.fg, bg = c.fg })

	-- WhichKey specific
	group({
		"WhichKeySeparator",
	}, { fg = c.yellow, bg = c.bg })
	group({
		"WhichKeyValue",
		"WhichKeyTitle",
		"WhichKeyGroup",
		"WhichKeyDesc",
		"WhichKeyIcon",
	}, { fg = c.highlight, bg = c.bg })

	-- Pale
	group({
		"LspInlayHint",
		"Comment",
		"EndOfBuffer",
		"LineNr",
	}, { fg = c.pale })

	-- Selections
	group({
		"Visual",
		"TelescopeSelection",
		"PmenuSel",
	}, { bg = c.sel })

	-- Search
	group({
		"Search",
		"TelescopeMatching",
	}, { bg = c.orange })

	group({
		"MatchParen",
	}, { fg = c.orange })

	-- Status line
	group({
		"StatusLine",
		"StatusLineSeparator",
	}, { fg = c.fg, bg = c.bg_light })
	group({ "StatusLineNC" }, { fg = c.pale, bg = c.bg })

	-- Unco
	group({ "TablinyFill", "Tabliny" }, { fg = c.pale, bg = c.bg })
	group({ "TablinySel" }, { fg = c.highlight, bg = c.bg_light })

	group({ "TablinyModifiedSel" }, { fg = c.green, bg = c.bg_light })
	group({ "TablinyDiagnosticWarnSel" }, { fg = c.yellow, bg = c.bg_light })
	group({ "TablinyDiagnosticErrorSel" }, { fg = c.red, bg = c.bg_light })

	group({ "TablinyModified" }, { fg = c.green, bg = c.bg })
	group({ "TablinyDiagnosticWarn" }, { fg = c.yellow, bg = c.bg })
	group({ "TablinyDiagnosticError" }, { fg = c.red, bg = c.bg })

	-- Diagnostics
	group({
		"DiagnosticError",
		"DiagnosticUnderlineError",
		"DiagnosticFloatingError",
		"DiagnosticUnderlineError",
		"DiagnosticVirtualTextError",
		"LspDiagnosticsDefaultError",
		"LspDiagnosticsUnderlineError",
	}, { fg = c.red })
	group({
		"DiagnosticWarn",
		"DiagnosticUnderlineWarn",
		"DiagnosticSignWarn",
		"DiagnosticFloatingWarn",
		"DiagnosticVirtualTextWarn",
		"LspDiagnosticsDefaultWarning",
		"LspDiagnosticsUnderlineWarning",
	}, { fg = c.yellow })
	group({
		"DiagnosticInfo",
	}, { fg = c.blue })
	group({
		"DiagnosticHint",
	}, { fg = c.cyan })

	-- Tree sitter
	group({
		"@punctuation.bracket",
		"@punctuation.delimiter",
		"@function.bracket",
		"@string.escape",
		"@punctuation.special",
	}, { fg = c.fg })
	group({
		"@constant",
		"@type",
	}, { fg = c.type })
	group({
		"@string",
		"@character",
	}, { fg = c.string })
	group({
		"@number",
		"@boolean",
		"@number.float",
	}, { fg = c.primitive })

	group({
		"@constant.macro",
		"@annotation",
		"@attribute",
		"@function.macro",

		-- lifetimes
		"@lifetime",
		"@lifetime.rust",
		"@lifetime.builtin",
		"@string.special",
		"@lsp.type.lifetime.rust",
		"@string.special.rust",
	}, { fg = c.macro })

	group({
		"@keyword",
		"@keyword.function",
		"@keyword.operator",
		"@keyword.conditional",
		"@keyword.repeat",
		"@keyword.exception",
		"@keyword.include",
		"@keyword.faded",
		"@tag",
		"@tag.delimiter",
		"@tag.attribute",
		"@tag.builtin",
	}, { fg = c.keyword })

	group({
		"@variable.builtin",
		"@constant.builtin",
		"@type.builtin",
		"@function.builtin",
		"@lifetime.builtin", -- specifically for 'static and '_
		"@lifetime.builtin.rust",
		"@constant.builtin",
		"@constant.builtin.rust",
	}, { fg = c.builtin })

	group({
		"@operator",
		"@function",
		"constructor",
		"@function.method",
		"@function.call",
		"@function.method.call",
	}, { fg = c.func })

	group({ "@property" }, { fg = c.property })
	group({ "@variable", "@lsp.type.namespace" }, { fg = c.variable })
	group({ "@error", "@exception" }, { fg = c.exception })

	-- Normal Lsp groups
	group({ "Delimiter", "SpecialChar" }, { fg = c.fg })
	group({ "Constant", "Type" }, { fg = c.type })
	group({ "String", "Character" }, { fg = c.string })
	group({ "Number", "Boolean", "Float" }, { fg = c.primitive })
	group({ "Macro", "PreProc", "Special" }, { fg = c.macro }) -- Special used for builtins/lifetimes
	group({ "Keyword", "Conditional", "Repeat", "Include", "Tag" }, { fg = c.keyword })
	group({ "Function", "Operator" }, { fg = c.func })
	group({ "Identifier" }, { fg = c.variable }) -- base identifier
	group({ "Exception" }, { fg = c.exception })
end

local function setup()
	vim.g.colors_name = "neo"
	set_highlights()
end

-- run setup
setup()

-- return for use as a module
return {
	setup = setup,
	colors = c,
	group = group,
}