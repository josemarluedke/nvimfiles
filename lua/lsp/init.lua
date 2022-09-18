local default_config = require('lsp.defaults')

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'single' })
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'single' })

vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting_sync()' ]])

local lsp_installer = require('nvim-lsp-installer')

lsp_installer.settings({
  ui = {
    keymaps = {
      -- Keymap to expand a server in the UI
      toggle_server_expand = 'i',
      -- Keymap to install a server
      install_server = '<CR>',
      -- Keymap to reinstall/update a server
      update_server = 'u',
      -- Keymap to uninstall a server
      uninstall_server = 'x',
    },
  },
})

-- initial default servers
local requested_servers = {
  'efm',
  'tsserver',
  'ember',
  'gopls',
  'graphql',
  'sumneko_lua',
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

-- go through requested_servers and ensure installation
local lsp_installer_servers = require('nvim-lsp-installer.servers')
for _, requested_server in pairs(requested_servers) do
  local ok, server = lsp_installer_servers.get_server(requested_server)
  if ok then
    if not server:is_installed() then
      server:install()
    end
  end
end

lsp_installer.on_server_ready(function(server)
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

  -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
  server:setup(opts)
  vim.cmd([[ do User LspAttachBuffers ]])
end)
