local love = require("love")

local utils = {}

function utils.insert_all(first, second)
  for i = 1, #second do
    table.insert(first, second[i])
  end
end

local function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

function utils.lines_from(file)
  if not file_exists(file) then return {} end
  local lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

return utils
