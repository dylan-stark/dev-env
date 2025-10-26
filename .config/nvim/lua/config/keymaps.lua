-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Yank to clipboard
vim.keymap.set("v", "<leader>yy", '"*y') -- yank this
vim.keymap.set("n", "<leader>yy", '"*y') -- prepare to yank
vim.keymap.set("n", "<leader>YY", 'gg"*yG') -- yank whole file

-- Kick off tmux-sessionizer
vim.keymap.del("n", "<C-f>")
vim.keymap.set("n", "<C-f>", "<cmd>!tmux neww tmux-sessionizer<CR>")
