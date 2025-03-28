local function read_file(path)
    local file = io.open(path, "rb") -- r read mode and b binary mode
    if not file then return nil end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
    return content
end

local prompts_dir = vim.fn.stdpath("config") .. "/lua/plugins/prompts/"

local prompts_definitions = {
  {
    name = "report",
    system = prompts_dir .. "/report.system.mk",
    user = prompts_dir .. "/report.user.mk"
  }
}

local lexic = {}
for _, definition in ipairs(prompts_definitions) do
  lexic[definition.name:lower()] = {
    system = read_file(definition.system),
    user = read_file(definition.user),
  }
end

return lexic
