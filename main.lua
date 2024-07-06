local love = require("love")
-- local ui = require("ui")
local shop = require("shop")
local grid = require("grid")
local utils = require("utils")

Width = 15
Height = 10
Money = 500

function love.load()
    love.window.setMode(1280, 720)
    WindowWidth = love.graphics.getWidth()
    WindowHeight = love.graphics.getHeight()

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
end

function love.draw()
    grid.draw()
    shop.draw()
    love.graphics.print(Money, 300, 300)
end
