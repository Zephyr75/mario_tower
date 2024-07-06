local love = require("love")
local ui = require("ui")
local utils = require("utils")

local grid = {}

local ui_grid = {}

local map = {}
local tower_img = love.graphics.newImage("tower.png")




function grid.load()
  local file = 'map1.txt'
  local lines = utils.lines_from(file)

  for i,line in pairs(lines) do
    -- print('line[' .. k .. ']', v)
    local temp = {}
    for j = 1, #line do
        local c = line:sub(j, j)
        temp[j] = c
    end
    map[i] = temp
  end


  -- for j=1, Height do
  --     for i=1, Width do
  --         print(map[j][i])
  --     end
  -- end

  local road_img = love.graphics.newImage("road.png")
  local r1 = ui.container:new(300, 100, 50, 50, road_img, "")
  table.insert(ui_grid, r1)
end

function grid.update()
  if love.mouse.isDown(2) then
      local x = math.ceil((love.mouse.getX() / WindowWidth) * Width)
      local y = math.ceil((love.mouse.getY() / WindowHeight) * Height)
      map[x][y] = 1
  end
end

function grid.draw()
  for i = 1, #ui_grid do
    local elem = ui_grid[i]
    elem:draw()
  end

  for y=1, Height do
    for x=1, Width do
      if map[y][x] == '0' then
        local offset_x = WindowWidth - 900
        local offset_y = WindowHeight - 600
        love.graphics.draw(tower_img, offset_x + ((x-1) * 900 / Width), offset_y + ((y-1) * 600 / Height), 0, 0.5, 0.5)
      end
    end
  end
end


function grid.ui()
  return ui_grid
end


return grid
