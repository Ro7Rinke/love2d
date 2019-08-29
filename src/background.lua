background = {}
    background.image = love.graphics.newImage('assets/images/nurse_walk_all.png')
    local obj = {}
    obj.source = background.image
    obj.x = 0
    obj.y = 0
    background.images_alive = {}
    table.insert(background.images_alive, obj)
    local obj2 = {}
    obj2.source = love.graphics.newImage('assets/images/nurse_walk_all.png')
    obj2.x = 800
    obj2.y = 0
    table.insert(background.images_alive, obj2)
    background.speed = 1
    background.draw = function ()
            love.graphics.draw(background.images_alive[1].source, background.images_alive[1].x, background.images_alive[1].y)
            love.graphics.draw(background.images_alive[2].source, background.images_alive[2].x, background.images_alive[2].y)
    end
    background.update = function (dt)
        if background.images_alive[1].x + background.images_alive[1].source:getWidth() < 0 then
            background.images_alive[1].x = 0
            background.images_alive[2].x = 800
        end
        
        background.images_alive[1].x = background.images_alive[1].x - (dt * 10)
        background.images_alive[2].x = background.images_alive[2].x - (dt * 10)
    end