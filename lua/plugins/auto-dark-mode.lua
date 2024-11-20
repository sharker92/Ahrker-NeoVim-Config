return {
  "f-person/auto-dark-mode.nvim",
  opts = {
    update_interval = 1000,
    set_dark_mode = function()
      vim.api.nvim_set_option_value("background", "dark", {})
      vim.g.catppuccin_flavour = "frappe"
      require("catppuccin").setup()
      vim.cmd("colorscheme catppuccin")
    end,
    set_light_mode = function()
      vim.api.nvim_set_option_value("background", "light", {})
      vim.g.catppuccin_flavour = "latte"
      require("catppuccin").setup()
      vim.cmd("colorscheme catppuccin")
    end,
  },
}

