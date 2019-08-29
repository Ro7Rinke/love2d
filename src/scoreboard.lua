Scoreboard = Object:extend()

function Scoreboard:startAddScore(phase) -- phase number
    if phase == 0 then -- phase number 0 is tthe total score 
        self.score.adding_total = true
    elseif phase == 1 then
        self.score.adding_first = true
        elseif phase == 2 then
            self.score.adding_second = true
            elseif phase == 3 then
                self.score.adding_third = true
            end
end

function Scoreboard:stopAddScore(phase) -- phase number
    if phase == 0 then -- phase number 0 is tthe total score 
        self.score.adding_total = false
    elseif phase == 1 then
        self.score.adding_first = false
        elseif phase == 2 then
            self.score.adding_second = false
            elseif phase == 3 then
                self.score.adding_third = false
            end
end

function Scoreboard:startAddTime(phase) -- phase number
    if phase == 0 then -- phase number 0 is tthe total time 
        self.time.adding_total = true
    elseif phase == 1 then
        self.time.adding_first = true
        elseif phase == 2 then
            self.time.adding_second = true
            elseif phase == 3 then
                self.time.adding_third = true
            end
end

function Scoreboard:stopAddTime(phase) -- phase number
    if phase == 0 then -- phase number 0 is tthe total time 
        self.time.adding_total = false
    elseif phase == 1 then
        self.time.adding_first = false
        elseif phase == 2 then
            self.time.adding_second = false
            elseif phase == 3 then
                self.time.adding_third = false
            end
end

function Scoreboard:new()
    self.score = {}
    self.score.first = 0
    self.score.second = 0
    self.score.third = 0
    self.score.total = 0
    self.score.adding_first = false
    self.score.adding_second = false
    self.score.adding_third = false
    self.score.adding_total = false
    self.time = {}
    self.time.first = 0
    self.time.second = 0
    self.time.third = 0
    self.time.total = 0
    self.time.adding_first = false
    self.time.adding_second = false
    self.time.adding_third = false
    self.time.adding_total = false
end

function Scoreboard:update(dt)
    if self.score.adding_first then
        self.score.first = self.score.first + dt
    end
    if self.score.adding_second then
        self.score.second = self.score.second + dt
    end
    if self.score.adding_third then
        self.score.third = self.score.third + dt
    end
    if self.score.adding_total then
        self.score.total = self.score.total + dt
    end
    if self.time.adding_first then
        self.time.first = self.time.first + dt
    end
    if self.time.adding_second then
        self.time.second = self.time.second + dt
    end
    if self.time.adding_third then
        self.time.third = self.time.third + dt
    end
    if self.time.adding_total then
        self.time.total = self.time.total + dt
    end
end

function Scoreboard:draw()
    love.graphics.print(self.score.total, 0, 0)
end