local dap = require("dap")
dap.set_log_level("TRACE")

-- generic DAP configurations
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp',
    function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)

local dapui = require("dapui")
dapui.setup()
vim.keymap.set('n', '<Leader>du', dapui.toggle)
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
    require('dap.ui.widgets').hover()
end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
    require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end)

require('mason-nvim-dap').setup({
    ensure_installed = {"delve", "python"}
})

local dapgo = require("dap-go")
dapgo.setup(
    {
        -- delve configurations
        delve = {
            -- the path to the executable dlv which will be used for debugging.
            -- by default, this is the "dlv" executable on your PATH.
            path = "dlv",
            -- time to wait for delve to initialize the debug session.
            -- default to 20 seconds
            initialize_timeout_sec = 20,
            -- a string that defines the port to start delve debugger.
            -- default to string "${port}" which instructs nvim-dap
            -- to start the process in a random available port
            port = "${port}",
            -- additional args to pass to dlv
            args = { "-tags=all_tests,unit_tests,race_sensitive_tests" }
        },
    }
)
vim.keymap.set("n", "<leader>dt", dapgo.debug_test)
vim.keymap.set("n", "<leader>dl", dapgo.debug_last_test)
