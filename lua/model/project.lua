local module = require("model.module")

---@class Model.project
local project = {
    id = "",
    name = "",
    aPlusUrl = "",
    languages = {
        -- "en",
    },
    resources = {
        -- "random URL"
    },
    vmOptions = {},
    autoInstall = {
        -- module id
    },
    replArguments = "",
    modules = {},
}

function project:empty()
    if project.modules.autoInstall:isInstalled() then
        return false
    end
    return true
end

function project:initialize()

end

---@param configTable table
function project:new(configTable)
    self = {}

    self.id = configTable.id
    self.name = configTable.name
    self.aPlusUrl = configTable.aPlusUrl
    self.languages = configTable.languages
    self.resources = configTable.resources
    self.vmOptions = configTable.vmOptions
    self.autoInstall = configTable.autoInstall
    self.replArguments = configTable.replArguments

    local function findID(moduleName) --could be optimized by creating an inverted table and just accessing it, so we don't iterate every time
        for id, v in configTable.exerciseModules do
            if v.en == moduleName then
                return id
            end
        end
        return nil
    end

    for m in configTable.modules do
        local id = findID(m.name)
        local name = configTable.exerciseModules[id]
        local hidden = configTable.hiddenElements[id] or false
        local newModule = module:new(
            id,
            m.url,
            m.version,
            name,
            hidden,
            configTable.repl.initialCommands[name]
        )
        self.modules.insert(newModule)
    end

    if project:empty() then project:initialize() end
end

return project
