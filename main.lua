function love.load()

    Object = require 'src/classic'
    require 'src/player'
    player = Player()

end

function love.update(dt)

    player:update(dt)
    
    function love.keypressed(key)
        verifyKey()

    end

end

function love.draw()
    player:draw()
end

function verifyKey(key)

    if key == 'right' or key == 'down' then

    end
    if key == 'left' or key == 'up' then

    end

end

function verifyCollision (a, b)

    local a_left = a.x
    local a_right = a.x + a.width
    local a_top = a.y
    local a_bottom = a.y + a.height

    local b_left = b.x
    local b_right = b.x + b.width
    local b_top = b.y
    local b_bottom = b.y + b.height

    if a_right > b.left and
        a_left < b_right and
            a_bottom > b_top and
                a_top < b_bottom then
        return true
    end

    return false

end
