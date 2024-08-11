return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",

	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		-- configure treesitter
		treesitter.setup({ -- enable syntax highlighting
			highlight = {
				enable = true,
				additonal_vim_regex_highlighting = false,
			},
			-- enable indentation
			indent = { enable = true, disable = { "lua" } },

			-- ensure these language parsers are installed
			ensure_installed = {
				"json",
				"javascript",
				"markdown",
				"bash",
				"lua",
				"vim",
				"gitignore",
				"vimdoc",
				"c",
				"python",
				"cpp",
				"java",
				"regex",
			},
			auto_install = true,

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
