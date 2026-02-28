local k = vim.keymap

k.set('i', 'jk', '<Esc>', { desc = 'exit insert with jk' })
k.set('n', '<leader>d', '"_d', { desc = 'delete without removing clipboard' })
k.set('v', '<leader>d', '"_d', { desc = 'delete without removing clipboard' })
k.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Remove highlighting when esc pressed' })
