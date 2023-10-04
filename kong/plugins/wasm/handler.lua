-- If you're not sure your plugin is executing, uncomment the line below and restart Kong
-- then it will throw an error which indicates the plugin is being loaded at least.

--assert(ngx.get_phase() == "timer", "The world is coming to an end!")

---------------------------------------------------------------------------------------------
-- In the code below, just remove the opening brackets; `[[` to enable a specific handler
--
-- The handlers are based on the OpenResty handlers, see the OpenResty docs for details
-- on when exactly they are invoked and what limitations each handler has.
---------------------------------------------------------------------------------------------

local plugin = {
  PRIORITY = 1000, -- set the plugin priority, which determines plugin execution order
  VERSION = "0.1.0", -- version in X.Y.Z format. Check hybrid-mode compatibility requirements.
}

-- local http = require("resty.http")
-- local json = require("lunajson")

function plugin:init_worker()

  -- your custom code here
  kong.log.debug("saying hi from the 'init_worker' handler")

end --]]

--- Exit with an unauthorized http response
local function response_error_exit(http_status, msg)
  kong.response.set_header("Content-Type", "application/json; charset=utf-8")
  return kong.response.exit(http_status, '{"message": "' .. msg .. '"}')
end

-- runs in the 'access_by_lua_block'
function plugin:access(plugin_conf)
  -- your custom code here
  kong.log("phase access custom")
end

function plugin:header_filter(plugin_conf)

end

-- return our plugin object
return plugin
