local tower = {}

function tower:new()
  local new = {level = 0}
  self.__index = self
  return setmetatable(new, self)
end

function tower:upgrade()
  self.level = self.level + 1
end

return tower
