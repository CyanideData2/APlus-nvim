local log = require("logger")
local json = require("json")


local utils = {}

---@param filepath string
---@function utils.fileToString string
function utils.fileToString(filepath)
    local file = io.open(filepath, "rb")
    if not file then
        log.error("Can't find file " .. filepath)
        return "{}"
    end
    local fileContent = file:read("*a")
    file:close()
    return fileContent
end

---@param filepath string
---@function utils.jsonToTable string
function utils.jsonToTable(filepath)
    return json.decode(utils.fileToString(filepath))
end

return utils
