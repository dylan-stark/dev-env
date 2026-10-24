-- nvim/lua/plugins/mojo.lua
-- mojo-lsp-server comes from the Modular/pixi install, not Mason. LazyVim
-- formats on save through the LSP, so no extra autocmd is needed.
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        mojo = { mason = false },
      },
    },
  },
}
