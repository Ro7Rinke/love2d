Enemy = Object:extend()

function Enemy:new(type)
    self.speed = 6 -- Velocidade 
    self.anim_timer = 1 / self.speed -- Temporizador da animação
    self.frame = 0 -- Frame atual
    self.xoffset = 0 -- Espaçamento entre frames 
    
    self.type = type
    self.damage = true
    if self.type == "zombie" then
        self.image = love.graphics.newImage('assets/images/zombie-102x192.png')
        self.width = 102
        self.height = 192
        self.num_frames = 3 -- Total de frames

    elseif self.type == "stone" then
        self.image = love.graphics.newImage('assets/images/stone-140x140.png')
        self.width = 140
        self.height = 140
        self.num_frames = 1 -- Total de frames

    elseif self.type == "bisturi" then
        self.image = love.graphics.newImage('assets/images/bisturi-72x75.png')
        self.width = 72
        self.height = 75
        self.num_frames = 4 -- Total de frames

    elseif self.type == "buraco" then
        self.image = love.graphics.newImage('assets/images/buraco-96x96.png')
        self.width = 96
        self.height = 96
        self.num_frames = 3 -- Total de frames

    elseif self.type == "fox" then
        self.image = love.graphics.newImage('assets/images/fox-120x96.png')
        self.width = 120
        self.height = 96
        self.num_frames = 5 -- Total de frames
        self.speed = 12 -- Velocidade 

    elseif self.type == "horse" then
        self.image = love.graphics.newImage('assets/images/horse-240x192.png')
        self.width = 240
        self.height = 192
        self.num_frames = 5 -- Total de frames
        self.speed = 12 -- Velocidade 

    elseif self.type == "moose" then
        self.image = love.graphics.newImage('assets/images/moose-240x192.png')
        self.width = 240
        self.height = 192
        self.num_frames = 5 -- Total de frames
        self.speed = 12 -- Velocidade 

    elseif self.type == "life" then
        self.image = love.graphics.newImage('assets/images/medicalKit-60x65.png')
        self.width = 60
        self.height = 65
        self.num_frames = 4 -- Total de frames
        self.speed = 12 -- Velocidade 
        self.damage = false
    end

    self.frames = love.graphics.newQuad(0, 0, self.image:getWidth(),
                                        self.image:getHeight(),
                                        self.image:getDimensions()) -- Faz com que carregue a imagem inteira antes de desenhar na tela
    self.x = 1200
    self.y = 41
    self.timer = 0

    self.left_role_y = 41
    self.central_role_y = 238
    self.right_role_y = 435

    -- math.randomseed(os.clock()*10)
    -- Gera numeros aleatorios de 1 a 3 para
    -- definir em qual role o inimigo irá nascer
    self.current_role = math.random(1, 3)

    if self.current_role == 1 and self.y ~= self.left_role_y then
        self.y = self.left_role_y

    elseif self.current_role == 2 and self.y ~= self.central_role_y then
        self.y = self.central_role_y

    elseif self.current_role == 3 and self.y ~= self.right_role_y then
        self.y = self.right_role_y

    end

end

function Enemy:update(dt)

    if dt > 0.035 then return end

    -- Faz a animação ser recortada
    self.anim_timer = self.anim_timer - dt
    if self.anim_timer <= 0 then

        self.anim_timer = 1 / self.speed
        self.frame = self.frame + 1

        if self.frame >= self.num_frames then self.frame = 0 end

        self.xoffset = self.width * self.frame
        self.frames:setViewport(self.xoffset, 0, self.width, self.height)

    end

    -- Temporização da onda de inimigos

    self.x = self.x - (300 * dt) -- Movimenta o inimigo

    -- Atualizando posição dos inimigos
    for i, self in ipairs(enemies) do

        if self.x < -102 then -- remover se ultrapassar o final da tela
            table.remove(enemies, i)
        end

    end
end

function Enemy:draw()

    love.graphics.draw(self.image, self.frames, self.x, self.y)
    
 end
