vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Kick off tmux-sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>!tmux neww tmux-sessionizer<CR>")

-- Quickfix
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

-- Celluar Automata
vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")
vim.keymap.set("n", "<leader>gol", "<cmd>CellularAutomaton game_of_life<CR>")

-- Yank to clipboard
vim.keymap.set("v", "<leader>y", '"*y') -- yank this
vim.keymap.set("n", "<leader>y", '"*y') -- prepare to yank
vim.keymap.set("n", "<leader>Y", 'gg"*yG') -- yank whole file

