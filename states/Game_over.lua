Game_over = Class{}

function Game_over:init()
    self.gameOverFont = love.graphics.newFont("fonts/Orbitron-VariableFont_wght.ttf", 150)
    self.messageFont = love.graphics.newFont("fonts/Orbitron-VariableFont_wght.ttf", 25)
    self.default_color = {0.35, 0.85, 1}
    self.gameOverText = "Game Over"
    self.messageText = "press 'enter' to go back to menu, and 'space to restart'"
end

function Game_over:keyreleased(key)
    if key == "return" then
        love.graphics.setColor(1, 1, 1)
        states:change_state(1)
    elseif key == "space" then
        love.graphics.setColor(1, 1, 1)
        states:change_state(2)
    end
end


function Game_over:update()

end

function Game_over:render()
    love.graphics.setFont(self.gameOverFont)
    love.graphics.setColor(self.default_color)
    love.graphics.print(
    self.gameOverText,
    (WIDTH - self.gameOverFont:getWidth(self.gameOverText)) / 2,
    (HEIGHT - self.gameOverFont:getHeight()) / 2)

    love.graphics.setFont(self.messageFont)
    
    love.graphics.print(self.messageText,
    (WIDTH - self.messageFont:getWidth(self.messageText)) / 2,
    (HEIGHT / 2 + 100))
end