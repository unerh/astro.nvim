-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Mason plugins

---@type LazySpec
return {
  -- -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = {
        "lua_ls",
        "yamlls",
        "omnisharp",
        -- add more arguments for adding more language servers
      },
    },
  },
  -- {
  --   "b0o/SchemaStore.nvim",
  --   lazy = true,
  --   dependencies = {
  --     {
  --       "AstroNvim/astrolsp",
  --       optional = true,
  --       ---@type AstroLSPOpts
  --       opts = {
  --         ---@diagnostic disable: missing-fields
  --         config = {
  --           yamlls = {
  --             on_new_config = function(config)
  --               config.settings.yaml.schemas = vim.tbl_deep_extend(
  --                 "force",
  --                 config.settings.yaml.schemas or {},
  --                 require("schemastore").yaml.schemas() {
  --                   ignore = { "Deployer Recipe" },
  --                 }
  --               )
  --             end,
  --             settings = { yaml = { schemaStore = { enable = false, url = "" } } },
  --           },
  --         },
  --       },
  --     },
  --   },
  -- },
  -- {
  --   "b0o/schemastore.nvim",
  --   opts = {
  --
  --   }
  --
  -- },
  -- -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  -- {
  --   "jay-babu/mason-null-ls.nvim",
  --   -- overrides `require("mason-null-ls").setup(...)`
  --   opts = {
  --     ensure_installed = {
  --       "stylua",
  --       -- add more arguments for adding more null-ls sources
  --     },
  --   },
  -- },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      delve = nil,
      ensure_installed = {
        "python",
        -- add more arguments for adding more debuggers
      },
    },
  },
}
