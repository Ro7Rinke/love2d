Enemy = Object:extend()

function Enemy:new(type)
    self.speed = 6 -- Velocidade 
    self.anim_timer = 1 / self.speed -- Temporizador da animação
    self.frame = 0 -- Frame atual
    self.num_frames = 3 -- Total de frames
    self.xoffset = 0 -- Espaçamento entre frames 

    self.type = type
    self.image = love.graphics.newImage('assets/images/zombie-102x192.png')
    self.frames = love.graphics.newQuad(0, 0, 306, 192,self.image:getDimensions())
    self.x = 300
    self.y = 0
    self.timer = 0
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
end

function Enemy:update(dt)
    if dt > 0.035 then return end

    -- self.timer = self.timer + dt * 4

    -- Faz a animação ser recortada
    self.anim_timer = self.anim_timer - dt
    if self.anim_timer <= 0 then
        self.anim_timer = 1 / self.speed
        self.frame = self.frame + 1
        if self.frame >= self.num_frames then
           self.frame = 0
           end
        self.xoffset = 102 * self.frame
        self.frames:setViewport(self.xoffset, 0, 102, 192)
    end

end

function Enemy:draw()
   love.graphics.draw(self.image, self.frames, self.x, self.y)
end
