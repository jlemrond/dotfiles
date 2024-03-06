local nnoremap = require("jwl.keymap").nnoremap

require("gopher").setup({
	commands = {
		go = "go",
		gomodifytags = "gomodifytags",
		gotests = "~/go/bin/gotests", -- also you can set custom command path
		impl = "impl",
		iferr = "iferr",
	},
})

nnoremap("<leader>le", "<cmd>:GoIfErr<cr>")
nnoremap("<leader>lt", "<cmd>:GoTestAdd<cr>")
nnoremap("<leader>li", "<cmd>:GoImpl<cr>")
nnoremap("<leader>lj", "<cmd>:GoTagAdd json<cr>")
nnoremap("<leader>lrj", "<cmd>:GoTagRm json<cr>")
