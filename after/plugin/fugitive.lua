vim.keymap.set('n', '<leader>gs', function() vim.cmd('vertical Git') end)
vim.keymap.set('n', '<leader>gc', function() vim.cmd.Git('commit') end)
vim.keymap.set('n', '<leader>gp', function() vim.cmd.Git('push') end)
