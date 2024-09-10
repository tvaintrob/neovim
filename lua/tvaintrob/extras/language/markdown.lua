return {
  {
    'whoissethdaniel/mason-tool-installer.nvim',
    opts = {
      ensure_installed = {
        'marksman',
        'prettierd',
        'prettier',
      },
    },
  },

  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        ['markdown'] = { 'prettierd', 'prettier', stop_after_first = true },
        ['markdown.mdx'] = { 'prettierd', 'prettier', stop_after_first = true },
      },
    },
  },

  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = function()
      require('lazy').load({ plugins = { 'markdown-preview.nvim' } })
      vim.fn['mkdp#util#install']()
    end,
    config = function()
      vim.cmd([[do FileType]])
    end,
  },

  {
    'OXY2DEV/markview.nvim',
    ft = { 'markdown' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      modes = { 'n', 'no', 'c' },
      hybrid_modes = { 'i' },
      callbacks = {
        on_enable = function(_, win)
          vim.wo[win][0].conceallevel = 2
          vim.wo[win][0].concealcursor = 'c'
        end,
      },
    },
  },
}
