local log = require("logger")
local json = require("json")


local utils = {}

---@param filepath string
---@function utils.fileToString string
function utils.fileToString(filepath)
    log.debug("opening path: " .. filepath, true)
    local file = io.open(filepath, "rb")
    if not file then
        log.error("Can't find file " .. filepath)
        return "{}"
    end
    local fileContent = file:read("*a")
    log.debug(fileContent, false)
    file:close()
    return fileContent
end

---@param filepath string
---@function utils.jsonToTable table
function utils.jsonToTable(filepath)
    return json.decode(utils.fileToString(filepath))
end

return utils
