augroup filetypedetect
  autocmd BufNewFile,BufRead *.yaml, if search('{{.\+}}', 'nw') | setlocal filetype=gotmpl | endif
  autocmd BufNewFile,BufRead *.tpl, if search('{{.\+}}', 'nw') | setlocal filetype=gotmpl | endif
augroup END
