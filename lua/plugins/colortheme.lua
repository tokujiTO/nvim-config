local function enable_transparency()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	"getomni/neovim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("omni")
		enable_transparency()
	end,
}
