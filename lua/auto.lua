function Define_augroupsn(definitions) -- {{{1
  -- Create autocommand groups based on the passed definitions
  --
  -- The key will be the name of the group, and each definition
  -- within the group should have:
  --    1. Trigger
  --    2. Pattern
  --    3. Text
  -- just like how they would normally be defined from Vim itself
  for group_name, definition in pairs(definitions) do
    vim.cmd('augroup ' .. group_name)
    vim.cmd('autocmd!')

    for _, def in pairs(definition) do
      local command = table.concat(vim.tbl_flatten {'autocmd', def}, ' ')
      vim.cmd(command)
    end

    vim.cmd('augroup END')
  end
end

Define_augroupsn({
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
  }
})

