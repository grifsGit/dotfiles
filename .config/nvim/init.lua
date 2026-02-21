-- Simple settings
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.signcolumn = "yes"
vim.o.tabstop = 2
vim.o.swapfile = false
vim.o.cursorline = true

-- Vim keybinds
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>rl', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>rc', ':e $MYVIMRC<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')

vim.keymap.set({'n', 'v', 'x'}, '<leader>y', '"+y<CR>')
vim.keymap.set({'n', 'v', 'x'}, '<leader>d', '"+d<CR>')
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

--Packages
vim.pack.add({
		{ src = "https://github.com/catppuccin/nvim.git" },
		{ src = "https://github.com/stevearc/oil.nvim" },
		{ src = "https://github.com/nvim-mini/mini.pick" },
})

require "mini.pick".setup()
require "oil".setup()

-- Package keybinds
vim.keymap.set('n', '<leader>f', ":Pick files<CR>")
vim.keymap.set('n', '<leader>h', ":Pick help<CR>")
vim.keymap.set('n', '<leader>e', ":Oil<CR>")

--Appearance
vim.cmd("colorscheme catppuccin")
vim.o.showmatch = true
