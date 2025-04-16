vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Source current buffer
vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)

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

-- Move visual blocks up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

