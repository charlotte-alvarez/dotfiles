local k = vim.keymap
local wk = require("which-key").add

wk({
    { "jk", "<Esc>", desc = "Exit insert mode with jk", mode = "i" },
    { "<leader>d", '"_d', desc = "delete without removing clipboard", mode = {"n", "v"}},
    { "<Esc>", "<cmd>nohlsearch<CR>", desc = "Removing highlighting when esc pressed"}
})


-- nvim-tree
local tree = require("nvim-tree.api").tree
wk({
    { "<leader>e", group = "file explorer" },
    { "<leader>ee", function() tree.toggle() end, desc = "Toggle nvim-tree", mode = "n"}
})
