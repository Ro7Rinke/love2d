Player = Object:extend()

function Player:new(type)
    self.type = type
    if self.type == 'normal' then
        self.width = 192
        self.height = 192
        self.image = love.graphics.newImage('assets/images/runNurse-192x192.png')
        self.image_1 = love.graphics.newQuad(0, 0, 192, 192, self.image:getDimensions())
        self.image_2 = love.graphics.newQuad(0, 0, 384, 192, self.image:getDimensions())
        self.image_3 = love.graphics.newQuad(0, 0, 576, 192, self.image:getDimensions())
        self.image_4 = love.graphics.newQuad(0, 0, 768, 192, self.image:getDimensions())
    else
      -- Criação do personagem
        self.width = 363
        self.height = 195
        self.image = love.graphics.newImage('assets/images/ambulancia-363x195.png')
        self.image_1 = love.graphics.newQuad(0, 0, 363, 195, self.image:getDimensions())
        self.image_2 = love.graphics.newQuad(0, 0, 726, 195, self.image:getDimensions())
        self.image_3 = love.graphics.newQuad(0, 0, 1089, 195, self.image:getDimensions())
        self.image_4 = love.graphics.newQuad(0, 0, 1452, 195, self.image:getDimensions())
    end
    -- Animação do personagem
    self.frames = {self.image_1, self.image_2, self.image_3, self.image_4}
    -- Qual linha o personagem ira começar
    self.current_role = 2
    -- Posições que o personagem vai ficar
    -- em cada uma das linhas
    self.left_role_y = 41
    self.central_role_y = 238
    self.right_role_y = 435
    self.is_alive = true
    self.lives = 3
    self.x = 0
    self.y = 0
    self.timer = 0
end

function Player:update(dt)
    if self.is_alive then
        self.timer = self.timer + dt * 12
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
    self.index = (math.floor(self.timer)%4)+1
    love.graphics.draw(self.image, self.frames[self.index], (self.x - ((self.index - 1) * self.width)), self.y)
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