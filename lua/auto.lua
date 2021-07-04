require('utils').define_augroups({
  -- HBS
  hbs_autoformat = {
    {'BufNewFile,BufRead', '*.hbs', 'set nofixeol noeol'},
    {'BufNewFile,BufRead', '*.hbs', 'setfiletype handlebars'}
  },

  misc_autoformat = {
    {'BufNewFile,BufRead', '*.go.tpl', 'set filetype=gotexttmpl'},
    {'BufNewFile,BufRead', '*.gql,*.graphql', 'set filetype=graphql'},
    {'BufNewFile,BufRead', '*.gts', 'setfiletype typescript.tsx'},
    {'BufNewFile,BufRead', '*.gjs', 'setfiletype javascript'}
  },

  yank = {
    {
      'TextYankPost', '*',
      'lua require("vim.highlight").on_yank({higroup = "Search", timeout = 300})'
    }
  }
})

