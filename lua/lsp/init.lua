local default_config = require('lsp.defaults')

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = 'rounded',
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = 'rounded',
})

-- local lsp_installer = require('nvim-lsp-installer')

-- lsp_installer.settings({
--   ui = {
--     keymaps = {
--       -- Keymap to expand a server in the UI
--       toggle_server_expand = 'i',
--       -- Keymap to install a server
--       install_server = '<CR>',
--       -- Keymap to reinstall/update a server
--       update_server = 'u',
--       -- Keymap to uninstall a server
--       uninstall_server = 'x',
--     },
--   },
-- })

-- initial default servers
local requested_servers = {
  'glint',
  'efm',
  'tsserver',
  'ember',
  'gopls',
  'graphql',
  'lua_ls',
  'tailwindcss',
  'jsonls',
  'cssls',
  'html',
}

-- get disabled servers from config
local disabled_servers = {}
for config_server, config_opt in pairs(LSP.Servers) do
  if config_opt == false then
    table.insert(disabled_servers, config_server)
  elseif not vim.tbl_contains(requested_servers, config_server) then
    -- add additonally defined servers to be installed
    -- todo: how to handle non-default server opts?
    table.insert(requested_servers, config_server)
  end
end

require('mason').setup()
require('mason-lspconfig').setup({
  automatic_installation = true,
  ensure_installed = requested_servers,
})
local lspconfig = require('lspconfig')

require('mason-lspconfig').setup_handlers({
  -- default handler - setup with default settings
  function(server)
    local opts = default_config

    -- disable server if config disabled server list says so
    opts.autostart = true
    if vim.tbl_contains(disabled_servers, server.name) then
      opts.autostart = false
    end

    if server.name == 'tsserver' then
      opts = vim.tbl_deep_extend('force', opts, require('lsp.tsserver'))
    elseif server.name == 'efm' then
      opts = vim.tbl_deep_extend('force', opts, require('lsp.efm'))
    elseif server.name == 'jsonls' then
      opts = vim.tbl_deep_extend('force', opts, require('lsp.jsonls'))
    elseif server.name == 'gopls' then
      opts = vim.tbl_deep_extend('force', opts, require('lsp.go'))
    elseif server.name == 'sumneko_lua' then
      opts = vim.tbl_deep_extend('force', opts, require('lsp.lua'))
    end

    -- override options if user definds them
    if type(LSP.Servers[server.name]) == 'table' then
      if LSP.Servers[server.name].opts ~= nil then
        opts = LSP.Servers[server.name].opts
      end
    end
    opts.capabilities = default_config.default_capabilities()

    lspconfig[server].setup(opts)
    vim.cmd([[ do User LspAttachBuffers ]])
  end,
})

require('lsp.commands').Init()
