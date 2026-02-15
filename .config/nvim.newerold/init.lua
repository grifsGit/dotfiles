-- Settings
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 2
vim.o.swapfile = false
vim.g.mapleader = " "
vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"

-- Keymaps
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')

-- Statusline customization
vim.cmd(":hi statusline guibg=NONE")

--Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

-- LSP
{
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "omnisharp", "lua_ls" },
    })
    
    -- LSP keybindings
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local opts = { buffer = args.buf }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
      end,
    })
    
    -- Configure servers using new API
    vim.lsp.config.omnisharp = {}
    vim.lsp.config.lua_ls = {
      settings = {
        Lua = {
          diagnostics = { globals = { 'vim' } }
        }
      }
    }
    
    -- Enable servers
    vim.lsp.enable('omnisharp')
    vim.lsp.enable('lua_ls')
  end,
},

-- Mini.pick
{
  "echasnovski/mini.pick",
  config = function()
    require('mini.pick').setup()
    
	 
    vim.keymap.set('n', '<leader>f', '<cmd>Pick files<CR>', {})
    vim.keymap.set('n', '<leader>g', '<cmd>Pick grep_live<CR>', {})
    vim.keymap.set('n', '<leader>b', '<cmd>Pick buffers<CR>', {})
    vim.keymap.set('n', '<leader>h', '<cmd>Pick help<CR>', {})
    vim.keymap.set('n', 'gr', '<cmd>Pick lsp scope="references"<CR>', {}) -- LSP references
  end,
},

-- Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  }
})


