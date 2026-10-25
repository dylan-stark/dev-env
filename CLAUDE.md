# dev-env

Shared configuration and setup for two machines, both working directly on `main`:

- **mira**: System76 desktop, Omarchy Quattro (Arch, Hyprland), RTX 5060 Ti
- **air**: MacBook Air M1, macOS

Check `uname` / `hostname` to know which one you're on. Every change has to keep working on the other.

## Layout

- `dev-env [--dry]`: copies or symlinks configs into `$HOME`. `.config/nvim` is symlinked, `.config/hypr` is linked on Arch only.
- `run [filter] [--dry]`: runs each executable script in `runs/` (install steps for one tool each).
- `sync [--dry]`: `git pull --rebase --autostash`, then `./dev-env`, then reports unpushed commits.
- `.config/nvim`: LazyVim. `.config/hypr`: Hyprland (Lua, Omarchy Quattro). `.config/tmux`, `env/` (shell dotfiles), `.claude/skills`, `scripts/`.

## Workflow

- **Before editing**, run `./sync`, or at least `git pull --rebase --autostash`. Two machines editing a stale `main` is what causes conflicts here.
- **Before adding a tool or config**, check whether the other machine already added it (`git log origin/main`, `ls runs/`). Extend the existing file instead of writing a parallel one.
- Make small, focused commits. At the end of a session, remind the user to push. Work should never sit unpushed across days.
- Don't create per-machine branches.

## Conventions

- **Every `runs/*` script handles both machines**: an Arch branch (`sudo pacman -S --needed --noconfirm ...`), a Darwin branch (`brew install ...`), and an "unsupported" fallback that exits 1. If you can only test one side, still write the other. `runs/bacon` and `runs/rustup` are the pattern to follow.
- Top-level scripts keep the `--dry` flag and the `log`/`execute` helpers. Anything destructive goes through `execute`.
- **OS-specific Neovim settings** are guarded inline (`vim.fn.has("mac") == 1`). Keep shared behaviour shared.
- **`.config/nvim/lazy-lock.json`**: commit it, but plugin updates (`:Lazy update`) go in their own commit ("Updates plugins"). On a conflict, take the newer side whole (plus any newly added plugin entries) and run `:Lazy restore`. Never hand-merge commit hashes. Theme plugins come from Omarchy's current theme (`lua/plugins/theme.lua`) on mira only, so their entries (e.g. `everforest-nvim`) show up on mira and get dropped by air's `:Lazy update`. That churn is expected.
- Hyprland/Omarchy changes are Arch-only. Use the `omarchy` skill when editing `.config/hypr`.
