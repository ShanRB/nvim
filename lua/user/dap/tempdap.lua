local dapconfig = require("dap")

dapconfig.adapters.python = {
    type = 'executable',
    command = 'python3',
    args = { '-m', 'debugpy.adapter' }
}

dapconfig.configurations.python = {
    {
        type = 'python',
        request = 'launch',
        name = 'Lanuch file',
        program = "${file}",
        pythonPath = function()
            return 'usr/bin/python3'
        end
    }
}
