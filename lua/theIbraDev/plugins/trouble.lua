return {
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            icons = true,
                mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"

            vim.keymap.set("n", "<leader>tt", function()
                require("trouble").toggle()
            end),
        },
    },
}
