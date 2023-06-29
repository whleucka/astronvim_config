--- Check if a file or directory exists in this path
local function exists(file)
  local ok, err, code = os.rename(file, file)
  if not ok then
    if code == 13 then
      -- Permission denied, but it exists
      return true
    end
  end
  return ok, err
end

return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  { "nvim-treesitter/nvim-treesitter-context" },
  { "barrett-ruth/telescope-http.nvim" },
  {
    "folke/tokyonight.nvim",
    config = require "user.plugins.config.tokyonight",
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function() require("flash").jump() end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function() require("flash").treesitter() end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function() require("flash").remote() end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc = "Flash Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc = "Toggle Flash Search",
      },
    },
  },
  {
    "nvim-neotest/neotest",
    event = "VeryLazy",
    dependencies = {
      "olimorris/neotest-phpunit",
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-phpunit" {
            phpunit_cmd = function()
              if exists "./vendor/bin/phpunit" then
                -- composer phpuit
                return "./vendor/bin/phpunit"
              end
              -- phar in bin
              return "./bin/phpunit"
            end,
          },
        },
      }
    end,
  },
  -- {
  --   "whleucka/soprano.nvim",
  --   event = "VeryLazy",
  -- },
  -- {
  --   "rebelot/heirline.nvim",
  --   event = "VeryLazy",
  --   opts = function(_, opts)
  --     local status = require "astronvim.utils.status"
  --     local soprano_component = {
  --       provider = " Soprano ",
  --       on_click = {
  --         callback = function()
  --           -- Get the ToggleTerm API
  --           require("toggleterm").toggle(0)
  --         end,
  --         name = "soprano_toggle",
  --       },
  --     }
  --     local soprano_prev = {
  --       provider = " ⏮ ",
  --       on_click = {
  --         callback = function()
  --           if vim.fn.executable "socat" ~= 1 then error "mpv is not installed." end
  --           os.execute "echo playlist-prev | socat - /tmp/mpvsocket"
  --         end,
  --         name = "previous_track",
  --       },
  --     }
  --     local soprano_play_pause = {
  --       provider = " ▶ ",
  --       on_click = {
  --         callback = function()
  --           if vim.fn.executable "socat" ~= 1 then error "mpv is not installed." end
  --           os.execute "echo cycle pause | socat - /tmp/mpvsocket"
  --         end,
  --         name = "play_pause",
  --       },
  --     }
  --     local soprano_next = {
  --       provider = " ⏭ ",
  --       on_click = {
  --         callback = function()
  --           if vim.fn.executable "socat" ~= 1 then error "mpv is not installed." end
  --           os.execute "echo playlist-next | socat - /tmp/mpvsocket"
  --         end,
  --         name = "next_track",
  --       },
  --     }
  --
  --     opts.statusline = {
  --       -- statusline
  --       hl = { fg = "fg", bg = "bg" },
  --       status.component.mode { mode_text = { padding = { left = 1, right = 1 } } }, -- add the mode text
  --       status.component.git_branch(),
  --       status.component.file_info { filetype = {}, filename = false, file_modified = false },
  --       status.component.git_diff(),
  --       status.component.diagnostics(),
  --       status.component.fill(),
  --       status.component.cmd_info(),
  --       status.component.fill(),
  --       status.component.lsp(),
  --       status.component.treesitter(),
  --       status.component.nav(),
  --       soprano_component,
  --       soprano_prev,
  --       soprano_play_pause,
  --       soprano_next,
  --       -- remove the 2nd mode indicator on the right
  --     }
  --
  --     -- return the final configuration table
  --     return opts
  --   end,
  -- },
}
