-- nvim/lua/plugins/mojo.lua
return {
  -- Ensure lspconfig is available
  {
    "neovim/nvim-lspconfig",
    opts = function()
      -- Basic Mojo LSP setup
      require("lspconfig").mojo.setup({})

      -- Optional: format on save for .mojo files via LSP
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.mojo",
        callback = function()
          local clients = vim.lsp.get_clients({ bufnr = 0, name = "mojo" })
          if #clients > 0 and clients[1]:supports_method("textDocument/formatting") then
            vim.lsp.buf.format({ async = false })
          end
        end,
      })
    end,
  },
}
