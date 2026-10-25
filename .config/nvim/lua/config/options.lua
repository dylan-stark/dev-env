require("config.remote_clipboard").setup()
-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
-- Rust diagnostics come from bacon-ls (cargo clippy via headless bacon); rust-analyzer still does the rest
vim.g.lazyvim_rust_diagnostics = "bacon-ls"
