local love = require("love")

local button = require("ui.button")
local preview = {}

local icon = love.graphics.newImage("tower_icon.png")

function preview:new(x, y, width, height, image, text, index, active)
  local close_button = button:new(x + width - (Side / 2), y, Side / 2, Side / 2, icon, "X", nil)
  local buy_button = button:new(x + Side, y + Side * 3 / 2, Side, Side / 2, icon, "Buy", nil)
  local new = {x = x, y = y, width = width, height = height, image = image, text = text, active = active, index = index, clickable = true, close_button = close_button, buy_button = buy_button}
  self.__index = self
  return setmetatable(new, self)
end

function preview:on_click()
  local x = love.mouse.getX()
  local y = love.mouse.getY()
  if self.close_button:in_bounds(x, y) then
    self.active = false
  end
  if self.buy_button:in_bounds(x, y) then
    Money = Money - 50
    CurrentBuy = self.index
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
  love.graphics.printf({Black, self.text}, self.x + 15, self.y + 15, self.width - 90)
  self.close_button:draw()
  self.buy_button:draw()
end

return preview
