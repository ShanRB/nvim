local M = {}

local function config_dapi_and_sign()
	local dap_breakpoint = {
		error = {
			text = "🛑",
			texthl = "LspDiagnosticsSignError",
			linehl = "",
			numhl = "",
		},
		rejected = {
			text = "",
			texthl = "LspDiagnosticsSignHint",
			linehl = "",
			numhl = "",
		},
		stopped = {
			text = "⭐️",
			texthl = "LspDiagnosticsSignInformation",
			linehl = "DiagnosticUnderlineInfo",
			numhl = "LspDiagnosticsSignInformation",
		},
	}

	vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
	vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
	vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
end

local function config_dapui()
	local dap, dapui = require("dap"), require("dapui")

	local debug_open = function()
		dapui.open()
		vim.api.nvim_command("DapVirtualTextEnable")
		vim.api.nvim_command("NvimTreeClose")
	end
	local debug_close = function()
		dap.repl.close()
		dapui.close()
		vim.api.nvim_command("DapVirtualTextDisable")
		-- vim.api.nvim_command("bdelete! term:")   -- close debug temrinal
	end

	dap.listeners.after.event_initialized["dapui_config"] = function()
		debug_open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		debug_close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		debug_close()
	end
	dap.listeners.before.disconnect["dapui_config"] = function()
		debug_close()
	end
end

local function config_debuggers()
	-- load from json file
	require("dap.ext.vscode").load_launchjs(nil, { cppdbg = { "cpp" } })
	require("dapc.dap-python")
end

local function auto_install()
	local mason_dap = require("mason-nvim-dap")
	mason_dap.setup({
		ensure_installed = { "python" },
		automatic_installation = true,
		handlers = nil,
	})
end

function M.setup()
	print("setup dap")
	auto_install()
	config_dapi_and_sign()
	config_dapui()
	config_debuggers() -- Debugger
end

return M
