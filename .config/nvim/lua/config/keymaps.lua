-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Center on line after paging
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })

-- Extra keybind for normal mode
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false })

-- Extra keybind for <C-d> and <C-u>
vim.api.nvim_set_keymap("n", "<C-j>", "<C-d>", { noremap = false })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-u>", { noremap = false })
