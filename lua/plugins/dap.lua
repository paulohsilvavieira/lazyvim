-- local js_based_languages = {
--   "typescript",
--   "javascript",
-- }

-- -- Setup nvim-dap-vscode-js
-- local function setup_vscode_js()
--   require("dap-vscode-js").setup({
--       node_path = "node",
--       debugger_path = vim.fn.stdpath('data') .. "/lazy/vscode-js-debug",
--       adapters = { "pwa-node", "node" },
--   })
-- end

-- -- Setup nvim-dap-virtual-text
-- local function setup_virtual_text()
--   require("nvim-dap-virtual-text").setup({
--       enabled = true,
--       enabled_commands = true,
--       highlight_changed_variables = true,
--       highlight_new_as_changed = false,
--       show_stop_reason = true,
--       commented = false,
--       only_first_definition = true,
--       all_references = false,
--       clear_on_continue = false,
--       display_callback = function(variable, buf, stackframe, node, options)
--           if options.virt_text_pos == "inline" then
--               return " = " .. variable.value
--           else
--               return variable.name .. " = " .. variable.value
--           end
--       end,
--       virt_text_pos = vim.fn.has("nvim-0.10") == 1 and "inline" or "eol",
--       all_frames = false,
--       virt_lines = false,
--       virt_text_win_col = nil,
--   })
-- end

-- -- Setup nvim-dap-ui
-- local function setup_dap_ui()
--   require("dapui").setup({
--       controls = {
--           enabled = true,
--           element = "repl",
--           icons = {
--               pause = "",
--               play = "",
--               step_into = "",
--               step_over = "",
--               step_out = "",
--               step_back = "",
--               run_last = "",
--               terminate = "",
--               disconnect = "",
--           },
--       },
--       layouts = {
--           {
--               elements = {
--                   { id = "scopes",      size = 0.33 },
--                   { id = "breakpoints", size = 0.17 },
--                   { id = "stacks",      size = 0.25 },
--                   { id = "watches",     size = 0.25 },
--               },
--               size = 0.20,
--               position = "left",
--           },
--           {
--               elements = {
--                   { id = "repl",    size = 0.6 },
--                   { id = "console", size = 0.4 }
--               },
--               size = 0.20,
--               position = "bottom",
--           },
--       },
--   })
-- end

-- -- Setup DAP listeners
-- local function setup_dap_listeners()
--      local dap = require("dap")
--       local dapui = require("dapui")
--   dap.listeners.before.attach.dapui_config = function()
--       dapui.open()
--   end
--   dap.listeners.before.launch.dapui_config = function()
--       dapui.open()
--   end
--   dap.listeners.before.event_terminated.dapui_config = function()
--       dapui.close()
--   end
--   dap.listeners.before.event_exited.dapui_config = function()
--       dapui.close()
--   end
-- end

-- -- Setup Ruby adapters and configurations
-- local function setup_ruby()
--   local dap = require("dap")
--   require("dap-ruby").setup()

--   dap.adapters.ruby = {
--       type = "server",
--       port = "9229",
--       command = vim.fn.expand("$HOME/.rbenv/shims/rdbg"),
--       args = { "--open", "--port", "9229", "--" },
--   }


--   dap.configurations.ruby = {
--       {
--           type = "ruby",
--           request = "launch",
--           name = "Debug Rails App",
--           command = "bin/rails s",
--           useBundler = true,
--       },

--       {
--           type = "ruby",
--           name = "Debug Current File",
--           request = "attach",
--           localfs = true,
--           command = "ruby",
--           script = "${file}",
--       },
--       {
--           type = "ruby",
--           name = "Debug Sinatra App",
--           request = "launch",
--           command = "rackup -o 0.0.0.0 --port=3000",
--           useBundler = true,

--       },
--       {
--           type = "ruby",
--           name = "Attach Process",
--           request = "attach",
--           localfs = true,
--           processId = require 'dap.utils'.pick_process,
--       },
--       {
--           type = "ruby",
--           name = "Debug Spec File",
--           request = "attach",
--           localfs = true,
--           command = "rspec",
--           script = "${file}",
--       },
--   }
-- end

