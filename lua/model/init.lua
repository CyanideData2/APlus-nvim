local config = require("config")
local project = require("model.project")

--#region
---@class Model.model
local model = {
    project = {}
}


function model:initialize()
    local courseConfigTable = config.getConfigTable(config.path .. config.courses.O1.key)
    self.project = project.new(courseConfigTable)
end

return model
