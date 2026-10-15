Count = Class{}

function Count:init()
    self.timer = 0
    self.counter = 1
    self.menuFont = love.graphics.newFont("fonts/Orbitron-VariableFont_wght.ttf", 200)
    self.default_color = {0.35, 0.85, 1}
end

function Count:keyreleased(key)
end

function Count:update(dt)
    -- updating the timer
    if self.counter == 4 then
        love.graphics.setColor(1, 1, 1)
        states:change_state(3)
    end
    if self.timer >= 1  then
        -- change the state to playing
        score:clone():play()
        self.counter = self.counter + 1
        self.timer = self.timer - 1
 
    end
    self.timer = self.timer + dt
end

function Count:render()
    love.graphics.setFont(self.menuFont)
    love.graphics.setColor(self.default_color)
    love.graphics.printf(
    self.counter,
    0,
    (HEIGHT - self.menuFont:getHeight()) / 2,
    WIDTH,
    "center"
)
    --love.graphics.printf(math.floor(self.timer) , 0, HEIGHT / 2, WIDTH / 2, "center")
end
