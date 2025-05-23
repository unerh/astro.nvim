-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Tab>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["<S-Tab>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["<M-d>"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },
        ["<C-p>"] = { function() require("astrocore.buffer").prev() end, desc = "Switch buffer" },
        ["<C-n>"] = {
          function()
            require("astroui.status.heirline").buffer_picker(function(bufnr) vim.api.nvim_win_set_buf(0, bufnr) end)
          end,
          desc = "Select buffer from tabline",
        },
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },
        ["<Leader>Dl"] = {
          ":DiffviewOpen origin/HEAD...HEAD --imply-local<CR>",
          desc = "DiffView Open Local",
        },
        ["<Leader>Df"] = {
          ":DiffviewFileHistory %<CR>",
          desc = "DiffView Current File",
        },
        ["<Leader>Dc"] = {
          ":DiffviewClose<CR>",
          desc = "DiffView Close",
        },

        ["<leader>ss"] = { ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>", desc = "Replace Current" },
        ["<leader>se"] = { ":%s///gc<Left><Left><Left>", desc = "Replace Text" },
        ["<leader>fg"] = {
          ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
          desc = "Find Live Grep Args",
        },
        ["<leader>fG"] = {
          ":lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor({postfix = ' -Fit'})<CR>",
          desc = "Find Live Grep Args",
        },
        ["<leader>fj"] = { ":Telescope jumplist<cr>", desc = "Find jumplist" },
        ["<leader>ge"] = { ":GitBlameOpenFileURL<cr>", desc = "Git Blame Open File" },
        ["<leader>gn"] = { ":GitBlameCopyFileURL<cr>", desc = "Git Blame Copy File" },
        ["<leader>gP"] = {
          function()
            local pr_number = vim.fn.input "Enter PR Number (enter for clipboard): "
            if pr_number == "" then pr_number = vim.fn.getreg "+" end
            print("PR Number: " .. pr_number)
            require("telescope").extensions.git_worktree.create_git_worktree {
              create_branch = "pr/" .. pr_number,
              pr_number = pr_number,
            }
          end,
          desc = "Git Checkout PR from clipboard/input",
        },
        ["<leader>mg"] = { ":Glow<cr>", desc = "Glow Current" },
        ["<leader>z"] = { ":ZenMode<cr>", desc = "Zen Mode" },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
      v = {
        ["Es"] = { 'y:%s/<C-R>"/<C-r>"/gc<Left><Left><Left>', desc = "Replace Visual" },
        ["<leader>fG"] = {
          ":lua require('telescope-live-grep-args.shortcuts').grep_visual_selection({postfix = ' -Fit'})<CR>",
          desc = "Find Live Grep Args",
        },
      },
    },
  },
}
