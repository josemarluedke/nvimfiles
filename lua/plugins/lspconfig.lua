return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    -- Extend vtsls filetypes to handle .gts and .gjs files
    table.insert(opts.servers.vtsls.filetypes, "typescript.glimmer")
    table.insert(opts.servers.vtsls.filetypes, "javascript.glimmer")

    -- Register @glint/tsserver-plugin as a vtsls globalPlugin
    -- (same pattern as Vue extra, but location resolved dynamically)
    LazyVim.extend(opts.servers.vtsls, "settings.vtsls.tsserver.globalPlugins", {
      {
        name = "@glint/tsserver-plugin",
        location = "", -- placeholder; resolved in before_init
        languages = { "typescript", "javascript", "typescript.glimmer", "javascript.glimmer" },
        configNamespace = "typescript",
        enableForWorkspaceTypeScriptVersions = true,
      },
    })

    -- Dynamically resolve plugin path from the project's node_modules
    local orig_before_init = opts.servers.vtsls.before_init
    opts.servers.vtsls.before_init = function(init_params, config)
      if orig_before_init then
        orig_before_init(init_params, config)
      end

      local root_dir = config.root_dir
      if not root_dir then
        return
      end

      local glint_path = root_dir .. "/node_modules/@glint/tsserver-plugin"
      local global_plugins = vim.tbl_get(config, "settings", "vtsls", "tsserver", "globalPlugins") or {}

      for i, plugin in ipairs(global_plugins) do
        if plugin.name == "@glint/tsserver-plugin" then
          if vim.uv.fs_stat(glint_path) then
            plugin.location = glint_path
          else
            table.remove(global_plugins, i)
          end
          break
        end
      end
    end

    -- Silence "Cannot find provider" errors from @glint/tsserver-plugin
    -- for features it doesn't implement (e.g. documentHighlight)
    opts.servers.vtsls.handlers = vim.tbl_extend("force", opts.servers.vtsls.handlers or {}, {
      ["textDocument/documentHighlight"] = function(err, result, ctx, config)
        if err and err.code == -32603 then
          return
        end
        vim.lsp.handlers["textDocument/documentHighlight"](err, result, ctx, config)
      end,
    })

    -- Keep existing protols config
    opts.servers.protols = {}
    opts.setup = opts.setup or {}
    opts.setup.protols = function(_, _)
      require("lspconfig").protols.setup({})
    end
  end,
}
