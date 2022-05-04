local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Delete last search
keymap("n", "<A-/>", "<Esc>:noh<CR>", opts)

-- Insert --
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<A-ESC>", "<C-\\><C-N>", term_opts)
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- LSP
-- keymap("n", "<Leader>lto", ":Trouble<CR>", term_opts)
-- keymap("n", "<Leader>ltt", ":TodoTrouble<CR>", term_opts)
-- keymap("n", "<Leader>ltl", ":TodoTelescope<CR>", term_opts)
-- keymap("n", "<Leader>lff", "<CMD>lua vim.lsp.buf.formatting()<CR>", term_opts)
keymap("v", "<Leader>lff", "<CMD>lua vim.lsp.buf.range_formatting()<CR>", term_opts)

-- keymap("n", "<Leader>lfd", ":Lspsaga lsp_finder<CR>", term_opts)
-- keymap("n", "<Leader>lca", ":Lspsaga code_action<CR>", term_opts)
keymap("v", "<Leader>lca", ":Lspsaga range_code_action<CR>", term_opts)
-- keymap("n", "<Leader>lhd", ":Lspsaga hover_doc<CR>", term_opts)
keymap("n", "<C-->", "<CMD>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", term_opts)
keymap("n", "<C-+>", "<CMD>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", term_opts)
-- keymap("n", "<Leader>lsh", ":Lspsaga signature_help<CR>", term_opts)
-- keymap("n", "<Leader>lr", ":Lspsaga rename<CR>", term_opts)
-- keymap("n", "<Leader>lds", ":<CMD>require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>", term_opts)
-- keymap("n", "<Leader>ldp", ":Lspsaga lsp_jump_diagnostic_prev<CR>", term_opts)
-- keymap("n", "<Leader>ldn", ":Lspsaga lsp_jump_diagnostic_next<CR>", term_opts)

-- DAP
-- keymap("n", "<Leader>dtb", "<CMD>lua require'dap'.toggle_breakpoint()<CR>", term_opts)
-- keymap("n", "<Leader>dc", "<CMD>lua require'dap'.continue()<CR>", term_opts)
-- keymap("n", "<Leader>dsi", "<CMD>lua require'dap'.step_into()<CR>", term_opts)
-- keymap("n", "<Leader>dso", "<CMD>lua require'dap'.step_over()<CR>", term_opts)
-- keymap("n", "<Leader>du", "<CMD>require'dapui'.toggle()<CR>", term_opts)
keymap("v", "<Leader>c", '<esc><cmd>lua require"Comment.api".toggle_linewise_op(vim.fn.visualmode())<cr>', term_opts)
keymap("v", "<Leader>C", '<esc><cmd>lua require"Comment.api".toggle_blockwise_op(vim.fn.visualmode())<cr>', term_opts)
