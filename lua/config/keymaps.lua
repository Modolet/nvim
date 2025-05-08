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

map("n", "<c-.>", function()
  Snacks.terminal.open(nil, { cwd = LazyVim.root(), win = { position = "float" } })
end, { desc = "Float Terminal (Root Dir)" })

map("n", "<c->>", function()
  Snacks.terminal.open(nil, { nil, win = { position = "float" } })
end, { desc = "Float Terminal (cwd)" })

map("t", "<C-.>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<C->>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
