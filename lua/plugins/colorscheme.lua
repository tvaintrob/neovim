return {
  {
    'Mofiqul/vscode.nvim',
    priority = 1000,
    config = function()
      require('vscode').setup({
        italic_comments = true,
        underline_links = true,
      })
      require('vscode').load()

      vim.api.nvim_set_hl(0, 'CopilotAnnotation', { link = 'CursorLineFold' })
      vim.api.nvim_set_hl(0, 'CopilotSuggestion', { link = 'CursorLineFold' })
    end,
  },

  -- {
  --   'catppuccin/nvim',
  --   name = 'catppuccin',
  --   priority = 1000,
  --   config = function()
  --     require('catppuccin').setup({
  --       falvour = 'mocha',
  --       styles = {
  --         keywords = { 'bold' },
  --         types = { 'italic', 'bold' },
  --       },
  --       integrations = {
  --         mason = true,
  --         neotree = true,
  --         illuminate = true,
  --         treesitter_context = true,
  --         telescope = {
  --           enabled = true,
  --           style = 'nvchad',
  --         },
  --         navic = {
  --           enabled = true,
  --           custom_bg = 'NONE', -- "lualine" will set background to mantle
  --         },
  --       },
  --     })

  --     vim.cmd.colorscheme('catppuccin')
  --   end,
  -- },
}
