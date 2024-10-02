local prompts = {
  -- Code-related prompts
  Explain = "Please explain how the following code works.",
  Review = "Please review the following code and provide suggestions for improvement.",
  Tests = "Please explain how the selected code works, then generate unit tests for it.",
  Refactor = "Please refactor the following code to improve its clarity and readability.",
  FixCode = "Please fix the following code to make it work as intended.",
  BetterNamings = "Please provide better names for the following variables and functions.",
  Documentation = "Please provide documentation for the following code.",
  SwaggerApiDocs = "Please provide documentation for the following API using Swagger.",
  SwaggerJsDocs = "Please write JSDoc for the following API using Swagger.",
  -- Text-related prompts
  Summarize = "Please summarize the following text.",
  Spelling = "Please correct any grammar and spelling errors in the following text.",
  Wording = "Please improve the grammar and wording of the following text.",
  Concise = "Please rewrite the following text to make it more concise.",
}

---@type LazySpec
return {
  "CopilotC-Nvim/CopilotChat.nvim",
  opts = {
    show_help = "yes",
    prompts = prompts,
    debug = true,              -- Set to true to see the response from GitHub Copilot API. The log file will be in ~/.local/state/nvim/CopilotChat.nvim.log.
    disable_extra_info = "no", -- Disable extra information (e.g.: system prompt, token count) in the response.
  },
  build = function()
    vim.notify "Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim."
  end,
  event = "VeryLazy",
  keys = {
    -- Code-related commands
    { "<leader>ace", "<cmd>CopilotChatExplain<cr>",        desc = "CopilotChat - Explain code" },
    { "<leader>act", "<cmd>CopilotChatTests<cr>",          desc = "CopilotChat - Generate tests" },
    { "<leader>acr", "<cmd>CopilotChatReview<cr>",         desc = "CopilotChat - Review code" },
    { "<leader>acR", "<cmd>CopilotChatRefactor<cr>",       desc = "CopilotChat - Refactor code" },
    { "<leader>acf", "<cmd>CopilotChatFixCode<cr>",        desc = "CopilotChat - Fix code" },
    { "<leader>acb", "<cmd>CopilotChatBetterNamings<cr>",  desc = "CopilotChat - Better Name" },
    { "<leader>acd", "<cmd>CopilotChatDocumentation<cr>",  desc = "CopilotChat - Add documentation for code" },
    { "<leader>aca", "<cmd>CopilotChatSwaggerApiDocs<cr>", desc = "CopilotChat - Add Swagger API documentation" },
    {
      "<leader>acA",
      "<cmd>CopilotChatSwaggerJsDocs<cr>",
      desc = "CopilotChat - Add Swagger API with Js Documentation",
    },
    -- Text related commands
    { "<leader>acs", "<cmd>CopilotChatSummarize<cr>", desc = "CopilotChat - Summarize text" },
    { "<leader>acS", "<cmd>CopilotChatSpelling<cr>",  desc = "CopilotChat - Correct spelling" },
    { "<leader>acw", "<cmd>CopilotChatWording<cr>",   desc = "CopilotChat - Improve wording" },
    { "<leader>acc", "<cmd>CopilotChatConcise<cr>",   desc = "CopilotChat - Make text concise" },
    -- Chat with Copilot in visual mode
    {
      "<leader>acv",
      ":CopilotChatVisual",
      mode = "x",
      desc = "CopilotChat - Open in vertical split",
    },
    {
      "<leader>acx",
      ":CopilotChatInPlace<cr>",
      mode = "x",
      desc = "CopilotChat - Run in-place code",
    },
    -- Custom input for CopilotChat
    {
      "<leader>aci",
      function()
        local input = vim.fn.input "Ask Copilot: "
        if input ~= "" then vim.cmd("CopilotChat " .. input) end
      end,
      desc = "CopilotChat - Ask input",
    },
    -- Quick chat with Copilot
    {
      "<leader>acq",
      function()
        local input = vim.fn.input "Quick Chat: "
        if input ~= "" then
          -- Copy all the lines to the unnamed register
          vim.cmd 'normal! ggVG"*y'
          vim.cmd("CopilotChat " .. input)
        end
      end,
      desc = "CopilotChat - Quick chat",
    },
    -- Debug
    { "<leader>acD", "<cmd>CopilotChatDebugInfo<cr>",     desc = "CopilotChat - Debug Info" },
    -- Fix the issue with the diagnostic
    { "<leader>acF", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "CopilotChat - Fix Diagnostic" },
  },
}
