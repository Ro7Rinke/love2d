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

end

function love.update(dt)

    if current_screen == 'game' then
        background.update(dt)
    end

end

function love.draw()

    if current_screen == 'game' then
        background.draw()
    end

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

function selectPhase(phase_id)
    if phase_id == 1 then

    end
    if phase_id == 2 then
        background.image = love.graphics.newImage('assets/images/fase2-1200x630.png')
        background.image2 = love.graphics.newImage('assets/images/fase2-1200x630.png')
        scoreboard.startAddTime(0)
        scoreboard.startAddTime(2)
        scoreboard.startAddScore(0)
        scoreboard.startAddScore(2)
    end
end
