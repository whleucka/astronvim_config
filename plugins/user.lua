return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  {
    "folke/tokyonight.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("user.plugins.config.tokyonight")
    end
  },
  {
    "AstroNvim/astrocommunity",
    { import = "astrocommunity.pack.rust" },
  }
}
