Phase = Object:extend()

function Phase:new(id)
    self.id = id
    self.player = 'normal'

    if self.id == 1 then
        bg = Background('assets/images/fase1-1200x675.png') -- Imagem de fundo da fase
        self.start = love.graphics.newImage('assets/images/start_fase_1.png')
        self.fim = love.graphics.newImage('assets/images/testeFim-1200x675.png')
        self.speed = 2 -- Velocidade 
        self.num_frames = 2 -- Total de frames
        self.width = 1200
        self.height = 675

        self.enemys = {zombie = 3, bisturi = 8, life = 5} -- Inimigos da fase
        self.duration = 158 -- Duraçao que a fase pode vir a ter [NÃO IMPLEMENTADO]

        self.music = love.audio.newSource('assets/soundFX/tension_music.mp3', 'static') -- MUSICA DA FASE
        self.music:setVolume(0.5) -- 50% volume

    elseif self.id == 2 then
        self.player = 'special'
        bg = Background('assets/images/fase2-1200x675.png') -- Imagem de fundo da fase
        self.start = love.graphics.newImage('assets/images/start_fase_2.png')
        self.fim = love.graphics.newImage('assets/images/testeFim-1200x675.png')
        self.speed = 2 -- Velocidade 
        self.num_frames = 2 -- Total de frames
        self.width = 1200
        self.height = 675

        self.enemys = {zombie = 3, stone = 8, buraco = 5} -- Inimigos da fase
        self.duration = 153 -- Duraçao que a fase pode vir a ter [NÃO IMPLEMENTADO]

        self.music = love.audio.newSource('assets/soundFX/dancin_forro.mp3',
                                          'static') -- MUSICA DA FASE
        self.music:setVolume(0.5) -- 50% volume

    elseif self.id == 3 then
        bg = Background('assets/images/fase3-1200x675.png') -- Imagem de fundo da fase
        self.start = love.graphics.newImage('assets/images/start_fase_3.png')
        self.fim = love.graphics.newImage('assets/images/testeFim-1200x675.png')
        self.speed = 2 -- Velocidade 
        self.num_frames = 2 -- Total de frames
        self.width = 1200
        self.height = 675

        self.enemys = {zombie = 3, fox = 8, horse = 4, moose = 6, stone = 10} -- Inimigos da fase
        self.duration = 149 -- Duraçao que a fase pode vir a ter [NÃO IMPLEMENTADO]

        self.music = love.audio.newSource('assets/soundFX/hope_music.mp3',
                                          'static') -- MUSICA DA FASE
        self.music:setVolume(0.5) -- 50% volume
        
    end

    -- Variveis de animação
    self.xoffset = 0 -- Espaçamento entre frames 
    self.anim_timer = 1 / self.speed -- Temporizador da animação
    self.frame = 0 -- Frame atual

    self.frames = love.graphics.newQuad(0, 0, self.start:getWidth(),
                                        self.start:getHeight(),
                                        self.start:getDimensions()) -- Faz com que carregue a imagem inteira antes de desenhar na tela
    self.frames:setViewport(self.xoffset, 0, self.width, self.height)

end

function Phase:update(dt, current_screen)

    if current_screen == 'start' then
        if dt > 0.035 then return end
        
        self.anim_timer = self.anim_timer - dt

        if self.anim_timer <= 0 then
            self.anim_timer = 1 / self.speed
            self.frame = self.frame + 1

            if self.frame >= self.num_frames then self.frame = 0 end

            self.xoffset = self.width * self.frame
            self.frames:setViewport(self.xoffset, 0, self.width, self.height)
        end
    else

        bg:update(dt)

    end
end

function Phase:draw() bg:draw() end
