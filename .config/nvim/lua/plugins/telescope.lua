return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local telescope = require("telescope")
        telescope.setup({
            pickers = {
                live_grep = {
                    file_ignore_patterns = { 'node_modules', '.git', '.venv' },
                    additional_args = function(_)
                        return { "--hidden" }
                    end
                },
                find_files = {
                    file_ignore_patterns = { 'node_modules', '.git', '.venv' },
                    hidden = true
                }
            },
        })
    end,
}
