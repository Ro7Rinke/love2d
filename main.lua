function love.load()

    Object = require 'src/classic'
    require 'src/player'
    require 'src/enemy'
    require 'src/scoreboard'
    require 'src/background'
    player = Player()
    enemies = {Enemy('zombie')}
    scoreboard = Scoreboard()
    current_screen = 'game'
    -- system = initSystem()

end

function love.update(dt)




    -- player:update(dt)
    -- scoreboard:update(dt)
    -- background.update(dt)
    -- function love.keypressed(key)
    --     verifyKey()
    -- end

end

function love.draw()




    -- player:draw()
    -- love.graphics.print(background.images_alive[1].x, 0 ,0)
    -- love.graphics.draw(background.images_alive[1].source, background.images_alive[1].x, background.images_alive[1].y)
    -- love.graphics.draw(background.images_alive[2].source, background.images_alive[2].x, background.images_alive[2].y)
    -- scoreboard:draw()
end

function verifyKey (key)
    if current_screen == 'game' then
        if key == 'right' or key == 'down' then
            player:changeRole('right')
        end
        if key == 'left' or key == 'up' then
            player:changeRole('left')
        end
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

-- function initScoreboard ()
--     local scoreboard = {}
    
--     scoreboard.first = 0
--     scoreboard.add_first = false
--     scoreboard.second = 0
--     scoreboard.add_second = false
--     scoreboard.third = 0
--     scoreboard.add_third = false
--     scoreboard.total = 0
--     scoreboard.add_total = false
--     scoreboard.time = {}
--     scoreboard.time.first = 0
--     scoreboard.time.add_first = false
--     scoreboard.time.second = 0
--     scoreboard.time.add_second = false
--     scoreboard.time.third = 0
--     scoreboard.time.add_third = false
--     scoreboard.time.total = 0
--     scoreboard.time.add_total = false

--     return scoreboard
-- end

-- function initSystem ()

--     local system = {}

--     return system

-- end