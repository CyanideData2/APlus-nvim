local config = require("config")
--
---@class Model.module
local module = {
    url = "",
    version = 1.0,
    name = ""
    ,
    hidden = false,
    repl = {
        --"command"
    },
    changeLog = "",
    installed = false,
}

function module.new(name, url, version, aliases, hidden, repl)
    --local newObject = setmetatable({}, self)
    local self = {}
    self.name = name
    self.url = url
    self.aliases = aliases
    self.version = version or 1.0
    self.hidden = hidden or false
    self.repl = repl

    if vim.cmd("silent !test -d " .. config.courses.O1.path .. self.name) == 0 then
        self.installed = true
    end

    return self
end

function module.download()
end

return module
