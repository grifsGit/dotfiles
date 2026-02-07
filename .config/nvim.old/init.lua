local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },

		{
			"catppuccin/nvim",
			name = "catppuccin",
			priority = 1000,
			opts = {
				flavour = "mocha",
				transparent_background = false,
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					mini = { enabled = true },
				},
			},
		},
	},
	install = { colorscheme = { "catppuccin" } },
})

vim.cmd.colorscheme("catppuccin")
