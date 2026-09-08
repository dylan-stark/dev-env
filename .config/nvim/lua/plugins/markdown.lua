-- Markdown table support: render tables as aligned boxes while reading, and reflow
-- the raw pipes on disk on demand while writing.
--
-- Deliberately narrower than `lazyvim.plugins.extras.lang.markdown`, which would also
-- pull in the marksman LSP, browser preview, and markdownlint diagnostics.
return {
  -- Rendering half. Non-table options mirror LazyVim's markdown extra so headings and
  -- code blocks look the same as they would upstream.
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "markdown.mdx" },
    -- No `dependencies`: LazyVim already loads nvim-treesitter and mini.icons, and
    -- naming them here risks pinning a stale repo path.
    opts = {
      pipe_table = {
        enabled = true,
        preset = "round",
        style = "full", -- draw the outer box, not just row separators
        cell = "padded", -- pad cells so columns align even when the source is ragged
        padding = 1,
        alignment_indicator = "━",
      },
      code = { sign = false, width = "block", right_pad = 1 },
      latex = { enabled = false }, -- no LaTeX here; avoids a checkhealth warning for a missing parser
      heading = { sign = false, icons = {} },
      checkbox = { enabled = false },
    },
    config = function(_, opts)
      require("render-markdown").setup(opts)

      Snacks.toggle({
        name = "Render Markdown",
        get = require("render-markdown").get,
        set = require("render-markdown").set,
      }):map("<leader>um")
    end,
  },

  -- Formatting half. prettier is what actually rewrites table pipes to aligned widths;
  -- markdownlint-cli2 only checks pipe style and does not pad cells.
  -- NOTE: format-on-save is opted out for markdown in `lua/config/autocmds.lua`, not
  -- here. Setting `init` on this spec would replace LazyVim's own `init`, which is what
  -- registers conform as the primary formatter, breaking <leader>cf for every filetype.
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["markdown"] = { "prettier" },
        ["markdown.mdx"] = { "prettier" },
      },
    },
  },

  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "prettier" } },
  },
}
