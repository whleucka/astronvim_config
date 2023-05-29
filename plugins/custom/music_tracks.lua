local telescope = require('telescope')
local actions = require('telescope.actions')
local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local conf = require('telescope.config').values

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


local function search_music_tracks()
  local search_term = vim.fn.input('Enter search term: ')
  local search_type = vim.fn.input('Enter search type (title/artist/album/genre): ')

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
    prompt_title = 'Music Tracks',
    finder = finders.new_table {
      results = tracks,
      entry_maker = function(track)
        return {
          display = string.format('%s - %s', track.title, track.artist),
          ordinal = string.format('%s %s %s', track.title, track.artist, track.album),
          value = track.md5,
        }
      end,
    },
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      local play_track = function()
        local selection = actions.get_selected_entry()
        actions.close(prompt_bufnr)
        -- Play the selected track using MPV or your preferred media player
        vim.fn.jobstart('mpv ' .. api_endpoint .. '/music/play/' .. selection.value)
      end

      -- Map a key to play the selected track
      map('i', '<CR>', play_track)
      map('n', '<CR>', play_track)

      return true
    end,
  }):find()
end

return {
  search_music_tracks = search_music_tracks,
}
