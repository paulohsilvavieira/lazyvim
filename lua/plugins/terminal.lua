return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        opts = function()
            require("toggleterm").setup()
        end,
        keys = {
            { "<leader>th", "<cmd>ToggleTerm size=20 direction=horizontal<cr>", desc = "Open a horizontal terminal" },
            { "<leader>tf", "<cmd>ToggleTerm size=20 direction=float<cr>",   },
            { "<leader>tv", "<cmd>ToggleTerm size=20 direction=vertical<cr>", desc = "Open a vertical terminal" }

        },
    }
}
