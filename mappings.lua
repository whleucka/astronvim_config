-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    ["<c-g>"] = { "<cmd>Neogit kind=split<cr>", desc = "Floating terminal" },
    ["<c-p>"] = { "<cmd>Telescope find_files<cr>", desc = "Floating terminal" },
    ["<leader>["] = { "^", desc = "BOL" },
    ["<leader>]"] = { "$", desc = "EOL" },
    ["<leader>ss"] = { ":lua require('soprano').search()<cr>", desc = "Soprano music search" },
    ["<leader>sr"] = { ":lua require('soprano').radio()<cr>", desc = "Soprano radio" },
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    ["<leader>b"] = { name = "Buffers" },
    -- Custom mappings below
    H = { "<cmd>bprevious<CR>", desc = "Left buffer" },
    L = { "<cmd>bnext<CR>", desc = "Right buffer" },
    ["<leader>rr"] = { "<cmd>RustRunnables<cr>", desc = "Rust Runnables" },
    ["<leader>ra"] = { "<cmd>RustCodeAction<cr>", desc = "Rust Code Action" },
    ["<leader>rd"] = { "<cmd>RustDebuggables<cr>", desc = "Rust Debuggables" },
    ["<leader>ri"] = { "<cmd>RustEnableInlayHints<cr>", desc = "Rust Enable Inlay Hints" },
    ["<leader>ro"] = { "<cmd>RustDisableInlayHints<cr>", desc = "Rust Disable Inlay Hints" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
