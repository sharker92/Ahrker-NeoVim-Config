-- This folder holds all the code that gets run on startup.
vim.api.nvim_create_user_command("PresentStart", function()
	require("present").start_presentation()
end, {})

