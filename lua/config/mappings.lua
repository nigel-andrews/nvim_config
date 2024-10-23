local map = vim.keymap.set

map('v', '<leader>/', 'gc', { desc = "Comment selection", remap = true });
map('n', '<leader>la', function() vim.lsp.buf.code_action() end, { desc = 'LSP code action' })
map('n', '<leader>ld', function() vim.diagnostic.open_float() end, { desc = 'Hover diagnostics' })
map('n', '<leader>lr', function() vim.lsp.buf.rename() end, { desc = 'Rename symbol' })
map('n', '<leader>lh', function() vim.lsp.buf.signature_help() end, { desc = 'Signature help' })
map('n', '<leader>lG', function() vim.lsp.buf.workspace_symbol() end, { desc = 'Workspace symbol' })
map('n', '<leader>tt',  "<cmd>ToggleTerm<cr>", { desc = 'Open terminal' })
map('n', '<leader>tf',  "<cmd>ToggleTerm direction=float<cr>", { desc = 'Open floatting terminal' })
map('n', '<leader>tv',  "<cmd>ToggleTerm direction=vertical<cr>", { desc = 'Open terminal v-split' })