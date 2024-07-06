local love = require("love")
local ui = require("ui")

local grid = {}

local ui_grid = {}

local map = {}
local tower_img = love.graphics.newImage("tower.png")

function grid.load()

  for i=1, Width do
      map[i] = 0
      local temp = {}
      for j=1, Height do
          temp[j] = 0
      end
      map[i] = temp
  end

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

  for x=1, Width do
      for y=1, Height do
          if map[x][y] == 1 then
              love.graphics.draw(tower_img, (x-1) * WindowWidth / Width, (y-1) * WindowHeight / Height, 0, 0.5, 0.5)

          end
      end
  end


end


function grid.mousepressed(x, y, button)
    for i = 1, #ui_grid do
        local elem = ui_grid[i]
        if button == 1 and elem.clickable then
            if x >= elem.x and x <= elem.x + elem.width and y >= elem.y and y <= elem.y + elem.height then
                elem:on_click()
            end
        end
    end
end


return grid
