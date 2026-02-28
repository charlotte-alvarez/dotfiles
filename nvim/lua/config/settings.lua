local global = vim.g
local o = vim.opt

-- Editor options


-- Disable netrw for nvim-tree
global.loaded_netrw = 1
global.loaded_netrwPlugin = 1

-- Line numbers
o.number = true 		-- Print the line number in front of each line
o.relativenumber = true 	-- Show the line number relative to the line with the cursor in front of each line.


-- Clipboard
o.clipboard = "unnamedplus" 	-- uses the clipboard register for all operations except yank.


-- Syntax
o.syntax = "on" 		-- When this option is set, the syntax with this name is loaded.


-- Indentation
o.autoindent = true 		-- Copy indent from current line when starting a new line.
o.expandtab = true 		-- In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
o.shiftwidth = 4 		-- Number of spaces to use for each step of (auto)indent.
o.tabstop = 4 			-- Number of spaces that a <Tab> in the file counts for.


-- Cursor and scrolling
o.cursorline = true 		-- Highlight the screen line of the cursor with CursorLine.
o.ruler = true 			-- Show the line and column number of the cursor position, separated by a comma.
o.mouse = "a" 			-- Enable the use of the mouse. "a" you can use on all modes
o.scrolloff = 20


-- Encoding
o.encoding = "UTF-8" 		-- Sets the character encoding used inside Vim.


-- Title
o.title = true 			-- When on, the title of the window will be set to the value of 'titlestring'
o.hidden = true 		-- When on a buffer becomes hidden when it is |abandon|ed


-- Timing
o.ttimeoutlen = 0 		-- The time in milliseconds that is waited for a key code or mapped key sequence to complete.


-- Command mode
o.showcmd = true 		-- Show (partial) command in the last line of the screen. Set this option off if your terminal is slow.
o.wildmenu = true 		-- When 'wildmenu' is on, command-line completion operates in an enhanced mode.


-- Editing
o.inccommand = "split" 		-- When nonempty, shows the effects of :substitute, :smagic, :snomagic and user commands with the :command-preview flag as you type.
o.showmatch = true 		-- When a bracket is inserted, briefly jump to the matching one.
o.ignorecase = true  -- Ignores casing wehn searching
o.smartcase = true   -- If you add casing to a search, focus on just that casing. Only all lowercase ignores all casing.
o.undofile = true       -- Remember undo's between sessions


-- Splitting
o.splitright = true		-- Default to splitting right
o.splitbelow = true 		-- When on, splitting a window will put the new window below the current one


-- Coloring
o.termguicolors = true


-- Abbreviations 
--vim.cmd [[
--    iabbrev @@ your@email.com
--]]


-- Visualizing
o.list = true
o.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Highlighting
o.hlsearch = true   -- Highlight on search

-- Small highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})
