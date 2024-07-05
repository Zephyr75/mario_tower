local love = require("love")
local ui = require("ui")

Width = 15
Height = 10

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
    button = ui.button:new(50, 50, 150, 50, Whale, "test")
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
end
function love.draw()
    button:draw()
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
