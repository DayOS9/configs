return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		require("alpha.term")

		-- Set header
		dashboard.opts.opts.noautocmd = true
		dashboard.section.terminal.opts.redraw = true
		--dashboard.section.terminal.command = "cat ~/.config/nvim/lua/daois/plugins/imageEye.txt"
		dashboard.section.terminal.command = "cat ~/.config/nvim/lua/daois/plugins/nvimlain.txt"
		dashboard.section.terminal.width = 80
		dashboard.section.terminal.height = 28

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
			dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
			dashboard.button("SPC ff", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
			dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
			--dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
			dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
		}

		dashboard.opts.layout = {
			{ type = "padding", val = 13 },
			dashboard.section.terminal,
			{ type = "padding", val = 3 },
			dashboard.section.buttons,
			dashboard.section.footer,
		}

		-- Send config to alpha
		alpha.setup(dashboard.config)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
