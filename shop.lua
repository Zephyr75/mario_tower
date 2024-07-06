local love = require("love")
local ui = require("ui")

local shop = {}

local ui_shop = {}

Money = 500

function shop.load()
  local icon = love.graphics.newImage("tower_icon.png")
  local col = love.graphics.newImage("left.png")
  local pre = love.graphics.newImage("preview.png")
  local p1 = ui.preview:new(100, 50, 300, 200, pre, "This is a banana treeThis is a banana treeThis is a banana treeThis is a banana tree", false)
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
  table.insert(ui_shop, bg)
  table.insert(ui_shop, t1)
  table.insert(ui_shop, t2)
  table.insert(ui_shop, t3)
  table.insert(ui_shop, t4)
  table.insert(ui_shop, p1)
  table.insert(ui_shop, p2)
  table.insert(ui_shop, p3)
  table.insert(ui_shop, p4)
end

function shop.draw()
  for i = 1, #ui_shop do
    local elem = ui_shop[i]
    elem:draw()
  end
end

function shop.ui()
  return ui_shop
end


return shop
