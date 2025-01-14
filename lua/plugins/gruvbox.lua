return {
	"morhetz/gruvbox",
	enabled = true,
	priority = 1000,
	config = function()
		vim.o.background = "light"
		vim.g.gruvbox_contrast_dark = "soft"
		vim.g.gruvbox_contrast_light = "hard"
		vim.cmd("colorscheme gruvbox")
	end,
}

