return {
	"rebelot/kanagawa.nvim",
	priority = 1000,
	config = function()
		vim.cmd("colorscheme kanagawa")

		vim.keymap.set("n", "<leader>cc", function()
			if vim.o.background == "dark" then
				vim.o.background = "light"
				vim.cmd("colorscheme kanagawa-lotus")
			else
				vim.o.background = "dark"
				vim.cmd("colorscheme kanagawa-wave")
			end
		end, { desc = "Toggle between dark/light mode" })
	end,
}
