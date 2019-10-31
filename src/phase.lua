Phase = Object:extend()

function Phase:new(id)
    if id == 1 then
        bg = Background('assets/images/fase1-1200x675.png')
    else
        bg = Background('assets/images/fase2-1200x675.png')
    end

    self.enemys = {zombie = 3, stone = 8}
    self.duration = 40
    self.music = love.audio.newSource('assets/soundFX/dancin_forro.mp3',
                                      'static')
    self.music:setVolume(0.5) -- 10% volume
    self.music:play()
end

function Phase:update(dt) bg:update(dt) end

function Phase:draw() bg:draw() end
