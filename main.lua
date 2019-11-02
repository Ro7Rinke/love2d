function love.load()

    Object = require 'src/classic'
    require 'src/player'
    require 'src/enemy'
    require 'src/scoreboard'
    require 'src/phase'
    require 'src/background'

    -- Objeto da fase atual
    phase = Phase(1)

    player = Player(phase.player)
     heart = love.graphics.newImage('assets/images/heart-39x39.png')
    dead_window = love.graphics.newImage('assets/images/dead_window.png')
    vidona = {
        love.graphics.newQuad(0, 0, 39, 39, heart:getDimensions()),
        love.graphics.newQuad(0, 0, 39, 39, heart:getDimensions()),
        love.graphics.newQuad(0, 0, 39, 39, heart:getDimensions())
    }

    enemies = {}
    scoreboard = Scoreboard()
    current_screen = 'start' -- Sempre inicia no start para rolar as cutscene
    love.graphics.setDefaultFilter('nearest', 'nearest')
    you_died_music = love.audio.newSource('assets/soundFX/youdied.mp3', 'static')
    damage_girl = love.audio.newSource('assets/soundFX/damage_girl.wav', 'static')

    time = {}
    tempoCorrido = 0;

end

function love.update(dt)
    if current_screen == 'start' then
        phase:update(dt, current_screen)
    end

    function love.keypressed(key) verifyKey(key) end
    tempoCorrido = tempoCorrido + dt;

    -- Teste para não conseguir mudar o current_screen quando tiver morto
    if tempoCorrido >= 10 and phase.id < 3 and current_scene ~= 'dead' then
        current_screen = 'end_phase'
        tempoCorrido = 0;
    end

    if current_screen == 'game' then
        phase:update(dt, current_screen)

        if player.lives == 3 then
            vidona[1]:setViewport(0, 0, 39, 39)
            vidona[2]:setViewport(0, 0, 39, 39)
            vidona[3]:setViewport(0, 0, 39, 39)
        end

        -- Faz com que todos os tipos de inimigos tenham seu tempo atualizado
        -- Agora os inimigos são pegos diretamenta do objeto da fase
        for i, t in pairs(phase.enemys) do
            if time[i] == nil then time[i] = 0 end
            time[i] = time[i] - dt
            if time[i] <= 0 then
                table.insert(enemies, Enemy(i))
                time[i] = phase.enemys[i]
            end
        end

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
                    damage_girl:play()

                    if player.lives > 1 then
                        vidona[player.lives]:setViewport(39, 0, 39, 39)

                        -- damage_girl:stop()
                    else
                        vidona[player.lives]:setViewport(39, 0, 39, 39)
                        current_screen = 'dead'
                    end
                     player:takeDamage()
                    table.remove(enemies, i)
                end
            end

        end
        player:update(dt)
    end
end

function love.draw()
     -- Se a cena for start, inimigos zerados,
     -- musicas paradas e desenha a tela de
     -- inicio da fase em questão
    if current_screen == 'start' then
        enemys = {}
        current_screen = 'start'
        love.graphics.draw(phase.start)
        phase.music:stop()
        you_died_music:stop()

    elseif current_screen == 'game' then
        -- Cria o background da fase atual
        enemys = {}
        phase.music:play()
        phase.draw()

        for i, enemy in ipairs(enemies) do enemy:draw() end
        player:draw()
        
        love.graphics.draw(heart, vidona[1], 20, 20)
        love.graphics.draw(heart, vidona[2], 63, 20)
        love.graphics.draw(heart, vidona[3], 106, 20)
        love.graphics.setColor(1, 1, 1)
        love.graphics.print("PONTUACAO: " .. tostring(player.lives), 10, 10)

    -- Se for o final da fase, todos inimigos zerados
    -- musica parada e tela de fim de fase desenhada
    elseif current_screen == 'end_phase' then
        enemys = {}
        current_screen = 'end_phase'
        love.graphics.draw(phase.fim)
        phase.music:stop()
        
    elseif current_screen == 'dead' then
        enemys = {}
        current_screen = 'dead'
        love.graphics.draw(dead_window)
        phase.music:stop()
        you_died_music:play()
    end   
   
end

function verifyKey(key)

    if current_screen == 'start' then
        if key == 'space' then
            current_screen = 'game'
            you_died_music:stop()
        end
    end

    if current_screen == 'game' then
        if key == 'right' or key == 'down' then
            player:changeRole('right')
        end
        if key == 'left' or key == 'up' then player:changeRole('left') end
    end

    if current_screen == 'dead' then
        if key == 'r' then
            resetCurrentPhase()
        elseif key == 'escape' then
            love.event.quit(0)
        end

    end

    -- Se for o fim de uma fase, após ser
    -- pressionado o espaço a fase seguinte
    -- irá começar
    if current_screen == 'end_phase' then
        if key == 'space' then
            you_died_music:stop()
            selectPhase(phase.id + 1)
        elseif key == 'escape' then
            love.event.quit(0)
        end
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

    phase.music:stop()

    phase = Phase(phase_id)
    player = Player(phase.player)

    current_screen = 'game'
end

function resetCurrentPhase()
    player:revive()
    tempoCorrido = 0;
    you_died_music:stop()
    current_screen = 'game'
    selectPhase(phase.id)
end
