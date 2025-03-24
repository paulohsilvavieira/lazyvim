-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
opt.relativenumber = false
opt.wrap = true

vim.fn.sign_define("DapBreakpoint", {
  text = "",
  texthl = "DiagnosticSignError",
  linehl = "",
  numhl = "",
})

vim.fn.sign_define("DapBreakpointRejected", {
  text = "",
  texthl = "DiagnosticSignError",
  linehl = "",
  numhl = "",
})
vim.fn.sign_define("DapStopped", {
  text = "",
  texthl = "DiagnosticSignWarn",
  linehl = "Visual",
  numhl = "DiagnosticSignWarn",
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  callback = function()
    local buf_ft = vim.bo.filetype

    if buf_ft == "dapui_breakpoints" then
      vim.cmd("setlocal winbar=\\ Breakpoints")
    end
    if buf_ft == "dapui_stacks" then
      vim.cmd("setlocal winbar=\\\\ Call\\ Stack")
    end

    if buf_ft == "dapui_scopes" then
      vim.cmd("setlocal winbar=\\\\ Variables")
    end

    if buf_ft == "dapui_watches" then
      vim.cmd("setlocal winbar=\\󰂥\\ Watches")
    end
    if buf_ft == "dapui_console" then
      vim.cmd("setlocal winbar=\\ Console")
    end
    if buf_ft == "dap-repl" then
      vim.cmd("setlocal winbar=\\ REPL")
    end
  end,
})
