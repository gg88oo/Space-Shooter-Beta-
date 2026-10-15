Menu = Class{}

function Menu:init()
    self.background = menu_background
    self.menuFont = love.graphics.newFont("fonts/Orbitron-VariableFont_wght.ttf", 40)
    self.texts = {"START", "QUIT"}
    self.selected_color =  {1, 0.65, 0.2, 1}
    self.default_color = {0.35, 0.85, 1}
    self.selected = 1
    self.spacing = 55
end

function Menu:keyreleased(key)
    if key == "w" and self.selected > 1 then
        score:clone():play()
        self.selected = self.selected - 1
    elseif key == "s" and self.selected < #self.texts then
        score:clone():play()
        self.selected = self.selected + 1
    elseif key == "return" and self.selected == 1 then
        -- change state to playing
        states:change_state(2)
    elseif key == "return" and self.selected == 2 then
        -- quit the game
        love.event.quit() 
    end
end

function Menu:update(dt)
end

function Menu:render()
    love.graphics.draw(self.background,0,0)
    love.graphics.setFont(self.menuFont)
    print(self.selected)
    for index, text in ipairs(self.texts) do
        if index == self.selected then
            love.graphics.setColor(self.selected_color)
            love.graphics.printf(text, 0, HEIGHT / 2 + self.spacing * index, WIDTH, "center")
        else 
            love.graphics.setColor(self.default_color)
            love.graphics.printf(text, 0, HEIGHT / 2 + self.spacing * index, WIDTH, "center")
        end
    end
    
    love.graphics.setColor(1, 1, 1)

end