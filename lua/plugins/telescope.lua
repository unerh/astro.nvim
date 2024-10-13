---@type LazySpec
return {
  "nvim-telescope/telescope-live-grep-args.nvim",
  lazy = true,
  specs = {
    {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-telescope/telescope-live-grep-args.nvim" },
      opts = function()
        local telescope = require "telescope"
        local ts_actions = require "telescope.actions"
        local lga_actions = require "telescope-live-grep-args.actions"

        telescope.setup {
          pickers = {
            find_files = {
              mappings = {
                n = {
                  ["d"] = ts_actions.delete_buffer,
                },
              },
            },
            buffers = {
              mappings = {
                n = {
                  ["d"] = ts_actions.delete_buffer,
                },
              },
            },
          },
          extensions = {
            live_grep_args = {
              auto_quoting = true, -- enable/disable auto-quoting
              mappings = { -- extend mappings
                i = {
                  ["<C-t>"] = lga_actions.quote_prompt { postfix = " -t" },
                  ["<C-i>"] = lga_actions.quote_prompt { postfix = " --iglob " },
                },
              },
            },
          },
        }

        telescope.load_extension "live_grep_args"
      end,
    },
  },
}
