Tower = {}

function Tower:new()
  local new = {level = 0}
  self.__index = self
  return setmetatable(new, self)
end

function Tower:upgrade()
  self.level = self.level + 1
end
