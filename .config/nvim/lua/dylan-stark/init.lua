require("dylan-stark.lazy")
require("dylan-stark.remap")
require("dylan-stark.rust")

-- Setting spaces instead of tabs
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

-- Relative line numbering
vim.wo.relativenumber = true
vim.wo.number = true

-- Nicer scrolling
vim.opt.scrolloff = 8

-- LSP-specific bindings
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local bufmap = function(mode, lhs, rhs)
      local opts = {buffer = event.buf}
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- You can find details of these function in the help page
    -- see for example, :help vim.lsp.buf.hover()

    -- Trigger code completion
    bufmap('i', '<C-Space>', '<C-x><C-o>')

    -- Display documentation of the symbol under the cursor
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

    -- Jump to the definition
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

    -- Jump to declaration
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

    -- Lists all the implementations for the symbol under the cursor
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

    -- Jumps to the definition of the type symbol
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

    -- Lists all the references 
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

    -- Displays a function's signature information
    bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

    -- Renames all references to the symbol under the cursor
    --bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

    -- Format current file
    bufmap('n', 'ff', '<cmd>lua vim.lsp.buf.format()<cr>')

    -- Selects a code action available at the current cursor position
    bufmap('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>')

    -- Toggle inlay hints
    bufmap('n', '<leader>i', '<cmd> lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>')
  end
})

