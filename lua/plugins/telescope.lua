return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = {
          'nvim-lua/plenary.nvim',
          'nvim-treesitter/nvim-treesitter',
          'nvim-tree/nvim-web-devicons',
          'nvim-telescope/telescope-ui-select.nvim',
      },
      keys = function()
          local builtin = require("telescope.builtin")
          return {
              { "<leader>ff", builtin.find_files, desc = "files" },
              { "<leader>fw", builtin.live_grep, desc = "grep" },
              { "<leader>fb", builtin.buffers, desc = "buffers" },
              { "<leader>lD", builtin.diagnostics, desc = "diagnostics" },
          }
      end,
      cmd = "Telescope",
      config = function()
          local telescope = require("telescope")
          telescope.setup()
          telescope.load_extension("ui-select")
      end,
  }
