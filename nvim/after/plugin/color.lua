-- Catpuccin
vim.g.catppuccin_flavour = "mocha"
require("catppuccin").setup({
	transparent_background = true,
	dim_inactive = {
		enable = true,
	},
})

vim.opt.background = "dark"

-- Tokyonight
require("tokyonight").setup({
	styles = {
		functions = { italic = false },
		keywords = { italic = false },
		variables = { italic = false },
		sidebars = "transparent",
	},
	hide_inactive_statusline = true,
	transparent = true,
})

require("kanagawa").setup({
	transparent = true,
})

vim.cmd("colorscheme catppuccin")

-- Git Signs
require("gitsigns").setup()

-- StatusBar
local colors = {
	blue = "#89B4FA",
	cyan = "#A6E3A1",
	black = "#11111B",
	white = "#CDD6F4",
	red = "#F38BA8",
	violet = "#CBA6F7",
	grey = "#313244",
}

local bubbles_theme = {
	normal = {
		a = { fg = colors.black, bg = colors.violet },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.black, bg = nil },
	},

	insert = { a = { fg = colors.black, bg = colors.blue } },
	visual = { a = { fg = colors.black, bg = colors.cyan } },
	replace = { a = { fg = colors.black, bg = colors.red } },

	inactive = {
		a = { fg = colors.white, bg = nil },
		b = { fg = colors.white, bg = nil },
		c = { fg = colors.black, bg = nil },
	},
}

-- local function code_icon()
--     return " "
-- end

require("lualine").setup({
	options = {
		theme = "catppuccin",
		component_separators = "|",
		-- section_separators = { left = '', right = '' },
		-- section_separators = { left = '', right = ''},
		section_separators = { left = "", right = "" },
	},
	extensions = { "neo-tree" },
	sections = {
		lualine_a = {
			-- { 'mode', separator = { left = '' }, right_padding = 2 },
			"mode",
		},
		lualine_b = { { "filename" } },
		lualine_c = { "diff" },
		lualine_x = { "diagnostics" },
		lualine_y = { "filetype", "progress" },
		lualine_z = {
			{ "location" },
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	-- tabline = {
	--   lualine_a = { code_icon },
	--   lualine_b = { { 'filename', path = 1 } },
	--   lualine_c = {},
	--   lualine_x = {},
	--   lualine_y = { 'os.date("%A, %B %d")' },
	--   lualine_z = { 'os.date("%H:%M")' },
	-- },
})
