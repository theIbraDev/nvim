local Hooks = require("git-worktree.hooks")
-- register a new hook on SWITCH event
Hooks.register(Hooks.type.SWITCH, function(path, prev_path)
    -- log a nice switch message
	-- nvim notify
	vim.notify("switched from " .. prev_path .. " to " .. path)
    -- check if current buffer is an oil buffer
    if vim.fn.expand("%"):find("^oil:///") then
        -- switch to new cwd in oil
        require("oil").open(vim.fn.getcwd())
    else
        -- use built in hook for non oil buffers
        Hooks.builtins.update_current_buffer_on_switch(path, prev_path)
    end
end)
