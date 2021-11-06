vim.fn.sign_define('LspDiagnosticsSignError', {
  texthl = 'LspDiagnosticsSignError',
  text = '',
  numhl = 'LspDiagnosticsSignError'
})
vim.fn.sign_define('LspDiagnosticsSignWarning', {
  texthl = 'LspDiagnosticsSignWarning',
  text = '',
  numhl = 'LspDiagnosticsSignWarning'
})
vim.fn.sign_define('LspDiagnosticsSignHint', {
  texthl = 'LspDiagnosticsSignHint',
  text = '',
  numhl = 'LspDiagnosticsSignHint'
})
vim.fn.sign_define('LspDiagnosticsSignInformation', {
  texthl = 'LspDiagnosticsSignInformation',
  text = '',
  numhl = 'LspDiagnosticsSignInformation'
})

-- symbols for autocomplete
vim.lsp.protocol.CompletionItemKind = {
  '   (Text) ', '   (Method)', '   (Function)', '   (Constructor)',
  ' ﴲ  (Field)', '[] (Variable)', '   (Class)', ' ﰮ  (Interface)',
  '   (Module)', ' 襁 (Property)', '   (Unit)', '   (Value)',
  ' 練 (Enum)', '   (Keyword)', ' ﬌  (Snippet)', '   (Color)',
  '   (File)', '   (Reference)', '   (Folder)', '   (EnumMember)',
  ' ﲀ  (Constant)', ' ﳤ  (Struct)', '   (Event)', '   (Operator)',
  '   (TypeParameter)'
}

local function documentHighlight(client, bufnr)
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

local M = {}

local auto_format_lock = false

function M.on_attach(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  documentHighlight(client, bufnr)

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  if LSP.can_client_format(client.name) then
    client.resolved_capabilities.document_formatting = true
    client.resolved_capabilities.document_range_formatting = true
    -- check user config to see if we can format on save
    if LSP.format_on_save and not auto_format_lock then
      auto_format_lock = true -- just run autocommand once
      local format_filetypes = ''
      if vim.tbl_islist(LSP.format_on_save) then
        for _, ft in pairs(LSP.format_on_save) do
          format_filetypes = format_filetypes .. '*' .. ft
        end
      else
        format_filetypes = '*'
      end

      vim.cmd(([[
          augroup Format
          autocmd!
          autocmd BufWritePre %s lua vim.lsp.buf.formatting_sync(nil, 1000)
          augroup end
        ]]):format(format_filetypes))
    end
  else
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end

  require('lsp_signature').on_attach({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {border = 'single'}
  }, bufnr)
end

M.flags = {debounce_text_changes = 150}

-- M.capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

M.root_dir = function(fname)
  local util = require('lspconfig').util
  return util.root_pattern('.git')(fname) or
             util.root_pattern('tsconfig.base.json')(fname) or
             util.root_pattern('package.json')(fname) or
             util.root_pattern('.eslintrc.js')(fname) or
             util.root_pattern('tsconfig.json')(fname)
end

M.autostart = true

return M
