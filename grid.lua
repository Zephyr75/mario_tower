local love = require("love")
local ui = require("ui")
local utils = require("utils")

local grid = {}

local ui_grid = {}

local map = {}
local piranha_img = love.graphics.newImage("sprites/piranha.png")
local banana_tree_img = love.graphics.newImage("sprites/banana_tree.png")
local canon_img = love.graphics.newImage("sprites/canon.png")


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
  local offset_x = WindowWidth - 900
  local offset_y = WindowHeight - 600
  local x = math.ceil(((love.mouse.getX() - offset_x) / 900) * Width)
  local y = math.ceil(((love.mouse.getY() - offset_y) / 600) * Height)
  if y > 0 and x > 0 and map[y][x] == 0 and CurrentBuy ~= nil then
    map[y][x] = math.random(3, 6)
    CurrentBuy = nil
  end
end

function grid.draw()
  for i = 1, #ui_grid do
    local elem = ui_grid[i]
    elem:draw()
  end

  local scale = 0.12

  for y=1, Height do
    for x=1, Width do
      local offset_x = WindowWidth - 900
      local offset_y = WindowHeight - 600
      if map[y][x] == 4 then
        love.graphics.draw(piranha_img, offset_x + ((x-1) * 900 / Width), offset_y + ((y-1) * 600 / Height), 0, scale, scale)
      end
      if map[y][x] == 5 then
        love.graphics.draw(banana_tree_img, offset_x + ((x-1) * 900 / Width), offset_y + ((y-1) * 600 / Height), 0, scale, scale)
      end
      if map[y][x] == 6 then
        love.graphics.draw(canon_img, offset_x + ((x-1) * 900 / Width), offset_y + ((y-1) * 600 / Height), 0, scale, scale)
      end
    end
  end

  local offset_x = WindowWidth - 900
  local offset_y = WindowHeight - 600
  local x = math.ceil(((love.mouse.getX() - offset_x) / 900) * Width)
  local y = math.ceil(((love.mouse.getY() - offset_y) / 600) * Height)
  if CurrentBuy ~= nil and y > 0 and x > 0 and map[y][x] == 0 then
    love.graphics.draw(piranha_img, offset_x + ((x-1) * 900 / Width), offset_y + ((y-1) * 600 / Height), 0, scale, scale)
  end

end


function grid.ui()
  return ui_grid
end


return grid
