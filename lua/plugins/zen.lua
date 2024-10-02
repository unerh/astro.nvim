return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  opts = {
    window = {
      backdrop = 1,
      width = function()
        local columns = vim.o.columns
        return math.min(120, columns * 0.85)
      end,
    },
  },
}
