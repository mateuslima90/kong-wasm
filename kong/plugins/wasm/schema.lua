local typedefs = require "kong.db.schema.typedefs"

local PLUGIN_NAME = "wasm"

local schema = {
  name = PLUGIN_NAME,
  fields = {
    -- the 'fields' array is the top-level entry with fields defined by Kong
    { consumer = typedefs.no_consumer },  -- this plugin cannot be configured on a consumer (typical for auth plugins)
    { protocols = typedefs.protocols_http },
    { config = {
        -- The 'config' record is the custom part of the plugin schema
        type = "record",
        fields = {
          -- a standard defined field (typedef), with some customizations
          -- { input_key = { type = "string", required = true }, },
          -- { input_values = { type = "array", elements = { type = "string"}, required = true }, },
          -- { input_http_server_response = { type = "number", required = true }, },
        },
       -- entity_checks = {
       --   { only_one_of = { "body_code_location", "header_code_location" } },
       -- }
      },
    },
  },
}

return schema
