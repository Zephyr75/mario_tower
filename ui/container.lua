local love = require("love")

local container = {}

function container:new(x, y, width, height, image, text)
  local new = {x = x, y = y, width = width, height = height, image = image, text = text, clickable = false}
  self.__index = self
  return setmetatable(new, self)
end

function container:draw()
  local image_width = self.image:getWidth()
  local image_height = self.image:getHeight()
  love.graphics.draw(self.image, self.x, self.y, 0, self.width / image_width, self.height / image_height)
  love.graphics.print(self.text, self.x, self.y)
end

return container
