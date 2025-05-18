-- lua/config/keymaps.lua

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help Tags" })
--------------------------------------
-- ToggleTerm
local Terminal = require("toggleterm.terminal").Terminal


local horizontal_term = Terminal:new({
  direction = "horizontal",
  hidden = true,
})

local vertical_term = Terminal:new({
  direction = "vertical",
  hidden = true,
})

local float_term = Terminal:new({
  direction = "float",
  hidden = true,
})

-- Keymaps
map("n", "<leader>th", function() horizontal_term:toggle() end, { desc = "Toggle Horizontal Terminal" })
map("n", "<leader>tv", function() vertical_term:toggle() end, { desc = "Toggle Vertical Terminal" })
map("n", "<leader>tf", function() float_term:toggle() end, { desc = "Toggle Floating Terminal" })

-- Escape to normal mode from terminal
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })
------------------------------------------------------
-- lazygit
vim.keymap.set("n", "<leader>gg", "<cmd>ToggleTerm direction=float<CR>lazygit<CR>", { desc = "Lazygit" })
vim.keymap.set("n", "<leader>gt", "<cmd>TermExec cmd='lazygit' direction=horizontal<CR>", { desc = "Lazygit Terminal" })
----------------------------------------------
-- NvimTree
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle NvimTree" })
----------------------------------------------
-- LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
map("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
map("n", "<leader>gr", vim.lsp.buf.references, { desc = "Go to References" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
-- Formatting (none-ls or LSP)
map("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format File" })
-- Terminal mode window navigation
vim.api.nvim_set_keymap('t', '<C-h>', [[<C-\><C-n><C-w>h]], opts)
vim.api.nvim_set_keymap('t', '<C-j>', [[<C-\><C-n><C-w>j]], opts)
vim.api.nvim_set_keymap('t', '<C-k>', [[<C-\><C-n><C-w>k]], opts)
vim.api.nvim_set_keymap('t', '<C-l>', [[<C-\><C-n><C-w>l]], opts)
-------------------------------------------------------
-- bufferline
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = "Close current buffer" })
----------------------------------------------------------
-- ToggleIndentLines
vim.keymap.set("n", "<leader>ti", "<cmd>ToggleIndentLines<cr>", { desc = "Toggle indent lines" })
--------------------------------------------------------------
-- folding using nvim-ufo
vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
