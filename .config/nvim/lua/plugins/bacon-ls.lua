-- nvim/lua/plugins/bacon-ls.lua
-- The LazyVim rust extra enables the bacon_ls server when
-- vim.g.lazyvim_rust_diagnostics = "bacon-ls" (see config/options.lua),
-- but only asks Mason for bacon itself, so install bacon-ls too.
return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "bacon-ls" })
    end,
  },
}
