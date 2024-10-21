return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_uninstalled = "✗",
                package_pending = "⟳",
            },
        },
    }
}
