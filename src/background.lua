Background = Object:extend()

function Background:new(image)
    images_alive = {}

    obj = {}
    obj.source = love.graphics.newImage(image)
    obj.x = 0
    obj.y = 0
    table.insert(images_alive, obj)
    obj2 = {}
    obj2.source = love.graphics.newImage(image)
    obj2.x = 1200
    obj2.y = 0
    table.insert(images_alive, obj2)
    self.speed = 1
end

function Background:draw()

    love.graphics.draw(images_alive[1].source, images_alive[1].x,
                       images_alive[1].y)
    love.graphics.draw(images_alive[2].source, images_alive[2].x,
                       images_alive[2].y)
end

function Background:update(dt)
    if images_alive[1].x + images_alive[1].source:getWidth() < 0 then
        images_alive[1].x = 0
        images_alive[2].x = 1200
    end

    images_alive[1].x = images_alive[1].x - (dt * 700)
    images_alive[2].x = images_alive[2].x - (dt * 700)
end
