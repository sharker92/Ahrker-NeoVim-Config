return {
	dir = vim.fn.stdpath("config") .. "/lua/plugins/present.nvim",
	enabled = true,
	config = function()
		-- require("present")  -- We use this if it isn't loaded by default in the plugin folder.
	end,
}

