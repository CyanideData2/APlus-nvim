local module = require("model.module")
local log = require("logger")

---@class Model.project
---@field name string
---@field aPlusUrl string
---@field languages table
---@field resources table
---@field vmOptions table
---@field autoInstall table
---@field replArguments string
---@field modules table
local project = {
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

---@param configTable table
function project.new(configTable)
    --log.debug(configTable.exerciseModules, true)

    --local newObject = setmetatable({}, self)
    local self = project
    --self.__index = self
    self.name = configTable.name
    self.aPlusUrl = configTable.aPlusUrl
    self.languages = configTable.languages
    self.resources = configTable.resources
    self.vmOptions = configTable.vmOptions
    self.autoInstall = configTable.autoInstall
    self.replArguments = configTable.replArguments

    local function findID(moduleName) --could be optimized by creating an inverted table and just accessing it, so we don't iterate every time
        for id, v in pairs(configTable.exerciseModules) do
            if v.en == moduleName then
                return id
            end
        end
        return ""
    end

    for _,m in pairs(configTable.modules) do
        local id = findID(m.name)
        local hidden = configTable.hiddenElements[id] or false
        local newModule = module.new(
            m.name,
            m.url,
            m.version,
            configTable.exerciseModules[id] or {["en"] = m.name},
            hidden,
            configTable.repl.initialCommands[m.name]
        )
        self.modules[newModule.name] = newModule
    end
    return self
end

function project:empty()
    if self.modules.autoInstall:isInstalled() then
        return false
    end
    return true
end

function project:initialize()

end
return project
