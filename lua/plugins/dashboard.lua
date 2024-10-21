return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local alpha = require('alpha')
        local dashboard = require('alpha.themes.dashboard')

        dashboard.section.header.val = {
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⣶⡙⣛⢻⣿⣿⣿⣿⣿⣿⣿⡄⣅⠹⣷⡹⣧⠈⢿⣧⠹⣿⣿⣿⣿⣷⣮⣏⣿⠀⣿⣀⣿⣿⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣤⡘⣿⣿⡀⣿⣿⣿⣿⣿⣿⣿⣿⣷⡘⠇⡙⣷⡙⣷⣀⣿⣄⡙⢿⣿⣿⣿⣿⣿⠙⠀⣿⠉⡏⣿⣿",
            "⣿⣿⣏⢽⣿⣿⣿⣿⣿⣿⣿⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠟⢡⣍⠘⣿⣿⣿⣿⣿⣿⣿⣟⣃⡀⣦⠘⢷⡌⢿⣿⡉⠻⣷⣬⣙⣛⣛⣃⣠⣾⣇⣸⠃⣿⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠏⣚⣌⡉⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣾⣿⣿⣿⣿⣽⡿⠿⠿⠛⣛⣛⣛⣧⣼⡇⠀⡙⢷⣍⠻⣦⣄⣉⣿⣿⡟⠛⠉⣠⡿⢋⣾⣿⣿",
            "⣽⣿⣿⣿⣿⣿⣿⣿⣿⣦⡙⣿⡿⣄⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⠿⢛⣩⡥⠰⠖⠚⠋⠉⠉⠀⠈⠁⠀⠀⠀⠀⠀⠙⠻⠦⣍⡛⠻⠿⠿⠿⠟⢋⠐⣿⣿⣿⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠛⣰⣦⣤⣿⣿⣿⡿⠟⣩⡴⠾⢛⣡⣴⡿⠟⣋⡥⠖⠛⠋⠀⠀⢀⡀⠒⠚⣛⣭⣭⣽⣿⣽⣿⣿⣷⣤⡀⠀⢰⣦⡤⡀⠀⠀⠐⢷⡌⢶⣿⣿⣿⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⡿⠿⣋⣀⣭⣵⣶⠿⢛⡋⠅⡀⠈⠀⠤⠐⢒⣒⣋⣥⣤⣄⡉⠁⠀⠨⣙⠻⢿⣿⣿⣿⣿⣿⣿⡄⠘⣰⣶⡄⣈⠳⢦⡀⠹⣆⢿⣿⣿⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⣋⣥⣶⣿⡿⠿⠛⠩⠔⠊⣡⣴⣿⠃⠀⠀⠀⠺⣿⣿⣿⣿⣿⣿⣿⣦⠠⣄⡀⠉⣒⠈⠙⠻⠿⣿⣿⡗⢠⣿⣿⡇⣿⣿⣦⡑⠀⠘⠘⣿⣿⣿",
            "⣿⣿⣿⣿⣿⣿⣿⡿⠟⣋⣥⣶⣿⡿⠛⣉⠰⢒⣨⣤⠘⣠⣾⣿⣿⠃⠄⣰⣄⠀⠀⠈⠁⠀⠀⠀⠀⠉⢉⡁⠘⠿⠖⠈⠁⠀⠈⡁⠀⠈⢀⣼⣿⣿⠇⠹⠿⠿⠷⠀⢠⠀⣿⡏⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣶⣿⡿⠟⣋⡥⠖⣉⢄⣴⣿⣿⡟⣰⣿⣿⡿⠁⠀⣼⣿⣿⣿⡶⠂⣲⠂⠀⢰⡤⠀⠀⣤⣀⠀⠠⣆⠀⢐⣋⣥⣶⣶⣿⣿⡿⠋⠀⠀⢀⠀⠀⠀⢸⣀⢿⢇⣿",
            "⣿⣿⣿⣿⣿⣿⠟⠋⠡⠶⢋⣥⢂⡞⣡⣾⣿⣿⢏⣼⣿⣿⠟⠁⣠⣾⣿⡙⢿⣿⣿⣇⠀⠀⢿⣄⣤⡏⠁⢿⣿⢷⡀⡻⠄⠂⢻⣿⣿⣿⡟⠋⠀⠀⠀⣀⠀⠀⠀⠀⠀⣿⠀⣼⣿",
            "⣿⣿⠿⢛⠉⢐⡄⡠⢀⣼⠏⠁⠈⣴⣿⣿⡿⣡⣾⣿⠟⠁⣠⣾⣿⣿⡏⢀⡀⢻⣿⣿⣿⣦⣆⢠⣤⣶⠲⠒⠋⠤⠋⠁⣠⣴⣾⣿⣿⣿⡇⢠⡀⡴⢀⡿⠃⠀⠀⠀⣸⣿⢸⣿⣿",
            "⣿⣷⡏⣡⣾⠋⣀⣴⡿⠁⣠⢎⣼⣿⣿⣿⣿⣿⠟⢁⣴⣿⣿⣿⣿⣿⢀⣿⣿⣿⣿⣿⣿⣿⡄⣸⣿⣿⣿⣷⣦⠀⠀⣺⣿⣿⣿⣿⣿⠿⠋⠀⠀⠀⠈⠁⣠⡴⢂⣴⣿⢋⣼⣿⣿",
            "⣿⢏⡴⢟⣡⣾⣿⢋⢄⡴⢣⣾⣿⡿⣿⡿⢋⠀⡰⢸⣿⣿⣿⣿⣿⣏⣼⣿⣿⣿⣿⣿⣿⣿⣰⣿⣿⣿⣿⣿⣿⣿⣶⣿⣿⣿⡟⠧⠀⠀⠀⠀⢀⣠⣶⠀⣩⣴⡿⢛⣥⣿⣿⣿⣿",
            "⢁⣨⣶⣿⣿⣿⣿⢃⡾⣱⣿⣿⡟⣡⠟⡄⢠⣾⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⢸⠀⠀⠀⠀⢯⣿⡇⠼⣛⣩⣴⣿⣿⣿⣿⣿⣿",
            "⣿⣿⣿⡿⠛⡼⠃⣾⢃⣿⣿⡿⢠⠃⣾⡇⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣠⣼⣼⣿⣿⣆⢸⣿⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            "⠿⣟⣉⡤⠈⠀⣼⡏⢸⣿⣿⠇⡟⠀⢿⡇⢿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠸⢃⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            "⣿⠿⠋⣠⡖⢠⣿⢀⢸⣿⣿⢸⠁⠀⠈⠿⠘⣿⣧⢹⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⠿⠿⠿⠿⠆⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            "⣿⣠⣾⡟⠀⣸⢃⣾⠈⣿⡏⠈⠀⠀⠀⠀⣄⡘⢿⣆⢻⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠺⡿⠟⣛⣩⢀⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            "⣿⣿⡿⠀⠀⠏⣼⣿⠀⣿⡇⠀⠀⠀⠀⠀⢸⣿⠂⠙⣧⣽⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⣰⣿⡿⢡⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            "⣿⣿⢡⢀⠀⣸⣿⣿⠀⣿⡇⠀⠀⠀⠀⠀⠀⢁⣤⣾⣿⠟⣣⣽⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠋⢩⣭⣤⣤⣍⡓⠚⠋⡟⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            "⣿⡇⡶⣾⢸⣿⠟⠃⠀⣿⡇⢀⣀⣤⡄⠀⠀⠀⠛⡩⡀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢧⣤⣄⣀⠀⠀⠐⠀⠀⠉⠁⣠⢎⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            "⠻⢰⡇⡇⣾⡿⠁⣶⠀⢿⣿⢸⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠳⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠉⣿⣿⣿⣷⣶⣶⣶⣶⡎⢁⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            "⣿⣦⡁⠇⡇⢡⣿⡏⠀⠘⢿⡄⢿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠉⠛⠿⠿⠿⠿⠛⢁⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            "⣿⣿⣿⣦⣀⠙⢿⡏⢠⣶⣦⡑⠀⠿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⢿⣿⣯⣿⣿⣿⣿⣿⣿⣿⠆⠀⢀⣀⠰⡖⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            "⣿⣿⣿⣿⣿⣷⣀⠀⢚⠛⠋⣡⣶⣶⣾⠟⡀⠀⠀⠀⠀⠀⠀⠤⠀⢀⣄⢀⠀⠉⠻⠘⣿⣿⣿⣿⣿⣥⣴⣾⣿⣿⡆⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            "⣿⣿⣿⣿⣿⣿⣿⣷⣤⡀⠸⣿⠟⢉⣤⣾⣿⠄⢀⣠⣴⣿⣿⠀⢤⣿⠟⡘⣇⢀⠰⢠⣈⠻⢿⣿⣿⣿⣿⣿⣿⠟⢁⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            "⠿⡟⢿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠊⠉⠛⠉⠀⠐⣿⣏⣼⣿⣿⣷⡘⡟⣰⣗⡀⢎⣧⠀⢿⣷⣦⣬⣉⣉⣭⣥⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢃⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            "⠤⠄⠀⠈⠻⢿⣿⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠚⠀⠈⠙⢋⣭⣤⡰⣿⣿⣿⣦⣍⡓⠆⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            "⣿⣿⣶⣶⣤⡀⠀⠩⣙⠻⢿⣿⣿⣦⡀⠀⠀⠀⠀⠀⡾⠀⠿⠟⣿⠁⢘⣿⣿⣿⣿⣿⣷⣶⣦⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣏⣼⡿⠟⢛⣛⡛⠻⢿⣿⣿⣿⡟⠙⣻",
            "⣿⣿⣿⣿⣿⣿⣦⡑⢌⠻⣦⣝⠿⣿⣿⣦⣀⠀⠀⠀⡆⢠⣼⣿⣿⣇⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⢿⣿⣿⣿⣿⣶⣤⣿⣤⣴⣿⣿",
            "⣶⣮⣭⣀⠉⠙⠿⣷⡌⠳⣌⠻⣷⣌⠻⣿⣿⣧⡀⠀⢁⣿⣿⣿⣿⣿⢈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣏⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
        }

        dashboard.section.buttons.val = {
            dashboard.button("SPC n", " > New file", "<CMD>ene<CR>"),
            dashboard.button(
            "SPC f f",
            "󰱽 > Find files",
            "<CMD>Telescope find_files<CR>"
            ),
            dashboard.button(
            "SPC f w",
            "󰑑 > Find word",
            "<CMD>Telescope live_grep<CR>"
            ),
            dashboard.button("q", " > Quit", "<CMD>qa<CR>"),
        }

        alpha.setup(dashboard.opts)
    end,
}
