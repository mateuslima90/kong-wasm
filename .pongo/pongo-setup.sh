
luarocks install lunajson

export KONG_DATABASE=off
export KONG_DECLARATIVE_CONFIG=/kong-plugin/kong.yml

echo '_format_version: "2.1"
_transform: true
services:
- name: httpbin-service
  url: https://httpbin.org
  retries: 0
  connect_timeout: 5000
  write_timeout: 5000
  read_timeout: 5000
  routes:
  - name: my-route-anything
    regex_priority: 200
    strip_path: false
    methods: [GET]
    protocols: [http]
    paths:
    - /uuid
    plugins:
    - name: kong-plugin-input-validation
      config:
        input_key: username
        input_values:
        - mateus
        - deise
        - amora
        input_http_server_response: 403' > kong.yml


