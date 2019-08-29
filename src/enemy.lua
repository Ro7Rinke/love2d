Enemy = Object:extend()

function Enemy:new(type)
    self.type = type
    self.image = love.graphics.newImage('assets/images/nurse_walk_1.png')
    self.x = 300
    self.y = 0
    self.timer = 0
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
end

function Enemy:update(dt)
    self.timer = self.timer + dt * 4
end

function Enemy:draw()
    love.graphics.draw(self.image, self.x, self.y)
end