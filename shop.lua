local love = require("love")
local ui = require("ui")

local shop = {}

local ui_shop = {}

local function hide_previews()
  for i = 1, #ui_shop do
    local elem = ui_shop[i]
    if elem.active == true then
      elem.active = false
    end
  end
end

function shop.load()
  local icon = love.graphics.newImage("tower_icon.png")
  local col = love.graphics.newImage("left.png")
  local pre = love.graphics.newImage("preview.png")
  local p1 = ui.preview:new(70, 50, 300, 200, pre, "This is a banana tree. It makes bananas fall on the road, slowing down the enemies.", false)
  local p2 = ui.preview:new(70, 100, 300, 200, pre, "This is a fire flower. It shoots fire projectiles at enemies to damage them.", false)
  local p3 = ui.preview:new(70, 150, 300, 200, pre, "This is a shell pipe. Shells come out of it to hunt down the closest enemy.", false)
  local p4 = ui.preview:new(70, 200, 300, 200, pre, "This is a canon. It shoots bullets in a straight line, damaging all enemies in its path.", false)
  local t1 = ui.button:new(20, 50, 50, 50, icon, "1", function ()
    hide_previews()
    p1.active = true
  end)
  local t2 = ui.button:new(20, 100, 50, 50, icon, "2", function ()
    hide_previews()
    p2.active = true
  end)
  local t3 = ui.button:new(20, 150, 50, 50, icon, "3", function ()
    hide_previews()
  	p3.active = true
  end)
  local t4 = ui.button:new(20, 200, 50, 50, icon, "4", function ()
    hide_previews()
  	p4.active = true
  end)
  local bg = ui.container:new(10, 40, 70, 220, col, "")
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
