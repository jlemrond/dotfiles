local null_ls = require("null-ls")

local b = null_ls.builtins

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		-- Diagnostics
		b.diagnostics.eslint_d.with({
			prefer_local = true,
			filter = function(diagnostic)
				return diagnostic.code ~= "prettier/prettier"
			end,
		}),
		b.diagnostics.cspell,
		b.diagnostics.write_good,

		-- Formatting
		b.formatting.prettierd.with({
			prefer_local = true,
		}),
		b.formatting.stylua,
		b.formatting.yamlfmt,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client_callback)
							return client_callback.name == "null-ls"
						end,
					})
				end,
			})
		end
	end,
})
