local function setup_dap_ui()
  require("dapui").setup({
      controls = {
          enabled = true,
          element = "repl",
          icons = {
              pause = "",
              play = "",
              step_into = "",
              step_over = "",
              step_out = "",
              step_back = "",
              run_last = "",
              terminate = "",
              disconnect = "",
          },
      },
      layouts = {
          {
              elements = {
                  { id = "scopes",      size = 0.25 },
                  { id = "stacks",      size = 0.25 },
                  { id = "watches",     size = 0.25 },
                  { id = "breakpoints", size = 0.25 },
              },
              size = 0.20,
              position = "left",
          },
          {
              elements = {
                  { id = "repl",    size = 0.5 },
                  { id = "console", size = 0.5 }
              },
              size = 0.20,
              position = "bottom",
          },
      },
  })
end



return {
  "rcarriga/nvim-dap-ui",
  dependencies = { "nvim-neotest/nvim-nio" },
  opts = {},
  config = function(_, opts)
  
    setup_dap_ui()
  end
}