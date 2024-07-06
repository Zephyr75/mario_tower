local love = require("love")
-- local ui = require("ui")
local shop = require("shop")
local grid = require("grid")
local utils = require("utils")

love.window.setMode(1000, 700)
WindowWidth = love.graphics.getWidth()
WindowHeight = love.graphics.getHeight()
Width = 15
Height = 10
Money = 500


local map1 = love.graphics.newImage("map1.png")

function love.load()

    shop.load()
    grid.load()
end

function love.mousepressed(x, y, button)
    local ui_all = {}
    utils.insert_all(ui_all, shop.ui())

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
    grid.update()
    -- shop.update()
end

function love.draw()
    love.graphics.draw(map1, WindowWidth - 900, WindowHeight - 600, 0, 900 / 15, 600 / 10)
    grid.draw()
    shop.draw()
    love.graphics.print(Money, 300, 300)
end
