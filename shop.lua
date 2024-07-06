local love = require("love")
local ui = require("ui")

local shop = {}

UI_shop = {}

function shop.load()
  local icon = love.graphics.newImage("tower.png")
  local col = love.graphics.newImage("left.png")
  local pre = love.graphics.newImage("preview.png")
  local p1 = ui.preview:new(100, 50, 300, 200, pre, "This is a banana tree", false)
  local p2 = ui.preview:new(100, 100, 300, 200, pre, "This is a banana tree", false)
  local p3 = ui.preview:new(100, 150, 300, 200, pre, "This is a banana tree", false)
  local p4 = ui.preview:new(100, 200, 300, 200, pre, "This is a banana tree", false)
  local t1 = ui.button:new(50, 50, 50, 50, icon, "1", function ()
    p1.active = true
  end)
  local t2 = ui.button:new(50, 100, 50, 50, icon, "2", function ()
    p2.active = true
  end)
  local t3 = ui.button:new(50, 150, 50, 50, icon, "3", function ()
  	p3.active = true
  end)
  local t4 = ui.button:new(50, 200, 50, 50, icon, "4", function ()
  	p4.active = true
  end)
  local bg = ui.container:new(40, 40, 70, 220, col, "")
  table.insert(UI_shop, bg)
  table.insert(UI_shop, t1)
  table.insert(UI_shop, t2)
  table.insert(UI_shop, t3)
  table.insert(UI_shop, t4)
  table.insert(UI_shop, p1)
  table.insert(UI_shop, p2)
  table.insert(UI_shop, p3)
  table.insert(UI_shop, p4)
end

function shop.draw()
  for i = 1, #UI_shop do
    local elem = UI_shop[i]
    elem:draw()
  end
end

return shop
