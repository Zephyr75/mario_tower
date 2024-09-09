local kart = {}

function kart:new()
  local new = {level = 0}
  self.__index = self
  return setmetatable(new, self)
end

function kart:upgrade()
  self.level = self.level + 1
end

return kart
