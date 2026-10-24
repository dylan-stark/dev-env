-- Run the rust-analyzer that ships with the project's toolchain.
--
-- rustaceanvim otherwise picks whatever `rust-analyzer` is first on PATH,
-- which under LazyVim is Mason's copy. Mason never updates it on its own, and
-- an analyzer older than the toolchain cannot resolve names in the newer std:
-- every identifier comes back as an `unresolvedReference` semantic token
-- (red undercurl) with no diagnostic attached. `rustup which` honours
-- rust-toolchain.toml, so the analyzer always matches the sysroot. Install it
-- per toolchain with `rustup component add rust-analyzer --toolchain <name>`.
-- Mason's binary is the fallback when rustup has no component.
--
-- Debug with: scripts/nvim-rust-doctor <file.rs>
local notified = {}

local function rust_analyzer_bin()
  local dir = vim.fn.expand("%:p:h")
  if vim.fn.isdirectory(dir) == 0 then
    dir = vim.uv.cwd()
  end

  if vim.fn.executable("rustup") == 1 then
    local ok, res = pcall(function()
      return vim.system({ "rustup", "which", "rust-analyzer" }, { cwd = dir, text = true }):wait(5000)
    end)
    local path = ok and res.code == 0 and vim.trim(res.stdout or "") or ""
    if path ~= "" and vim.fn.executable(path) == 1 then
      return path
    end
  end

  return vim.fn.exepath("rust-analyzer")
end

return {
  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        cmd = function()
          local bin = rust_analyzer_bin()
          if bin == "" then
            bin = "rust-analyzer"
          end
          if not notified[bin] then
            notified[bin] = true
            vim.notify("rust-analyzer: " .. bin, vim.log.levels.INFO, { title = "rustaceanvim" })
          end
          return { bin, "--log-file", require("rustaceanvim.config.internal").server.logfile }
        end,
      },
    },
  },
}
