Player = Object:extend()

function Player:new(type)
    if self.type == 'normal' then
        self.width = 126
        self.height = 203
        self.image = love.graphics.newImage('assets/images/runNurse-126x203.png')
        self.image_1 = love.graphics.newQuad(0, 0, 126, 203, self.image:getDimensions())
        self.image_2 = love.graphics.newQuad(0, 0, 252, 203, self.image:getDimensions())
        self.image_3 = love.graphics.newQuad(0, 0, 378, 203, self.image:getDimensions())
        self.image_4 = love.graphics.newQuad(0, 0, 504, 203, self.image:getDimensions())
    else
        self.width = 380
        self.height = 204
        self.image = love.graphics.newImage('assets/images/ambulancia-380x204.png')
        self.image_1 = love.graphics.newQuad(0, 0, 380, 204, self.image:getDimensions())
        self.image_2 = love.graphics.newQuad(0, 0, 760, 204, self.image:getDimensions())
        self.image_3 = love.graphics.newQuad(0, 0, 1140, 204, self.image:getDimensions())
        self.image_4 = love.graphics.newQuad(0, 0, 1520, 204, self.image:getDimensions())
    end
    self.frames = {self.image_1, self.image_2, self.image_3, self.image_4}
    self.current_role = 2
    self.left_role_y = 55
    self.central_role_y = 268
    self.right_role_y = 481
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