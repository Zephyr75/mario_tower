local love = require("love")

local button = require("ui.button")
local preview = {}

local icon = love.graphics.newImage("tower_icon.png")

function preview:new(x, y, width, height, image, text, active)
  print(self)
  local close_button = button:new(x + width - 50, y, 50, 50, icon, "X", function (p)
    -- print(self)
    p.active = false
    print("test")
  end)
  local buy_button = button:new(x + width - 50, y + height - 50, 50, 50, icon, "X", function ()
    Money = Money - 50
  end)
  local new = {x = x, y = y, width = width, height = height, image = image, text = text, active = active, clickable = true, close_button = close_button, buy_button = buy_button}
  self.__index = self
  return setmetatable(new, self)
end

function preview:hide()
  self.active = false
end

function preview:on_click()
  local x = love.mouse.getX()
  local y = love.mouse.getY()
  if self.close_button:in_bounds(x, y) then
    self.active = false
  end
  if self.buy_button:in_bounds(x, y) then
    Money = Money - 50
  end

end

function preview:draw()
  if not self.active then
    return
  end
  local image_width = self.image:getWidth()
  local image_height = self.image:getHeight()
  love.graphics.draw(self.image, self.x, self.y, 0, self.width / image_width, self.height / image_height)
  love.graphics.printf(self.text, self.x + 20, self.y + 20, self.width - 60)
  self.close_button:draw()
  self.buy_button:draw()
end

return preview
