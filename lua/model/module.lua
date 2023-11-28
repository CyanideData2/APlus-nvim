local config = require("config")
--
---@class Model.module
local module = {
    id = "",
    url = "",
    version = 1.0,
    name = {
        --[language] = "",
    },
    hidden = false,
    repl = {
        --"command"
    },
    changeLog = "",
    installed = false,
}

function module:new(id, url, version, name, hidden, repl)
    self.id = id
    self.url = url
    self.name = name
    self.version = version or 1.0
    self.hidden = hidden or false
    self.repl = repl

    if vim.cmd("! -d " .. config.courses.O1.path) then
        self.installed = true
    end
end

function module.download()
end

return module

