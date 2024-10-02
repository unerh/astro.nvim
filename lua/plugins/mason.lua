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
        -- add more arguments for adding more language servers
      },
      -- enable debug logs for lsp
      lspconfig = {
        yamlls = {
          settings = {
            yaml = {
              schemas = {
                ["https://raw.githubusercontent.com/open-telemetry/opentelemetry-collector/refs/tags/cmd/mdatagen/v0.110.0/cmd/mdatagen/metadata-schema.yaml"] =
                "/**/metadata.yaml",
                -- add more schemas as needed
              },
            },
          },
        },
      },
    },
  },
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
