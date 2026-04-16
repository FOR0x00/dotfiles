return {
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>y", ":Yazi<cr>", silent = true },
		},
		opts = {
			use_ya_for_events_reading = true,
			use_yazi_client_id_flag = true,

			keymaps = {
				show_help = "~",
			},
		},
	},
	{
		"christoomey/vim-tmux-navigator",
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
}
