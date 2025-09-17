vim.keymap.set("n", "<leader>d", function()
  local config = vim.diagnostic.config()
  config.virtual_text = not config.virtual_text
  vim.diagnostic.config(config)
end)

