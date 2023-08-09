return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local fzf = require('fzf-lua')

    fzf.setup({
      'telescope',
      files = {
        prompt = '🔎  ',
        cwd_prompt = false,
        fzf_opts = {
          ['--info'] = 'hidden',
          ['--header'] = [[$'\n\e[0;30;41m Find Files \n\n']],
        },
      },
      grep = {
        fzf_opts = { ['--info'] = 'hidden' },
      },
      helptags = {
        prompt = '🔎  ',
        fzf_opts = {
          ['--info'] = 'hidden',
          ['--header'] = [[$'\n\e[0;30;41m Help Tags \n\n']],
        },
      },
      winopts = {
        width = 0.82,
        preview = {
          layout = 'flex',
          horizontal = 'right:37%',
        },
        on_create = function()
          local function feedkeys(normal_key, insert_key)
            vim.keymap.set('t', normal_key, function()
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(insert_key, true, false, true), 'n', true)
            end, { nowait = true, noremap = true, buffer = vim.api.nvim_get_current_buf() })
          end

          feedkeys('<c-j>', '<c-n>')
          feedkeys('<c-k>', '<c-p>')
        end,
      },
    })

    vim.keymap.set('n', '<c-p>', fzf.files)
    vim.keymap.set('n', '<leader>pf', fzf.live_grep)

    vim.api.nvim_create_user_command('Help', fzf.help_tags, {})
  end,
}
