-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

-- Force git root detection to take priority over LSP in monorepos
vim.g.root_spec = { { ".git" }, "lsp", "cwd" }

-- vim.cmd([[autocmd BufWritePre *.go lua vim.lsp.buf.format({ async = true })]])
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*.go",
--   callback = function()
--     vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
--   end,
-- })
--
-- local extra_lang_args = {
--   go = { lsp_fallback = "always", name = "gopls" },
-- }
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function(args)
--     local extra_args = extra_lang_args[vim.bo[args.buf].filetype] or {}
--     require("conform").format(vim.tbl_deep_extend("keep", { bufnr = args.buf, lsp_fallback = true }, extra_args))
--   end,
-- })
