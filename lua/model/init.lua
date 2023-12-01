local config = require("config")
local utils = require("utils")
local project = require("model.project")
local log = require("logger")

--#region
---@class Model.model
local model = {
    project = {}
}


function model:initialize()
    local configFile = config.luapath .. config.courses.O1.key .. ".json"
    local courseConfigTable = utils.jsonToTable(configFile)
    self.project = project.new(courseConfigTable)
    log.debug(self.project, false)
end

return model
