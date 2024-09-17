return {
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        css = { 'prettierd', 'prettier', stop_after_first = true },
        html = { 'prettierd', 'prettier', stop_after_first = true },
      },
    },
  },

  {
    'whoissethdaniel/mason-tool-installer.nvim',
    opts = {
      ensure_installed = {
        'css-lsp',
        'html-lsp',
        'htmx-lsp',
        'tailwindcss-language-server',
        'prettierd',
        'prettier',
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      handlers = {
        ['tailwindcss'] = function()
          require('tvaintrob.utils.lsp').setup_server('tailwindcss', {
            filetypes = {
              'go',
              'html',
              'templ',
              'javascript',
              'typescript',
              'javascriptreact',
              'typescriptreact',
            },
            init_options = {
              userLanguages = {
                go = 'go',
                html = 'html',
                templ = 'html',
              },
            },
            settings = {
              tailwindCSS = {
                experimental = {
                  -- add support for tailwind css in gomponents
                  classRegex = {
                    { 'Class\\(([^)]*)\\)', '["`]([^"`]*)["`]' },
                    { 'Classes\\(([^)]*)\\)', '["`]([^"`]*)["`]' },
                    { 'Class\\{([^)]*)\\}', '["`]([^"`]*)["`]' },
                    { 'Classes\\{([^)]*)\\}', '["`]([^"`]*)["`]' },
                    { 'Class:\\s*["`]([^"`]*)["`]' },
                    { 'Classes:\\s*["`]([^"`]*)["`]' },
                  },
                },
              },
            },
          })
        end,
      },
    },
  },
}
