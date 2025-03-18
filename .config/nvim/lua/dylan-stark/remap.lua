vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Kick off tmux-sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>!tmux neww tmux-sessionizer<CR>")

-- Quickfix
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

