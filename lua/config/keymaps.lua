-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jj", "<ESC>", { silent = true, noremap = true })
vim.keymap.set("n", "H", "^", { noremap = true })
vim.keymap.set("n", "L", "$", { noremap = true })
vim.keymap.set("v", "H", "^", { noremap = true })
vim.keymap.set("v", "L", "$", { noremap = true })
vim.keymap.set("n", "<c-a>", "ggVG", { noremap = true })

vim.keymap.set("n", "<c-v>", [["0p]], { noremap = true })
vim.keymap.set("i", "<c-v>", [[<esc>"0pi]], { noremap = true })
