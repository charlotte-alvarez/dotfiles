local k = vim.keymap
local wk = require("which-key").add

wk({
    { "jk", "<Esc>", desc = "Exit insert mode with jk", mode = "i" },
    { "<leader>d", "_d", desc = "delete without removing clipboard", mode = {"n", "v"}},
    { "<Esc>", "<cmd>nohlsearch<CR>", desc = "Removing highlighting when esc pressed"},

    -- Window controls
    { "<leader>w", desc = "Window" },
    { "<leader>wl", "<cmd>vs_f<CR>", noremap = true, desc = "RIGHT Split" },
    { "<leader>wj", "<cmd>sp_f<CR>", noremap = true, desc = "DOWN Split" },
    { "<leader>wH", "<C-w>h", noremap = true, desc = "Move to LEFT Window" },
    { "<leader>wJ", "<C-w>j", noremap = true, desc = "Move to DOWN Window" },
    { "<leader>wK", "<C-w>k", noremap = true, desc = "Move to UP Window" },
    { "<leader>wL", "<C-w>l", noremap = true, desc = "Move to RIGHT Window" },

    -- Quitting Windows
    { "<leader>qq", "<cmd>wq<CR>", noremap = true, desc = "Quit" },
    { "<leader>qa", "<cmd>wqa<CR>", noremap = true, desc = "Quit all" },
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

-- telescope
local telescope = require("telescope.builtin")
wk({
    { "<leader>f", group = "Find"},
    { "<leader>fc", function() telescope.find_files() end, desc = "CWD Files" },
    { "<leader>ff", function() telescope.git_files() end, desc = "Project Files" },
    { "<leader>fs", function() telescope.live_grep() end, desc = "Live Grep" },
    { "<leader>fk", function() telescope.keymaps() end, desc = "Keymaps" },
    { "<leader>fh", function() telescope.help_tags() end, desc = "Help Tags" },
})

-- ToggleTerm
wk({
    { "<leader>T", group = "Terminal"},
    { "<leader>Tt", "<cmd>ToggleTerm<CR>", desc = "Toggle" },
})
