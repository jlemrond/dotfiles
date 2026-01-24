local nnoremap = require("jwl.keymap").nnoremap

require("gopher").setup({
	commands = {
		go = "go",
		gomodifytags = "gomodifytags",
		gotests = "gotests", -- also you can set custom command path
		impl = "impl",
		iferr = "iferr",
	},
})

-- Install Gopher dependencies
vim.cmd([[silent! GoInstallDeps]])

nnoremap("<leader>le", "<cmd>:GoIfErr<cr>")
nnoremap("<leader>lt", "<cmd>:GoTestAdd<cr>")
nnoremap("<leader>li", "<cmd>:GoImpl<cr>")
nnoremap("<leader>lj", "<cmd>:GoTagAdd json<cr>")
nnoremap("<leader>lrj", "<cmd>:GoTagRm json<cr>")
