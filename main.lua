function love.load()

    Object = require 'src/classic'
    require 'src/player'
    require 'src/enemy'
    require 'src/scoreboard'
    require 'src/background'
    player = Player('normal')
    enemies = {Enemy("zombie")}
    scoreboard = Scoreboard()
    current_screen = 'game'
    love.graphics.setDefaultFilter('nearest', 'nearest')
    music = love.audio.newSource('assets/soundFX/ambulanciamusic.mp3', 'static')
    music:setVolume(0.1) -- 10% volume
    music:play()
<<<<<<< HEAD
    tempoSpawn = {zombie = 3}
=======
    tempoSpawn = {zombie = 0.6}
>>>>>>> b727a23973eb1b5145ef7e7fd974ec85ec891a13
    time = {zombie = 0}
    dtMaxCreateEnemy = 0.4
    dtCurrentEnemy = dtMaxCreateEnemy
end

function love.update(dt)

    --Faz com que todos os tipos de inimigos tenham seu tempo atualizado
    for i, t in pairs(time) do
        time[i] = time[i]-dt
        if time[i] <= 0 then
            table.insert(enemies, Enemy("zombie"))
            time[i] = tempoSpawn[i]
        end
    end
<<<<<<< HEAD
=======
    
    
   -- time.zombie = time.zombie - dt
    --if time.zombie <= 0 then
    --    table.insert(enemies, Enemy("zombie"))
    --    time.zombie = tempoSpawn.zombie
        --time = time - (1 * dt)
        --if time < 0 then
            --time = tempoSpawn
            -- Criando uma instância do inimigo
            --posDynamic = math.random(10, love.graphics.getWidth() - ((enemy:getWidth() / 2) + 10))
            --lvlEnemy = { x = posDynamic, y = -enemy:getWidth(), img = enemy }
            --table.insert(enemies, lvlEnemy)
        --end
  --  end
>>>>>>> b727a23973eb1b5145ef7e7fd974ec85ec891a13

    if current_screen == 'game' then
        function love.keypressed(key) verifyKey(key) end
        for i, enemy in ipairs(enemies) do enemy:update(dt) end
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

    if a_right > b.left and a_left < b_right and a_bottom > b_top and a_top <
        b_bottom then return true end

    return false

end

function selectPhase(phase_id)
    if phase_id == 1 then end
    if phase_id == 2 then
        background.image = love.graphics.newImage('assets/images/fase2-1200x675.png')
        background.image2 = love.graphics.newImage('assets/images/fase2-1200x675.png')
        scoreboard.startAddTime(0)
        scoreboard.startAddTime(2)
        scoreboard.startAddScore(0)
        scoreboard.startAddScore(2)
    end
end
