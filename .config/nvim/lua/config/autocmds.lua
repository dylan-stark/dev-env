-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Markdown: format on demand only.
--
-- `lua/plugins/markdown.lua` registers prettier for markdown so <leader>cf reflows
-- table pipes to aligned widths. LazyVim enables format-on-save globally
-- (`vim.g.autoformat = true`), which would otherwise let prettier rewrite the whole
-- document -- list numbering, bullet and emphasis characters -- on every `:w`.
--
-- `LazyVim.format.enabled()` checks `vim.b.autoformat` before the global, so this
-- suppresses save-time formatting while <leader>cf (which passes `force`) still works.
-- Delete this autocmd to get format-on-save for markdown.
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("markdown_no_autoformat", { clear = true }),
  pattern = { "markdown", "markdown.mdx" },
  callback = function(ev)
    vim.b[ev.buf].autoformat = false
  end,
})
