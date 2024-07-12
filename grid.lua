local love = require("love")
-- local ui = require("ui")
local utils = require("utils")

local grid = {}

local ui_grid = {}

local map = {}
local piranha_img = love.graphics.newImage("sprites/piranha.png")
local banana_tree_img = love.graphics.newImage("sprites/banana_tree.png")
local canon_img = love.graphics.newImage("sprites/canon.png")
local horn_img = love.graphics.newImage("sprites/horn.png")
local bush_img = love.graphics.newImage("sprites/bush.png")
local tree_img = love.graphics.newImage("sprites/tree.png")
local rock_img = love.graphics.newImage("sprites/rock.png")
local flower_img = love.graphics.newImage("sprites/flower.png")

function grid.load()
  local file = 'map1.txt'
  local lines = utils.lines_from(file)

  for i,line in pairs(lines) do
    local temp = {}
    for j = 1, #line do
        local c = line:sub(j, j)
        temp[j] = tonumber(c)
    end
    map[i] = temp
  end

end

function grid.place()
  local x = math.ceil((love.mouse.getX() - Side) / Side)
  local y = math.ceil(love.mouse.getY() / Side)
  if y > 0 and x > 0 and map[y][x] == 0 and CurrentBuy ~= nil then
    map[y][x] = CurrentBuy
    CurrentBuy = nil
  end
end

function grid.draw()
  for i = 1, #ui_grid do
    local elem = ui_grid[i]
    elem:draw()
  end

  local scale = 0.23

  for y=1, Height do
    for x=1, Width do
      if map[y][x] == 1 then
        love.graphics.draw(rock_img, Side + (x-1) * Side, (y-1) * Side, 0, scale, scale)
      end
      if map[y][x] == 2 then
        if y < Height and x < Width and map[y+1][x] == 2 and map[y][x+1] == 2 then
          love.graphics.draw(tree_img, Side + (x-1) * Side, (y-1) * Side, 0, scale, scale)
        end
      end
      if map[y][x] == 3 then
        if x < Width and map[y][x+1] == 3 then
          love.graphics.draw(bush_img, Side + (x-1) * Side, (y-1) * Side, 0, scale, scale)
        end
      end
      if map[y][x] == 4 then
        love.graphics.draw(flower_img, Side + (x-1) * Side, (y-1) * Side, 0, scale, scale)
      end
      if map[y][x] == 11 then
        love.graphics.draw(banana_tree_img, Side + (x-1) * Side, (y-1) * Side, 0, scale, scale)
      end
      if map[y][x] == 12 then
        love.graphics.draw(piranha_img, Side + (x-1) * Side, (y-1) * Side, 0, scale, scale)
      end
      if map[y][x] == 13 then
        love.graphics.draw(canon_img, Side + (x-1) * Side, (y-1) * Side, 0, scale, scale)
      end
      if map[y][x] == 14 then
        love.graphics.draw(horn_img, Side + (x-1) * Side, (y-1) * Side, 0, scale, scale)
      end
    end
  end

  local x = math.ceil((love.mouse.getX() - Side) / Side)
  local y = math.ceil(love.mouse.getY() / Side)
  if y > 0 and x > 0 and map[y][x] == 0 then
    if CurrentBuy == 11 then
      love.graphics.draw(banana_tree_img, Side + (x-1) * Side, (y-1) * Side, 0, scale, scale)
    elseif CurrentBuy == 12 then
      love.graphics.draw(piranha_img, Side + (x-1) * Side, (y-1) * Side, 0, scale, scale)
    elseif CurrentBuy == 13 then
      love.graphics.draw(canon_img, Side + (x-1) * Side, (y-1) * Side, 0, scale, scale)
    elseif CurrentBuy == 14 then
      love.graphics.draw(horn_img, Side + (x-1) * Side, (y-1) * Side, 0, scale, scale)
    end
  end

end


function grid.ui()
  return ui_grid
end


return grid
