local M = {}

if JS_TS.formatter == 'prettier' then
  local prettier = {
    formatCommand = string.format(
        'prettier --stdin --stdin-filepath ${INPUT} --tab-width %s', TabSize),
    formatStdin = true
  }
  table.insert(M, prettier)
end

if JS_TS.linter == 'eslint' then
  local eslint = {
    lintCommand = 'eslint_d -f unix --stdin --stdin-filename ${INPUT}',
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {'%f:%l:%c: %m'},
    formatCommand = 'eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}',
    formatStdin = true
  }
  table.insert(M, eslint)
end

return M
