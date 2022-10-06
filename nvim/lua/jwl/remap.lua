local nnoremap = require("jwl.keymap").nnoremap
local inoremap = require("jwl.keymap").inoremap
local vnoremap = require("jwl.keymap").vnoremap

-- reload neovim config
nnoremap("<leader>sv", "<cmd>source $MYVIMRC<CR>")

-- telescope
nnoremap("<leader>fe", "<cmd>Ex<cr>")
nnoremap("<leader>fp", "<cmd>lua require('telescope.builtin').find_files()<cr>")
nnoremap("<C-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>")
nnoremap("<leader>dl", "<cmd>Telescope diagnostics<cr>")

-- git
nnoremap("<leader>git", "<cmd>:LazyGit<cr>")

-- Save
nnoremap("<C-s>", "<esc>:w<cr>")
inoremap("<C-s>", "<esc>:w<cr>")

-- Escape
inoremap("jj", "<esc>")
inoremap("kk", "<esc>")
inoremap("hh", "<esc>")

-- Paste/delete without replacing register
nnoremap("<leader>p", '"_dP')
nnoremap("<leader>d", '"_d')
vnoremap("<leader>d", '"_d')

-- Movement Insert
inoremap("<C-h>", "<Left>")
inoremap("<C-l>", "<Right>")
inoremap("<C-j>", "<Down>")
inoremap("<C-k>", "<Up>")

-- Add lines
nnoremap("<cr>", "o<esc>")
nnoremap("<leader><cr>", "O<esc>")

-- Formatting
nnoremap("=", "=<cr>")

-- Move lines
vnoremap("K", ":m '<-2<CR>gv=gv")
vnoremap("J", ":m '>+1<CR>gv=gv")

-- Neotree
-- Closing Neotree and reopening allows for the buffer to be refreshed and
-- reset its correct position.
local close_neotree = "<cmd>:Neotree close<cr>"
nnoremap("<leader>ee", "<cmd>:Neotree toggle<cr>")
nnoremap("<leader>ef", close_neotree .. "<cmd>:Neotree filesystem right reveal action=show<cr>")
nnoremap("<leader>eg", close_neotree .. "<cmd>:Neotree git_status right reveal action=show<cr>")
nnoremap("<leader>eb", close_neotree .. "<cmd>:Neotree buffers right reveal action=show<cr>")
nnoremap("<leader>et", close_neotree .. "<cmd>:22ToggleTerm direction=vertical size=60 dir=git_dir<cr>")

-- HTML / JSX
-- nnoremap("ci>", "T>vt<c")
nnoremap("ci>", "?><cr>v/<<cr>c><<esc>i")
nnoremap("di>", "?><cr>v/<<cr>s><<esc>")
