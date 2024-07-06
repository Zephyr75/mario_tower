local love = require("love")

local button = {}

function button:new(x, y, width, height, image, text, on_click)
  local new = {x = x, y = y, width = width, height = height, image = image, text = text, on_click = on_click, clickable = true}
  self.__index = self
  return setmetatable(new, self)
end

function button:on_click()
  self.on_click(self)
end

function button:draw()
  local image_width = self.image:getWidth()
  local image_height = self.image:getHeight()
  love.graphics.draw(self.image, self.x, self.y, 0, self.width / image_width, self.height / image_height)
  love.graphics.print(self.text, self.x, self.y)
end

return button
