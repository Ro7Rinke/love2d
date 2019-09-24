Player = Object:extend()

function Player:new()
    self.image_1 = love.graphics.newImage('assets/images/nurse_walk_1.png')
    self.image_2 = love.graphics.newImage('assets/images/nurse_walk_2.png')
    self.image_3 = love.graphics.newImage('assets/images/nurse_walk_3.png')
    self.image_4 = love.graphics.newImage('assets/images/nurse_walk_4.png')
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
    self.width = self.image_1:getWidth()
    self.height = self.image_1:getHeight()
end

function Player:update(dt)
    self.timer = self.timer + dt * 8

    if self.current_role == 1 && self.y ~= self.left_role_y then
        self.y = self.left_role_y
    else if self.current_role == 2 && self.y ~= self.central_role_y then
        self.y = self.central_role_y
    else if self.current_role == 3 && self.y ~= self.right_role_y then
        self.y = self.right_role_y
    end
end

function Player:draw()
    love.graphics.draw(self.frames[(math.floor(self.timer)%4)+1], self.x, self.y)
end

function Player:changeRole(direction)
    if self.is_alive then
        if direction == 'right' && self.current_role < 3 then
            self.current_role = self.current_role + 1
        else if direction == 'left' && self.current_role > 1 then
            self.current_role = self.current_role - 1
        end
    end
end