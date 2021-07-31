local M = {}

if Lua.formatter == 'lua-format' then
  local lua_format = {
    formatCommand = 'lua-format -i --no-keep-simple-function-one-line --double-quote-to-single-quote --column-limit=' ..
        Lua.formatLineLength .. ' --no-use-tab --indent-width ' .. TabSize,
    formatStdin = true
  }
  table.insert(M, lua_format)
end

return M