-- local function setup_js_based_languages()
--   local dap = require("dap")
--   for _, language in ipairs(js_based_languages) do
--       dap.configurations[language] = {
--           {
--               type = "pwa-node",
--               request = "attach",
--               name = "Auto Attach",
--               cwd = vim.fn.getcwd(),
--               protocol = "inspector",
--               port = function()
--                   return vim.fn.input("Select port: ", 9229)
--               end,
--           },
--           {
--               name = "-----------------",
--               type = "",
--               request = "launch",
--           },

--       }
--   end
-- end

-- local function setup_key_mappings()
--   return {
--       { "<F9>", function() require("dap").toggle_breakpoint() end },
--       { "<leader>dc", function()
--           if vim.fn.filereadable(".vscode/launch.json") then
--               local dap_vscode = require("dap.ext.vscode")
--               dap_vscode.json_decode = require("json5").parse
--               dap_vscode.load_launchjs(nil, {
--                   'pwa-node'})
--           end
--           require("dap").continue()
--       end, desc = "Run Debugger" },
--       { "<S-F5>",     function() require("dap").terminate() end },
--       { "<F10>",      function() require("dap").step_over() end },
--       { "<F11>",      function() require("dap").step_in() end },
--       { "<S-F11>",    function() require("dap").step_out() end },
--       { "<C-S-F5>",   function() require("dap").run_last() end },
--       { "<leader>dd", function() require("dapui").toggle() end, desc = "Hide Dap Ui"},

--   }
-- end

-- return {
--   "mfussenegger/nvim-dap",
--   dependencies = {
--       { "suketa/nvim-dap-ruby" },
--       { "theHamsta/nvim-dap-virtual-text" },
--       { "nvim-neotest/nvim-nio" },
--       { "rcarriga/nvim-dap-ui" },
--       {
--           "microsoft/vscode-js-debug",
--           build = "npm i --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
--       },
--       {
--           "mxsdev/nvim-dap-vscode-js",
--           config = setup_vscode_js(),
--       },
--       {
--           "Joakker/lua-json5",
--           build = "./install.sh",
--       },
--   },
--   opts = function()
--       setup_ruby()
--       setup_js_based_languages()
--       setup_virtual_text()
--       setup_dap_ui()

--       setup_dap_listeners()
      
      
--   end,
--   keys = setup_key_mappings(),
-- }
local function setup_ruby()
    local dap = require("dap")
    require("dap-ruby").setup()
  
    dap.adapters.ruby = {
        type = "server",
        port = "9229",
        command = vim.fn.expand("$HOME/.rbenv/shims/rdbg"),
        args = { "--open", "--port", "9229", "--" },
    }
  
  
    dap.configurations.ruby = {
        {
            type = "ruby",
            request = "launch",
            name = "Debug Rails App",
            command = "bin/rails s",
            useBundler = true,
        },
  
        {
            type = "ruby",
            name = "Debug Current File",
            request = "attach",
            localfs = true,
            command = "ruby",
            script = "${file}",
        },
        {
            type = "ruby",
            name = "Debug Sinatra App",
            request = "launch",
            command = "rackup -o 0.0.0.0 --port=3000",
            useBundler = true,
  
        },
        {
            type = "ruby",
            name = "Attach Process",
            request = "attach",
            localfs = true,
            processId = require 'dap.utils'.pick_process,
        },
        {
            type = "ruby",
            name = "Debug Spec File",
            request = "attach",
            localfs = true,
            command = "rspec",
            script = "${file}",
        },
    }
  end
return {
    {
        "mfussenegger/nvim-dap",
        opts=function()
            setup_ruby()
        end
    }
}