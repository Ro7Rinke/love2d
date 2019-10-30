Player = Object:extend()

function Player:new(type)
    self.type = type

    if self.type == 'normal' then
        self.speed = 12 -- Velocidade 
        self.num_frames = 4 -- Total de frames
        
        self.image = love.graphics.newImage('assets/images/runNurse-192x192.png')
        self.width = 192
        self.height = 192
    else
        self.speed = 12 -- Velocidade 
        self.num_frames = 4 -- Total de frames

        self.image = love.graphics.newImage('assets/images/ambulancia-363x195.png')
        self.width = 363
        self.height = 195

    end

    -- Variveis de animação
    self.xoffset = 0 -- Espaçamento entre frames 
    self.anim_timer = 1 / self.speed -- Temporizador da animação
    self.frame = 0 -- Frame atual
    
    self.frames = love.graphics.newQuad(0, 0, self.image:getWidth(), self.image:getHeight(), self.image:getDimensions()) -- Faz com que carregue a imagem inteira antes de desenhar na tela
    self.frames:setViewport(self.xoffset, 0, self.width, self.height)

    -- Qual linha o personagem ira começar
    self.current_role = 2

    -- Posições que o personagem vai ficar
    -- em cada uma das linhas
    self.left_role_y = 41
    self.central_role_y = 238
    self.right_role_y = 435
    self.is_alive = true
    self.lives = 3
    self.revives = 0
    self.x = 20
    self.y = 0
    self.timer = 0
    self.current_phase = 1
end

function Player:update(dt)
    if self.is_alive then

        if dt > 0.035 then return end

        -- Faz a animação ser recortada
        self.anim_timer = self.anim_timer - dt

            if self.anim_timer <= 0 then
                self.anim_timer = 1 / self.speed
                self.frame = self.frame + 1

                if self.frame >= self.num_frames then
                    self.frame = 0
                end
                
                self.xoffset = self.width * self.frame
                self.frames:setViewport(self.xoffset, 0, self.width, self.height)
            end

        if self.lives < 1 then
            self.is_alive = false
        else

            if self.current_role == 1 and self.y ~= self.left_role_y then
                self.y = self.left_role_y
            else

                if self.current_role == 2 and self.y ~= self.central_role_y then
                    self.y = self.central_role_y
                else

                    if self.current_role == 3 and self.y ~= self.right_role_y then
                        self.y = self.right_role_y
                    end
                end
            end
        end
    end
end

function Player:draw()
    love.graphics.draw(self.image, self.frames, self.x, self.y)
end

function Player:changeRole(direction)
    if self.is_alive then
        if direction == 'right' and self.current_role < 3 then
            self.current_role = self.current_role + 1
        else
            if direction == 'left' and self.current_role > 1 then
                self.current_role = self.current_role - 1
            end
        end
    end
end

function Player:takeDamage()
    if self.lives > 1 then
        self.lives = self.lives - 1
    else
        s
    end
end

function Player:revive()
    self.lives = 3
    self.revives = self.revives + 1
    self.is_alive = true
end