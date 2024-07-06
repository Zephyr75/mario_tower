local love = require("love")
local ui = require("ui")
local shop = require("shop")

Width = 15
Height = 10
UI = {}

function love.load()
    Success = love.window.setMode(1280, 720)
    Whale = love.graphics.newImage("player.png")
    PreviewImg = love.graphics.newImage("preview.png")

    shop.load()


    -- for i = 1, #UI_shop do
    --     local temp = UI_shop[i]
    --     table.insert(UI, temp)
    -- end

    Grid = {}
    for i=1, Width do
        Grid[i] = 0
        local temp = {}
        for j=1, Height do
            temp[j] = 0
        end
        Grid[i] = temp
    end
    -- local but = ui.button:new(50, 50, 150, 50, Whale, "test", Print1)
    -- local but2 = ui.button:new(50, 100, 150, 50, Whale, "test2", function() Print2() end)
    -- Pre = ui.preview:new(50, 150, 300, 200, PreviewImg, "This is a banana tree", true)
    -- table.insert(UI, but)
    -- table.insert(UI, but2)
    -- table.insert(UI, Pre)
end


-- function Print1()
--      -- Pre.active = true
-- end

function Print2()
     print("2")
end

function love.mousepressed(x, y, button)

    local allUI = {}

    for i = 1, #UI_shop do
        local temp = UI_shop[i]
        table.insert(allUI, temp)
    end
    
    for i = 1, #allUI do
        local elem = allUI[i]
        if button == 1 and elem.clickable then
            if x >= elem.x and x <= elem.x + elem.width and y >= elem.y and y <= elem.y + elem.height then
                elem:on_click()
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

    
    local allUI = {}

    for i = 1, #UI_shop do
        local temp = UI_shop[i]
        table.insert(allUI, temp)
    end
    
    for i = 1, #allUI do
      local elem = allUI[i]
      elem:draw()
    end    -- but:draw()
    -- love.graphics.print("Hello World", 400, 300)
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
    -- love.graphics.print(love.mouse.getX(), 200, 200)
    -- love.graphics.print(love.mouse.getY(), 200, 220)
end
