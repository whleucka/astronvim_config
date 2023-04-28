return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  {
    "folke/tokyonight.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
  },
  {
    "simrat39/rust-tools.nvim",
    after = { "mason-lspconfig.nvim" },
    -- Is configured via the server_registration_override installed below!
    config = function()
      require("rust-tools").setup {
        server = astronvim.lsp.server_settings "rust_analyzer",
        tools = {
          inlay_hints = {
            parameter_hints_prefix = "  ",
            other_hints_prefix = "  ",
          },
        },
      }
    end,
  },
}
