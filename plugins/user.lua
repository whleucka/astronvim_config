return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  { "nvim-treesitter/nvim-treesitter-context" },
  {
    "folke/tokyonight.nvim",
    opts = require "user.plugins.config.tokyonight",
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    keys = require "user.plugins.config.flash-keys",
  },
  {
    "nvim-neotest/neotest",
    event = "VeryLazy",
    dependencies = {
      "olimorris/neotest-phpunit",
    },
    config = function() require "user.plugins.config.neotest" end,
  },
  {
    "ojroques/vim-oscyank",
    config = function()
      local function copy(lines, _) require("osc52").copy(table.concat(lines, "\n")) end

      local function paste() return { vim.fn.split(vim.fn.getreg "", "\n"), vim.fn.getregtype "" } end

      vim.g.clipboard = {
        name = "osc52",
        copy = { ["+"] = copy, ["*"] = copy },
        paste = { ["+"] = paste, ["*"] = paste },
      }

      -- Now the '+' register will copy to system clipboard using OSC52
      vim.keymap.set("n", "<leader>y", '"+y')
      vim.keymap.set("n", "<leader>yy", '"+yy')
    end,
  },
  -- {
  --   "whleucka/soprano.nvim",
  --   dependencies = {
  --    "barrett-ruth/telescope-http.nvim",
  --   }
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
