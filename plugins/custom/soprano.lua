local telescope = require('telescope')
local actions = require('telescope.actions')
local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local conf = require('telescope.config').values
local action_state = require "telescope.actions.state"

local api_endpoint = "https://hleucka.ddns.net/api/v1"

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<CR>"] = actions.select_default + actions.center,
      },
    },
  },
})


local function search()
  local search_type = vim.fn.input('Enter search type (title/artist/album/genre): ')
  local search_term = vim.fn.input('Enter search term: ')

  -- Create the cURL command to fetch music tracks from the API endpoint
  local curl_command = string.format('curl -X POST -d \'term=%s\' -d \'type=%s\' ' .. api_endpoint .. '"/music/search"', search_term, search_type)

  -- Execute the cURL command and capture the output
  local handle = io.popen(curl_command)
  local result = handle:read('*a')
  handle:close()

  -- Parse the JSON response
  local res = vim.fn.json_decode(result)
  local tracks = res.data

  -- Create the Telescope picker and display the results
  pickers.new({}, {
    prompt_title = 'What do you want to listen to?',
    finder = finders.new_table {
      results = tracks,
      entry_maker = function(track)
        return {
          display = string.format('%s - %s', track.artist, track.title),
          ordinal = string.format('%s %s %s', track.title, track.artist, track.album),
          value = track.md5,
        }
      end,
    },
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      local play_track = function()

        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        -- Play the selected track using MPV or your preferred media player
        local command = 'mpv --video=no ' .. api_endpoint .. '/music/play/' .. selection.value 
        require("toggleterm").exec(command, nil, nil, "", "horizontal")
      end

      -- Map a key to play the selected track
      map('i', '<CR>', play_track)
      map('n', '<CR>', play_track)

      return true
    end,
  }):find()
end

return {
  search = search,
}
