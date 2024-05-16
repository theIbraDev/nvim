return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gg", vim.cmd.Git)

        local theIbraDev_fugitive = vim.api.nvim_create_augroup("theIbraDev_Fugitive", {})

        local autocmd = vim.api.nvim_create_autocmd
        autocmd("BufWinEnter", {
            group = theIbraDev_fugitive,
            -- Removed group
            pattern = "*",
            callback = function()
                if vim.bo.ft ~= "fugitive" then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local opts = {buffer = bufnr, remap = false}

                vim.keymap.set("n", "<leader>p", function()
                    vim.cmd [[ Git push ]]
                end, opts)

                -- Only used when commit messages are useless.
                -- Looking at you merge bros
                vim.keymap.set("n", "<leader>scp", function ()
                    vim.cmd [[ Git commit -m "update markdown" | Git push ]]
                end, opts)

                -- Goat fugitive command. Pull with rebase.
                vim.keymap.set("n", "<leader>P", function()
                    vim.cmd [[ Git pull --rebase ]]
                end, opts)

                -- Check if git config returns +refs/heads/*:refs/remotes/origin/*
                vim.keymap.set("n", "<leader>c", function()
                    vim.cmd [[ Git config --get remote.origin.fetch ]]
                end, opts)

                -- Set git config. Needed for --bare repos
                vim.keymap.set("n", "<leader>C", ":Git config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'", opts);
                -- Allows you to push to a branch other than current branch NOTE: It allows me to easily set the branch i am pushing and any tracking needed if i did not set the branch up correctly
                vim.keymap.set("n", "<leader>gp", ":Git push -u origin ", opts);

                -- TODO: Add a hotkey to add a new origin. very practical if origin is not setup
                vim.keymap.set("n", "<leader>go", ":Git remote add origin ", opts);
                -- if we don't have an origin set up for the current
                -- repository.
                -- vim.keymap.set
                -- Rebase current branch into X branch
                vim.keymap.set("n", "<leader>gr", ":Git rebase ", opts);

                -- See branches, select and checkout
            end,
        })
    end
}
