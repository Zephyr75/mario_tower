local love = require("love")

local button = {}

function button:new(x, y, width, height, image, text)
  local new = {x = x, y = y, width = width, height = height, image = image, text = text}
  self.__index = self
  return setmetatable(new, self)
end

function button:on_click()
  -- TODO
end

function button:draw()
  local image_width = self.image:getWidth()
  local image_height = self.image:getHeight()
  love.graphics.draw(self.image, self.x, self.y, 0, self.width / image_width, self.height / image_height)
end

return button
