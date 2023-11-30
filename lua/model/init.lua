local config = require("config")
local utils = require("utils")
local project = require("model.project")

--#region
---@class Model.model
local model = {
    project = {}
}


function model:initialize()
    local configFile = config.luapath .. config.courses.O1.key .. ".json"
    local courseConfigTable = utils.jsonToTable(configFile)
    self.project = project.new(courseConfigTable)
end

return model
