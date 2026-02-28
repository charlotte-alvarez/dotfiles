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
    { "<leader>e", group = "File Explorer" },
    { "<leader>ee", function() tree.toggle() end, desc = "Toggle nvim-tree", mode = "n"}
})

-- trouble
wk({
    { "<leader>x", group = "Diagnostics"},
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
    { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
    { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
    { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
    { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references / ... (Trouble)" },
    { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
})
