return {
  "neovim/nvim-lspconfig",
  opts = function()
    -- Format on save using LSP
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.mojo",
      callback = function()
        local clients = vim.lsp.get_clients({ bufnr = 0, name = "mojo" })
        if #clients > 0 and clients[1].capabilities.textDocument.formatting then
          vim.lsp.buf.format({ async = false })
        end
      end,
    })
  end,
}
