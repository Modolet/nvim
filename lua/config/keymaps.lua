-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

vim.keymap.set("i", "jj", "<ESC>", { silent = true, noremap = true })
vim.keymap.set("n", "H", "^", { noremap = true })
vim.keymap.set("n", "L", "$", { noremap = true })
vim.keymap.set("v", "H", "^", { noremap = true })
vim.keymap.set("v", "L", "$", { noremap = true })

vim.keymap.set("n", "<c-y>", [["0y]], { noremap = true })
vim.keymap.set("v", "<c-y>", [["0y]], { noremap = true })
vim.keymap.set("n", "<c-p>", [["0p]], { noremap = true })
vim.keymap.set("v", "<c-p>", [["0p]], { noremap = true })

vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

map({ "n", "t" }, "<m-.>", function()
  Snacks.terminal.toggle("nu", { cwd = LazyVim.root(), win = { position = "float" }, env = { position = "float" } })
end, { desc = "Float Terminal (Root Dir)" })

map({ "n", "t" }, "<m-/>", function()
  Snacks.terminal.toggle("nu", { cwd = LazyVim.root(), win = { position = "bottom" }, env = { position = "bottom" } })
  -- Snacks.terminal.open({ cwd = LazyVim.root(), win = { position = "bottom" } })
end, { desc = "Float Terminal (Root Dir)" })

-- map("t", "<m-.>", "<cmd>hide<cr>", { desc = "Hide Terminal" })
-- map("t", "<m-/>", "<cmd>hide<cr>", { desc = "Hide Terminal" })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
