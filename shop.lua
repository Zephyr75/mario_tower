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
  -- local icon = love.graphics.newImage("tower_icon.png")

  local banana_tree_img = love.graphics.newImage("sprites/banana_tree.png")
  local piranha_img = love.graphics.newImage("sprites/piranha.png")
  local canon_img = love.graphics.newImage("sprites/canon.png")
  local horn_img = love.graphics.newImage("sprites/horn.png")

  local pre = love.graphics.newImage("preview.png")
  local p1 = ui.preview:new(Side, 0, 3 * Side, 2 * Side, pre, "This is a banana tree. It makes bananas fall on the road, slowing down the enemies.", 11, false)
  local p2 = ui.preview:new(Side, Side, 3 * Side, 2 * Side, pre, "This is a fire flower. It shoots fire projectiles at enemies to damage them.", 12, false)
  local p3 = ui.preview:new(Side, 2 * Side, 3 * Side, 2 * Side, pre, "This is a shell pipe. Shells come out of it to hunt down the closest enemy.", 13, false)
  local p4 = ui.preview:new(Side, 3 * Side, 3 * Side, 2 * Side, pre, "This is a canon. It shoots bullets in a straight line, damaging all enemies in its path.", 14, false)
  local t1 = ui.button:new(0, 0, Side, Side, banana_tree_img, "", function ()
    hide_previews()
    p1.active = true
  end)
  local t2 = ui.button:new(0, Side, Side, Side, piranha_img, "", function ()
    hide_previews()
    p2.active = true
  end)
  local t3 = ui.button:new(0, 2 * Side, Side, Side, canon_img, "", function ()
    hide_previews()
  	p3.active = true
  end)
  local t4 = ui.button:new(0, 3 * Side, Side, Side, horn_img, "", function ()
    hide_previews()
  	p4.active = true
  end)
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
