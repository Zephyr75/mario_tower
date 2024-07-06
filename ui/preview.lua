local love = require("love")

local preview = {}

function preview:new(x, y, width, height, image, text, active)
  local new = {x = x, y = y, width = width, height = height, image = image, text = text, active = active, clickable = true}
  self.__index = self
  return setmetatable(new, self)
end

function preview:on_click()
  local x = love.mouse.getX()
  local y = love.mouse.getY()
  if x >= self.x + self.width - 50 and y <= self.y + 50 then
    self.active = false
  end
end

function preview:draw()
  if not self.active then
    return
  end
  local image_width = self.image:getWidth()
  local image_height = self.image:getHeight()
  love.graphics.draw(self.image, self.x, self.y, 0, self.width / image_width, self.height / image_height)
  love.graphics.print(self.text, self.x, self.y)
end

return preview
