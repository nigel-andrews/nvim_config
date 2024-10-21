-- Makefile tab change
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "make" },
    command = "setlocal noexpandtab shiftwidth=8",
})

-- Nix tab change
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "nix" },
    command = "set shiftwidth=2",
})
