local keymap = vim.keymap
local opts = { noremap = true, silent = true }

local mappings = {
	{ mode = "", from = "H", to = "^" },
	{ mode = "", from = "L", to = "$" },
	{ mode = "", from = "J", to = "5j" },
	{ mode = "", from = "K", to = "5k" },
	{ mode = "", from = "<D-a>", to = "<Esc>gg<S-v>G$" },
	{ mode = "n", from = "x", to = '"_x' },
	{ mode = "n", from = "<BS>", to = "s" },
}

for _, mapping in ipairs(mappings) do
	keymap.set(mapping.mode, mapping.from, mapping.to, opts)
end

keymap.del("n", "<leader>|")
keymap.set("n", "<leader>\\", "<C-W>v", { desc = "Split Window Right" })
