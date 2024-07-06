local love = require("love")

local utils = {}

function utils.insert_all(first, second)
  for i = 1, #second do
    table.insert(first, second[i])
  end
end

return utils
