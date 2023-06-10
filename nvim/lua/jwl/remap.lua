local nnoremap = require("jwl.keymap").nnoremap
local inoremap = require("jwl.keymap").inoremap
local vnoremap = require("jwl.keymap").vnoremap
local xnoremap = require("jwl.keymap").xnoremap

-- reload neovim config
nnoremap("<leader>sv", "<cmd>source $MYVIMRC<CR>")

-- telescope
nnoremap("<leader>fe", "<cmd>Ex<cr>")
nnoremap("<leader>fp", "<cmd>lua require('telescope.builtin').find_files()<cr>")
nnoremap("<C-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>")
nnoremap("<leader>ff", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>")
nnoremap("<leader>dl", "<cmd>Telescope diagnostics<cr>")

-- git
nnoremap("<leader>git", "<cmd>:LazyGit<cr>")

-- Save
nnoremap("<C-s>", "<cmd>:w<cr>")
inoremap("<C-s>", "<cmd>:w<cr>")

-- Escape
inoremap("jj", "<esc>")
inoremap("kk", "<esc>")
inoremap("hh", "<esc>")

-- Paste/delete without replacing register
xnoremap("<leader>p", '"_dP')
nnoremap("<leader>d", '"_d')
vnoremap("<leader>d", '"_d')

-- Copy to system clipboard
nnoremap("<leader>y", '"+y')
vnoremap("<leader>y", '"+y')
nnoremap("<leader>Y", '"+Y')

-- Movement Insert
inoremap("<C-h>", "<Left>")
inoremap("<C-l>", "<Right>")
inoremap("<C-j>", "<Down>")
inoremap("<C-k>", "<Up>")

-- Movement Panes / Tmux
nnoremap("<C-h>", "<cmd>:TmuxNavigateLeft<cr>")
nnoremap("<C-l>", "<cmd>:TmuxNavigateRight<cr>")
nnoremap("<C-j>", "<cmd>:TmuxNavigateDown<cr>")
nnoremap("<C-k>", "<cmd>:TmuxNavigateUp<cr>")
nnoremap("<C->", "<cmd>:TmuxNavigatePrevious<cr>")

-- Add lines
nnoremap("<cr>", "o<esc>")
nnoremap("<leader><cr>", "O<esc>")

-- Formatting
nnoremap("=", "=<cr>")

-- Move lines
vnoremap("K", ":m '<-2<CR>gv=gv")
vnoremap("J", ":m '>+1<CR>gv=gv")

-- Terminal
nnoremap("<leader>tt", "<cmd>:lua require('jwl.fns').close_and_execute_sidebar(\":echo 'hello'\")<cr>")

-- Neotree
-- Closing Neotree and reopening allows for the buffer to be refreshed and
-- reset its correct position.
nnoremap("<leader>ee", "<cmd>:Neotree toggle<cr>")
nnoremap("<leader>ec", "<cmd>:lua require('jwl.fns').close_and_execute_sidebar('')<cr>")
nnoremap("<leader>ef", "<cmd>:lua require('jwl.fns').close_and_execute_sidebar(':Neotree filesystem right reveal')<cr>")
nnoremap("<leader>eg", "<cmd>:lua require('jwl.fns').close_and_execute_sidebar(':Neotree git_status right reveal')<cr>")
nnoremap("<leader>eb", "<cmd>:lua require('jwl.fns').close_and_execute_sidebar(':Neotree buffers right reveal')<cr>")
nnoremap(
	"<leader>et",
	"<cmd>:lua require('jwl.fns').close_and_execute_sidebar(':22ToggleTerm direction=vertical size=80 dir=git_dir')<cr>"
)
nnoremap("<leader>eh", "<C-w>h")

-- HTML / JSX
-- nnoremap("ci>", "T>vt<c")
nnoremap("ci>", "?><cr>v/<<cr>c><<esc>i")
nnoremap("di>", "?><cr>v/<<cr>s><<esc>")
