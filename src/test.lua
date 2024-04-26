

print()
print()
print()
print("***********************************")

-- local socket = require("socket")
local http = require("socket.http")
local ltn12 = require "ltn12"
local https = require ('ssl.https')
local json = require('dkjson')


print("***********************************")
print("**********************************")
local res_payload = {}
local url1 = 'https://192.168.1.2:8020/presences'
local body, statusCode, headers, statusText = https.request({
    url = url1,
    sink = ltn12.sink.table(res_payload),
    method='GET',
    headers = {
        ["content-type"] = "application/json",
        ["connection"] = 'Keep-Alive'
    },
})

    

  print()
  print("statusCode: " .. statusCode);
  print()
  print(res_payload[1])
  print("*******************(): got code of " .. statusText);
  print()

if (statusCode == 200) then
    print("SUCCESSFUL")
end

  local o, pos, err = json.decode(res_payload[1])

local size = 0
for k,v in pairs(o) do
    print(v:upper() .. "    " .. v)
    size = size + 1
end


