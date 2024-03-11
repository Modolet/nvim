-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    local opt = vim.opt
    opt.tabstop = 2
    opt.softtabstop = 2
    opt.shiftwidth = 2
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    local opt = vim.opt
    opt.spell = false
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.slint",
  callback = function()
    vim.bo.filetype = "slint"
    local opt = vim.opt
    opt.tabstop = 4
    opt.softtabstop = 4
    opt.shiftwidth = 4
  end,
})
