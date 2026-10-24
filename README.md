## Cheatsheet

| **Mappings** | **Action** |
|--------------|------------|
| `<S+k>`    | Hover pop-up: `vim.lsp.buf.hover()` |
| `<^+]>`    | Jump to definition |
| `<^+t>`    | Jump back |
| `"+y`      | Yank to clipboard (built-in) |
| `z{t,z,b}` | Move current line to top, middle, or bottom of screen |
| `{H,M,L}`  | Move cursor to top (high), middle, or bottom (low) |

- `:%!jq` to format current buffer of JSON with `jq`

## Troubleshooting Rust in Neovim

Neovim runs the rust-analyzer that ships with each project's toolchain
(`rustup which rust-analyzer`, which honours `rust-toolchain.toml`) and falls
back to Mason's copy when that toolchain has no rust-analyzer component. See
`.config/nvim/lua/plugins/rust.lua`. The server it picked is shown in a
notification when it starts.

**Symptom:** red undercurls everywhere, but `<leader>cd` / `]d` show no
diagnostics. Those are `unresolvedReference` semantic tokens, not
diagnostics: rust-analyzer can't resolve names, usually because it's out of
step with the toolchain.

Run the doctor against a file that's acting up:

```sh
scripts/nvim-rust-doctor path/to/file.rs      # waits 45s for rust-analyzer
scripts/nvim-rust-doctor path/to/file.rs 90   # bigger workspace, wait longer
```

What to look for in its output:

| Section | Healthy | Problem |
|---------|---------|---------|
| `== toolchain` → `rustup which:` | a path under `~/.rustup/toolchains/<toolchain>/bin/` | `error: not a file` means the component isn't installed, so Mason's copy gets used |
| `== lsp clients` | one `rust-analyzer` whose version roughly matches the toolchain | a `mason/bin` path with an old date, or `none attached` |
| `unresolved references:` | 0, or only names that really are undefined | std names like `Ok`, `Result`, `std` listed |
| `== rust-analyzer status` → `Loaded N packages` | roughly the dependency count from `Cargo.lock` | a suspiciously small number |
| Startup notice | none | `using an outdated toolchain version ... only supports X and higher` |

Fixes:

```sh
# Install the analyzer for the project's pinned toolchain (most common fix)
rustup component add rust-analyzer --toolchain <name from rust-toolchain.toml>

# Keep the stable/nightly toolchains (and their analyzers) current
rustup update

# Refresh Mason's fallback copy (or :MasonUpdate / :Mason in Neovim)
nvim --headless +'lua require("lazy").load({plugins={"mason.nvim"}}); require("mason-registry").get_package("rust-analyzer"):install():once("closed", function() vim.schedule(function() vim.cmd("qa!") end) end)'
```

Inside Neovim, `:checkhealth vim.lsp` shows the attached server,
`:RustLsp logFile` opens the rust-analyzer log, and
`:RustLsp reloadWorkspace` re-reads `Cargo.toml`. After a fix, restart the
server with `:lsp restart rust-analyzer`, or reopen Neovim.

