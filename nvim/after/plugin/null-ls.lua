local null_ls = require('null-ls')

local b = null_ls.builtins

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
            prefer_local = true
        }),
        b.formatting.stylua,
        b.formatting.yamlfmt,
    },
})
