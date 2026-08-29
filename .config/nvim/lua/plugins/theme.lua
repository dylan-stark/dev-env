-- Colorscheme spec supplied by the current Omarchy theme, which ships one at
-- ~/.local/state/omarchy/current/theme/neovim.lua and repoints that path when
-- the theme changes.
--
-- Omarchy installs this file as a relative symlink assuming it sits physically
-- under ~/.config/nvim. This config is symlinked in from a dotfiles repo, so
-- the relative target resolved against the repo root instead and dangled,
-- breaking `require("plugins.theme")`. Resolve from $HOME instead, which holds
-- wherever the repo is cloned and on any username.
local theme = vim.fn.expand("~/.local/state/omarchy/current/theme/neovim.lua")

if vim.fn.filereadable(theme) == 0 then
  return {}
end

local ok, spec = pcall(dofile, theme)
if not ok or type(spec) ~= "table" then
  return {}
end

return spec
