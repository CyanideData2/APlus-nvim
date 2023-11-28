local json = require("json")

---@class Conf.config
local config = {
    path = "config.",
    courses = {
        O1 = {
            key = "O1",
            path = vim.env.HOME .. "/IdeaProjects/O1",
        }
    },
    debug = true,
    logging = true
}

function config.getConfigTable(key)
    local pathToconfig = config.path .. key
    return json.decode(io.open(pathToconfig, "r"))
end

return config
