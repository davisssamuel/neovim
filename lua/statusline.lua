local function mode_indicator()
	local mode = vim.fn.mode()
	local modes = {
		n = "NORMAL",
		i = "INSERT",
		v = "VISUAL",
		V = "V-LINE",
		["\22"] = "V-BLOCK",
		c = "COMMAND",
		s = "SELECT",
		S = "S-LINE",
		["\19"] = "S-BLOCK",
		r = "REPLACE",
		R = "REPLACE",
		["!"] = "SHELL",
		t = "TERMINAL",
	}
	return modes[mode] or mode
end

local function diagnostic_counts()
	local counts = {
		error = 0,
		warn = 0,
		info = 0,
		hint = 0,
	}

	for _, d in ipairs(vim.diagnostic.get(0)) do
		if d.severity == vim.diagnostic.severity.ERROR then
			counts.error = counts.error + 1
		elseif d.severity == vim.diagnostic.severity.WARN then
			counts.warn = counts.warn + 1
		elseif d.severity == vim.diagnostic.severity.INFO then
			counts.info = counts.info + 1
		elseif d.severity == vim.diagnostic.severity.HINT then
			counts.hint = counts.hint + 1
		end
	end

	return counts
end

local function diagnostic_error()
	local n = diagnostic_counts().error
	return n > 0 and ("E:" .. n .. " ") or ""
end

local function diagnostic_warn()
	local n = diagnostic_counts().warn
	return n > 0 and ("W:" .. n .. " ") or ""
end

local function diagnostic_info()
	local n = diagnostic_counts().info
	return n > 0 and ("I:" .. n .. " ") or ""
end

local function diagnostic_hint()
	local n = diagnostic_counts().hint
	return n > 0 and ("H:" .. n .. " ") or ""
end

_G.mode_indicator = mode_indicator
_G.diagnostic_error = diagnostic_error
_G.diagnostic_warn = diagnostic_warn
_G.diagnostic_info = diagnostic_info
_G.diagnostic_hint = diagnostic_hint

vim.cmd([[ highlight StatusLineBold gui=bold cterm=bold ]])
vim.api.nvim_set_hl(0, "StatusLineBold", { bold = true })
vim.api.nvim_set_hl(0, "StatusLineDiagnosticError", { link = "DiagnosticError" })
vim.api.nvim_set_hl(0, "StatusLineDiagnosticWarn", { link = "DiagnosticWarn" })
vim.api.nvim_set_hl(0, "StatusLineDiagnosticHint", { link = "DiagnosticHint" })

vim.opt.statusline = table.concat({
	" ",

	"%#StatusLineBold#",
	"%{v:lua.mode_indicator()}",
	"%#StatusLine#",

	" ",

	"%f %M %R",

	"%=", -- center align everything after this
	"%=", -- right align everything after this

	"%#StatusLineDiagnosticError#",
	"%{v:lua.diagnostic_error()}",
	"%#StatusLine#",

	"%#StatusLineDiagnosticWarn#",
	"%{v:lua.diagnostic_warn()}",
	"%#StatusLine#",

	"%{v:lua.diagnostic_info()}",

	"%#StatusLineDiagnosticHint#",
	"%{v:lua.diagnostic_hint()}",
	"%#StatusLine#",

	-- "%{&filetype}",

	"%P %l:%c",

	" ",
})
