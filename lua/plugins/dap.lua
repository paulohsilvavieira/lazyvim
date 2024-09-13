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
  
local function setup_key_mappings()
    return {
      { "<F9>",function() require("dap").toggle_breakpoint() end },
      { "<F5>", function() require("dap").continue() end },
      { "<F10>",      function() require("dap").step_over() end },
      
  
    }
  end
return {
    {
        "mfussenegger/nvim-dap",
        opts=function()
            setup_ruby()
        end,
        keys=setup_key_mappings()
    }
}