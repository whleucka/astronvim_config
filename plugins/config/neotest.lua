--- Check if a file or directory exists in this path
local function exists(file)
  local ok, err, code = os.rename(file, file)
  if not ok then
    if code == 13 then
      -- Permission denied, but it exists
      return true
    end
  end
  return ok, err
end

require("neotest").setup {
  adapters = {
    require "neotest-phpunit" {
      phpunit_cmd = function()
        if exists "./vendor/bin/phpunit" then
          -- composer phpuit
          return "./vendor/bin/phpunit"
        end
        -- phar in bin
        return "./bin/phpunit"
      end,
    },
  },
}
