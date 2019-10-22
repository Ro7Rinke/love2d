Player = Object:extend()

function Player:new()
    self.image = love.graphics.newImage('assets/images/runNurse-72x116.png')
    self.image_1 = love.graphics.newQuad(0, 0, 72, 116, self.image:getDimensions())
    self.image_2 = love.graphics.newQuad(0, 0, 148, 116, self.image:getDimensions())
    self.image_3 = love.graphics.newQuad(0, 0, 220, 116, self.image:getDimensions())
    self.image_4 = love.graphics.newQuad(0, 0, 72, 232, self.image:getDimensions())
    self.frames = {self.image_1, self.image_2, self.image_3, self.image_4}
    self.current_role = 1
    self.left_role_y = 30
    self.central_role_y = 60
    self.right_role_y = 90
    self.is_alive = true
    self.lives = 3
    self.x = 0
    self.y = 0
    self.timer = 0
    self.width = 72
    self.height = 116
end

function Player:update(dt)
    if self.is_alive then
        self.timer = self.timer + dt * 18
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
    love.graphics.draw(self.image, self.frames[4], 100,100)
    self.index = (math.floor(self.timer)%4)+1
    love.graphics.draw(self.image, self.frames[self.index], (self.x - ((self.index - 1) * 72)), self.y)
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