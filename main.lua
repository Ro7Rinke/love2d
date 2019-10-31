function love.load()

    Object = require 'src/classic'
    require 'src/player'
    require 'src/enemy'
    require 'src/scoreboard'
    require 'src/background'
    player = Player('special')
    heart = love.graphics.newImage('assets/images/heart-39x39.png')
    --vidona = love.graphics.newQuad(39, 78, heart:getWidth(), heart:getHeight(), heart:getDimensions())
    vidona = {love.graphics.newQuad(0, 0, 39, 39, heart:getDimensions()),
              love.graphics.newQuad(0, 0, 39, 39, heart:getDimensions()),
              love.graphics.newQuad(0, 0, 39, 39, heart:getDimensions()) }
    --vidona[0] = love.graphics.newQuad(0, 0, 39, 39, heart:getDimensions())
    --vidona[1] = love.graphics.newQuad(0, 0, 39, 39, heart:getDimensions())
    --vidona[2] = love.graphics.newQuad(0, 0, 39, 39, heart:getDimensions())
    --vidinha = love.graphics.newQuad(39, 78, 78, 39, heart:getDimensions())
    enemies = {}
    scoreboard = Scoreboard()
    current_screen = 'game'
    love.graphics.setDefaultFilter('nearest', 'nearest')
    music = love.audio.newSource('assets/soundFX/ambulanciamusic.mp3', 'static')
    music:setVolume(0.1) -- 10% volume
    music:play()
    tempoSpawn = {zombie = 3, stone = 8}
    time = {zombie = 0, stone = 0}

end

function love.update(dt)

    --Faz com que todos os tipos de inimigos tenham seu tempo atualizado
    for i, t in pairs(time) do
        time[i] = time[i]-dt
        if time[i] <= 0 then
            table.insert(enemies, Enemy(i))
            time[i] = tempoSpawn[i]
        end
    end

    if current_screen == 'game' then
        function love.keypressed(key) verifyKey(key) end
        
        
        for i, enemy in ipairs(enemies) do 
            enemy:update(dt) 
            local a_left = player.x
            local b_left = enemy.x
            local b_right = enemy.x + enemy.width
            local b_center = (b_left + b_right) / 2

            -- Se a posiçao do player ainda não passou
            -- a metade do tamanho do inimigo ele verifica
            -- se há colisão.
            if a_left < b_center then
                if verifyCollision(player, enemy) then
                  algo = player:takeDamage()
                  if algo > 0 then
                    vidona[algo]:setViewport(39, 0, 39, 39)
                  end

                  table.remove( enemies,i )
                end
            end
                
            
        end
        background.update(dt)
        player:update(dt)
    end
end

function love.draw()
    if current_screen == 'game' then
        background.draw()
    end
    
    for i, enemy in ipairs(enemies) do
        enemy:draw()
    end
    player:draw()
    love.graphics.draw(heart, vidona[1], 20, 20)
    love.graphics.draw(heart, vidona[2], 63, 20)
    love.graphics.draw(heart, vidona[3], 106, 20)
    love.graphics.setColor(1,1,1)
    love.graphics.print("PONTUACAO: "..tostring(player.lives), 10, 10)
    if player.lives == 0 then
    love.graphics.print("MORREU DESGRAÇA", 500, 500)
    end
end

function verifyKey(key)
    if current_screen == 'game' then
        if key == 'right' or key == 'down' then
            player:changeRole('right')
        end
        if key == 'left' or key == 'up' then player:changeRole('left') end
    end
end

function verifyCollision(a, b)

    local a_left = a.x
    local a_right = a.x + a.width
    local a_top = a.y
    local a_bottom = a.y + a.height

    local b_left = b.x
    local b_right = b.x + b.width
    local b_top = b.y
    local b_bottom = b.y + b.height

    if a_right > b_left and a_left < b_right and a_bottom > b_top and a_top <
        b_bottom then return true end

    return false

end

function selectPhase(phase_id)
    if phase_id == 1 then
      current_phase = 1
      background.image = love.graphics.newImage('assets/images/fase1-1200x675.png')
    end
    
    if phase_id == 2 then
        current_phase = 2
        background.image2 = love.graphics.newImage('assets/images/fase2-1200x675.png')
        scoreboard.startAddTime(0)
        scoreboard.startAddTime(2)
        scoreboard.startAddScore(0)
        scoreboard.startAddScore(2)
    end
end

function resetCurrentPhase()
    player:revive()
    selectPhase(player.current_phase)
end