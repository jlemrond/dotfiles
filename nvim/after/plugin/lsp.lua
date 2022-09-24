local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>i', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, opts)

local on_attach = function()
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)    
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)    
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)    
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)    
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)    
    vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, bufopts)    
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, bufopts)    
    vim.keymap.set('n', '<space>ga', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<space>f', vim.lsp.buf.format, bufopts)
end

-- Set diagnostic config
vim.diagnostic.config({
  float = {
    source = 'always',
    border = border
  },
})

-- Typescript server
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
--    flags = lsp_flags,
}

vim.opt.completeopt={"menu", "noinsert", "noselect"}

local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
    -- snippet = {
        -- REQUIRED - you must specify a snippet engine
    --    expand = function(args)
    --      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.   
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    --    end,
    --},
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol',
            maxwidth = 24
        }),
    },
    view = {                                                        
        entries = { name = 'custom', selection_order = 'near_cursor' } 
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    }, 
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
        { name = 'path' }
    })
})
