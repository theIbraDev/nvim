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

            vim.keymap.set("n", "[t", function()
                require("trouble").next({skip_groups = true, jump = true});
            end),

            vim.keymap.set("n", "]t", function()
                require("trouble").previous({skip_groups = true, jump = true});
            end)
        },
    },
}
