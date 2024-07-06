local love = require("love")
local ui = require("ui")
local shop = require("shop")

Width = 15
Height = 10

function love.load()
    Success = love.window.setMode(1280, 720)
    Whale = love.graphics.newImage("player.png")
    PreviewImg = love.graphics.newImage("preview.png")

    shop.load()


    Grid = {}
    for i=1, Width do
        Grid[i] = 0
        local temp = {}
        for j=1, Height do
            temp[j] = 0
        end
        Grid[i] = temp
    end
end

function love.mousepressed(x, y, button)
    shop.mousepressed(x, y, button)
end

function love.update()
    WindowWidth = love.graphics.getWidth()
    WindowHeight = love.graphics.getHeight()
    if love.mouse.isDown(2) then
        local x = math.ceil((love.mouse.getX() / WindowWidth) * Width)
        local y = math.ceil((love.mouse.getY() / WindowHeight) * Height)
        Grid[x][y] = 1
    end
end
function love.draw()

    shop.draw()

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
end
