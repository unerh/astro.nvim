---@type LazySpec
return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "theHamsta/nvim-dap-virtual-text",
    commit = "9578276", -- Add this as a dependency
  },
  config = function()
    require("nvim-dap-virtual-text").setup {
      enabled = true, -- enable virtual text
      -- enabled_commands = false,           -- disable the dap-virtual-text commands, only define them if you are using nvim-dap
      highlight_changed_variables = true, -- highlight changed variables
      highlight_new_as_changed = true, -- highlight new variables in the same way as changed variables
      show_stop_reason = true, -- show stop reason when stepping or pausing in debug mode
      commented = true, -- prefix virtual text with a comment string
      virt_text_pos = "eol", -- position of virtual text (eol|overlay|right_align)
      all_frames = false, -- show virtual text for all stack frames (not just top)
      virt_lines = false, -- show virtual text as virtual lines (experimental feature)
    }

    local dap = require "dap"

    dap.configurations.python = dap.configurations.python or {}
    -- dap.configurations.go = dap.configurations.go or {}

    -- Add the new configuration
    table.insert(dap.configurations.python, {
      type = "python",
      request = "attach",
      connect = {
        port = 5678,
        host = "127.0.0.1",
      },
      mode = "remote",
      name = "Remote Attach",
      cwd = vim.fn.getcwd(),
      pathMappings = {
        {
          localRoot = vim.fn.getcwd(), -- Adjust this if your code is in a different directory
          remoteRoot = "/app", -- Adjust this to match the root directory in the Docker container
        },
      },
    })
  end,
}
