-- set vim options here (vim.<first_key>.<second_key> = value)
return {
  opt = {
    encoding = "utf-8",
    relativenumber = true,
    number = true,
    spell = false,
    spelllang = { "en" },
    wrap = true,
    swapfile = false,
    backup = false,
    laststatus = 3,
    guicursor = "",
    signcolumn = "yes",
  },
  g = {
    mapleader = " ",
    autoformat_enabled = true,
    cmp_enabled = true,
    autopairs_enabled = true,
    diagnostics_mode = 3,            -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
    icons_enabled = true,
    ui_notifications_enabled = true,
  },
}
-- If you need more control, you can use the function()...end notation
-- return function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end
