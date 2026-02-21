-- Basic settings
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.signcolumn = "yes"
vim.o.scrolloff = 10
vim.o.sidescrolloff = 8
vim.o.cursorline = true
vim.o.clipboard = "unnamedplus"

-- Indentation
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.swapfile = false

-- Vim keybinds
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>rl', ':update<CR> :source<CR>', { desc = "Source" })
vim.keymap.set('n', '<leader>rc', ':e $MYVIMRC<CR> :source<CR>', { desc = "Open Init.lua" })
vim.keymap.set('n', '<leader>w', ':write<CR>', { desc = "Write" })
vim.keymap.set('n', '<leader>q', ':quit<CR>', { desc = "Quit" })

vim.keymap.set('i', 'jj', '<Esc>', { noremap = true }, { desc = "jj mapped to Escape" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true }, { desc = "Center on page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true }, { desc = "Center on page up" })
vim.keymap.set('n', 'n', 'nzzzv', { desc = "Center on next" })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = "Center on previous" })

vim.keymap.set('n', '<A-j>', ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set('n', '<A-k>', ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = "Move line down" })

vim.keymap.set('n', '<leader>e', ":Explore<CR>", { desc = "Open file explorer" })

--Packages
vim.pack.add({
		{ src = "https://github.com/catppuccin/nvim.git" },
})

--Appearance
vim.cmd("colorscheme catppuccin")
vim.o.showmatch = true

-- Functions
local augroup = vim.api.nvim_create_augroup("UserConfig", {})

vim.api.nvim_create_autocmd("TextYankPost", { -- Highlight on yank
	group = augroup,
	callback = function()
		vim.highlight.on_yank()
	end,
}) 
