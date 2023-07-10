-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    ["<c-g>"] = { "<cmd>Neogit kind=split<cr>", desc = "Floating terminal" },
    ["<leader>]"] = { "<cmd>cnext<cr>", desc = "Quickfix next" },
    ["<leader>["] = { "<cmd>cprev<cr>", desc = "Quickfix prev" },
    -- ["<leader>ss"] = { "<cmd>lua require('soprano').search()<cr>", desc = "Soprano music search" },
    -- ["<leader>sr"] = { "<cmd>lua require('soprano').radio()<cr>", desc = "Soprano radio" },
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
    H = { "<cmd>bprevious<CR>", desc = "Left buffer" },
    L = { "<cmd>bnext<CR>", desc = "Right buffer" },
    ["<leader>rr"] = { "<cmd>RustRunnables<cr>", desc = "Rust Runnables" },
    ["<leader>ra"] = { "<cmd>RustCodeAction<cr>", desc = "Rust Code Action" },
    ["<leader>rd"] = { "<cmd>RustDebuggables<cr>", desc = "Rust Debuggables" },
    ["<leader>ri"] = { "<cmd>RustEnableInlayHints<cr>", desc = "Rust Enable Inlay Hints" },
    ["<leader>ro"] = { "<cmd>RustDisableInlayHints<cr>", desc = "Rust Disable Inlay Hints" },
    ["<leader>ir"] = { "<cmd>lua require('neotest').run.run()<cr>", desc = "PHPUnit test single method"},
    ["<leader>if"] = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "PHPUnit test file"},
    ["<leader>it"] = { "<cmd>lua require('neotest').run.run({ suite = true })<cr>", desc = "PHPUnit test suite"},
    ["<leader>is"] = { "<cmd>lua require('neotest').summary.toggle({ enter = true })<cr>", desc = "PHPUnit toggle test summary"},
    ["<leader>io"] = { "<cmd>lua require('neotest').output_panel.toggle({ enter = true })<cr>", desc = "PHPUnit toggle output panel"},
    ["<F2>"] = { "<cmd>%s/\\s\\+$//e<cr>", desc = "Remove unwanted whitespace"},
    ["<F3>"] = { "<cmd>set spell!<cr>", desc = "Toggle spell checking"},
    ["<leader>j"] = { "^", desc = "BOL" },
    ["<leader>k"] = { "$", desc = "EOL" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
