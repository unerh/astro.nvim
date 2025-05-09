return {
  "nvim-neotest/neotest",
  opts = function(_, opts)
    opts.adapters = opts.adapters or {}
    table.insert(
      opts.adapters,
      require "neotest-go" {
        recursive_run = true,
      }
    )
    return opts
  end,
  dependencies = {
    "nvim-neotest/neotest-go",
  },
}
