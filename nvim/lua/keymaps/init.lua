vim.keymap.set('n', '<leader>sv', '<cmd>source $MYVIMRC<CR>', { desc = 'Reload Neovim' })

-- Escape
vim.keymap.set('i', 'jj', '<esc>', { desc = 'Exit insert mode' })
vim.keymap.set('i', 'kk', '<esc>', { desc = 'Exit insert mode' })
vim.keymap.set('i', 'hh', '<esc>', { desc = 'Exit insert mode' })

vim.keymap.set('x', '<leader>p', '"_dP', { desc = 'Discard deleted text on paste' })
vim.keymap.set('n', '<leader>d', '"_d', { desc = 'Discard deleted text on delete' })
vim.keymap.set('v', '<leader>d', '"_d', { desc = 'Discard deleted text on delete' })

vim.keymap.set('n', '<leader>y', '"+y', { desc = 'Copy to clipboard' })
vim.keymap.set('v', '<leader>y', '"+y', { desc = 'Copy to clipboard' })
vim.keymap.set('n', '<leader>Y', '"+Y', { desc = 'Copy to clipboard' })
