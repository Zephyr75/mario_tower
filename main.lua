local love = require("love")
local ui = require("ui")

Width = 15
Height = 10
Buttons = {}

function love.load()
    Success = love.window.setMode(1500, 1000)
    Whale = love.graphics.newImage("player.png")

    Grid = {}    -- new array
    for i=1, Width do
        Grid[i] = 0
        local temp = {}
        for j=1, Height do
            temp[j] = 0
        end
        Grid[i] = temp
    end
    local but = ui.button:new(50, 50, 150, 50, Whale, "test", Print1)
    local but2 = ui.button:new(50, 100, 150, 50, Whale, "test2", function() Print2() end)
    table.insert(Buttons, but)
    table.insert(Buttons, but2)
end


function Print1()
     print("1")
end

function Print2()
     print("2")
end

function love.mousepressed(x, y, button)
    for i = 1, #Buttons do
        local but = Buttons[i]
        if button == 1 then
            if x >= but.x and x <= but.x + but.width and y >= but.y and y <= but.y + but.height then
                but:on_click()
            end
        end
    end
end

function love.update()
    WindowWidth = love.graphics.getWidth()
    WindowHeight = love.graphics.getHeight()
    if love.mouse.isDown(2) then
        local x = math.ceil((love.mouse.getX() / WindowWidth) * Width)
        local y = math.ceil((love.mouse.getY() / WindowHeight) * Height)
        Grid[x][y] = 1
        -- print(x,y)
    end
    -- if love.mouse.isDown(1) then
    --     local x = love.mouse.getX()
    --     local y = love.mouse.getY()
    --     if x >= but.x and x <= but.width then
    --         but:on_click()
    --     end
    --     if y >= but.y and y <= but.width then
    --         but:on_click()
    --     end
    -- end
end
function love.draw()
    for i = 1, #Buttons do
      local but = Buttons[i]
      but:draw()
    end    -- but:draw()
    love.graphics.print("Hello World", 400, 300)
    -- love.graphics.draw(Whale, 300, 200)
    for x=1, Width do
        for y=1, Height do
            if Grid[x][y] == 1 then
                love.graphics.draw(Whale, (x-1) * WindowWidth / Width, (y-1) * WindowHeight / Height, 0, 0.2, 0.2)

            end
        end
    end

    if love.keyboard.isDown('w') then
        love.graphics.print("w", 300, 300)
    end
    love.graphics.print(love.mouse.getX(), 200, 200)
    love.graphics.print(love.mouse.getY(), 200, 220)
end
