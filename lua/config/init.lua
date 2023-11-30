---@class Conf.config
local config = {
    luapath = "/home/daniel/V/Programming/neovim-plugins/APlus-nvim/lua/config/", -- [[TODO]] add path of directory instead of global path
    courses = {
        O1 = {
            key = "O1",
            path = vim.env.HOME .. "/IdeaProjects/O1",
        }
    },
    debug = true,
    logging = true
}


return config
