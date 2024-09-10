return {{
    "nvim-telescope/telescope.nvim",
    opts = {
        pickers = {
            find_files = {
                find_command = {"rg", "--files", "--hidden", "--glob=**/**", "--glob=!**/.git/*", "--glob=!**/.idea/*",
                                "--glob=!**/build/*", "--glob=!**/dist/*", "--glob=!**/node_modules/*",
                                "--glob=!**/**lock**"}
            },
            live_grep = {
                additional_args = {"--hidden", "--glob=**/**", "--glob=!**/.git/*", "--glob=!**/.idea/*",
                                "--glob=!**/build/*", "--glob=!**/dist/*", "--glob=!**/node_modules/*",
                                "--glob=!**/**lock**"}
            }
        }
    }
}}
