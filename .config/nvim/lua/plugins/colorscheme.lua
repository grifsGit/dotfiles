return {
  {
    "bergholmm/cursor-dark.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("cursor-dark")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  {
    "lettertwo/laserwave.nvim",
    lazy = false,
    priority = 1000,
  },
}
