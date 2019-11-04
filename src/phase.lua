Phase = Object:extend()

function Phase:new(id)
    self.id = id
    self.player = 'normal'

    if self.id == 1 then
        bg = Background('assets/images/fases/fase1-1200x675.png') -- Imagem de fundo da fase
        self.start = love.graphics.newImage('assets/images/cutscene/start_fase_1.png')
        self.fim = love.graphics.newImage('assets/images/cutscene/end_fase_1.png')

        self.enemys = {zombie = 3, bisturi = 8, life = 5} -- Inimigos da fase
        self.duration = 158 -- Duraçao que a fase pode vir a ter [NÃO IMPLEMENTADO]

        self.music = love.audio.newSource('assets/soundFX/tension_music.mp3', 'static') -- MUSICA DA FASE
        self.music:setVolume(0.5) -- 50% volume

    elseif self.id == 2 then

        self.player = 'special'
        bg = Background('assets/images/fases/fase2-1200x675.png') -- Imagem de fundo da fase
        self.start = love.graphics.newImage('assets/images/cutscene/start_fase_2.png')
        self.fim = love.graphics.newImage('assets/images/cutscene/end_fase_2.png')

        self.enemys = {zombie = 3, stone = 8, buraco = 5} -- Inimigos da fase
        self.duration = 153 -- Duraçao que a fase pode vir a ter [NÃO IMPLEMENTADO]

        self.music = love.audio.newSource('assets/soundFX/dancin_forro.mp3','static') -- MUSICA DA FASE
        self.music:setVolume(0.5) -- 50% volume

    elseif self.id == 3 then

        bg = Background('assets/images/fases/fase3-1200x675.png') -- Imagem de fundo da fase
        self.start = love.graphics.newImage('assets/images/cutscene/start_fase_3.png')
        self.fim = love.graphics.newImage('assets/images/cutscene/end_fase_3.png')

        self.enemys = {zombie = 3, fox = 8, horse = 4, moose = 6, stone = 10} -- Inimigos da fase
        self.duration = 149 -- Duraçao que a fase pode vir a ter [NÃO IMPLEMENTADO]

        self.music = love.audio.newSource('assets/soundFX/hope_music.mp3','static') -- MUSICA DA FASE
        self.music:setVolume(0.5) -- 50% volume
        
    end

end

function Phase:update(dt, current_screen)

        bg:update(dt)

end

function Phase:draw() bg:draw() end
