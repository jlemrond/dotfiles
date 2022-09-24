local nnoremap = require('jwl.keymap').nnoremap
local inoremap = require('jwl.keymap').inoremap

-- reload neovim config
nnoremap('<leader>sv', '<cmd>source $MYVIMRC<CR>')

-- telescope
nnoremap('<leader>fe', '<cmd>Ex<cr>')
nnoremap('<leader>fp', "<cmd>lua require('telescope.builtin').find_files()<cr>")
nnoremap('<leader>fg', '<cmd>Telescope live_grep<cr>')
nnoremap('<leader>fb', '<cmd>Telescope buffers<cr>')
nnoremap('<leader>fh', '<cmd>Telescope help_tags<cr>')
nnoremap('<leader>dl', '<cmd>Telescope diagnostics<cr>')

-- git
nnoremap('<leader>git', '<cmd>:LazyGit<cr>')

-- Save
nnoremap('<C-s>', '<esc>:w<cr>')
inoremap('<C-s>', '<esc>:w<cr>')

-- Escape
inoremap('jj', '<esc>')
inoremap('kk', '<esc>')

-- Movement Normal
nnoremap('<C-j>', '<C-d>M')
nnoremap('<C-k>', '<C-u>M')
nnoremap('<C-h>', '^')
nnoremap('<C-l>', '$')

-- Movement Insert
inoremap('<C-h>', '<Left>')
inoremap('<C-l>', '<Right>')
inoremap('<C-j>', '<Down>')
inoremap('<C-k>', '<Up>')

-- Add lines
nnoremap('<cr>', 'o<esc>')
nnoremap('<leader><cr>', 'O<esc>')

-- Formatting
nnoremap('=', '=<cr>')

-- Neotree
nnoremap('<leader>et', '<cmd>:Neotree toggle<cr>')
nnoremap('<leader>ef', '<cmd>:Neotree filesystem right reveal<cr>')
nnoremap('<leader>eg', '<cmd>:Neotree git_status right reveal<cr>')
nnoremap('<leader>eb', '<cmd>:Neotree buffers right reveal<cr>')
