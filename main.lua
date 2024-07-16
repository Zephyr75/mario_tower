local love = require("love")
-- local ui = require("ui")
local shop = require("shop")
local grid = require("grid")
local utils = require("utils")

love.window.setMode(1920, 1080)
WindowWidth = love.graphics.getWidth()
WindowHeight = love.graphics.getHeight()
Width = 15
Height = 9
Side = WindowHeight / Height
Money = 500
CurrentBuy = nil
Black = {0, 0, 0, 1}
White = {1, 1, 1, 1}

local map1 = love.graphics.newImage("sprites/grass.png")

function love.load()
    shop.load()
    grid.load()
    local font = love.graphics.newFont("KOMIKAX_.ttf", 18)
    love.graphics.setFont(font)
end

function love.mousepressed(x, y, button)
    local ui_all = {}
    utils.insert_all(ui_all, shop.ui())

    grid.place()

    for i = 1, #ui_all do
        local elem = ui_all[i]
        if button == 1 and elem.clickable then
            if x >= elem.x and x <= elem.x + elem.width and y >= elem.y and y <= elem.y + elem.height then
                elem:on_click()
            end
        end
    end

end


function love.update()
    -- grid.update()
    -- shop.update()
end


function love.keypressed(key)
    local x = math.ceil((love.mouse.getX() - Side) / Side)
    local y = math.ceil(love.mouse.getY() / Side)
    if key == "r" then
        local value = math.floor(Map[y][x])
        local rotation = Map[y][x] - value
        Map[y][x] = value + ((rotation + 0.1) % 0.4)
    end
end

function love.draw()
    love.graphics.setBackgroundColor(0.608, 0.678, 0.718, 1)
    love.graphics.draw(map1, Side, 0, 0, 4, 4)
    grid.draw()
    shop.draw()

   love.graphics.print("fps: "..tostring(love.timer.getFPS( )), WindowWidth - Side, 10)
   love.graphics.print("money: " ..tostring(Money), WindowWidth - Side, 30)
end
