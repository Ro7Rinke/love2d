Player = Object:extend()

function Player:new()
    self.image_1 = love.graphics.newImage('assets/images/nurse_walk_1.png')
    self.image_2 = love.graphics.newImage('assets/images/nurse_walk_2.png')
    self.image_3 = love.graphics.newImage('assets/images/nurse_walk_3.png')
    self.image_4 = love.graphics.newImage('assets/images/nurse_walk_4.png')
    self.frames = {self.image_1, self.image_2, self.image_3, self.image_4}
    self.x = 0
    self.y = 0
    self.timer = 1
    self.width = self.image_1:getWidth()
    self.height = self.image_1:getHeight()
end

function Player:update(dt)
    self.timer = self.timer + dt * 8
end

function Player:draw()
    love.graphics.draw(self.frames[(math.floor(self.timer)%4)+1], self.x, self.y)
end