local toggleterm_lazy = require("toggleterm.lazy")
local toggleterm_ui = toggleterm_lazy.require("toggleterm.ui")

local M = {}

function M.close_and_execute_sidebar(command)
	-- Close toggleterm if it is open
	local has_open = toggleterm_ui.find_open_windows()
	if has_open then
		vim.cmd(":ToggleTerm")
	end

	-- Close neotree
	vim.cmd(":Neotree close")

	-- Execute command
	vim.cmd(command)
end

return M
