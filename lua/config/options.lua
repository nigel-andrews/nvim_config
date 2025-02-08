vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.autoindent = true
vim.opt.copyindent = true
vim.opt.preserveindent = true
vim.opt.smartindent = true

vim.opt.completeopt = { "longest", "menuone" }

vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true

-- TODO: Change in function of filetype
vim.opt.textwidth = 80;
vim.opt.wrap = true;

vim.opt.hlsearch = false
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true

vim.filetype.add({
    extension = {
        h = "cpp",
        vert = "glsl",
        frag = "glsl",
        comp = "glsl",
    },
})

vim.opt.list = true
vim.opt.listchars = { tab = "»·", trail = "·" }

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "make" },
    command = "setlocal noexpandtab shiftwidth=8",
})
