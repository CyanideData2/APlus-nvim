local config = require("config")
local model = require("model")
local log = require("logger")

---@class AP.APlus
local aplus = {}

local currentPath = vim.fn.expand("%:p")

function aplus.validate()
    assert(vim.fn.has("nvim-0.9.0") == 1, "Neovim >= 0.9.0 required")
end

function aplus.should_skip()
    log.debug("checking " .. currentPath .. " against " .. config.courses.O1.path, false)
    if currentPath:find(config.courses.O1.path) then
        return false
    end
    if vim.fn.argv()[1] == "O1" then
        return false end
    return true
end

function aplus.initialize()
    vim.cmd("! mkdir -p " .. config.courses.O1.path)
    model:initialize();
    log.info("Aplus loaded")
end

function aplus.start()
    if aplus.should_skip() then
        log.debug("Conditions not met, aplus not loaded", true)
        return
    end

    aplus.validate()
    aplus.initialize()
end

function aplus.setup(cfg)
    cfg = cfg or {}
    vim.tbl_deep_extend("force", config, cfg)

    local group_id = vim.api.nvim_create_augroup("aplus_start", { clear = true })
    vim.api.nvim_create_autocmd("VimEnter", {
        group = group_id,
        pattern = "*",
        nested = true,
        callback = aplus.start,
    })
end

return aplus
