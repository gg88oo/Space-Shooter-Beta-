Playing = Class{}

function Playing:init()
    -- load player craft and enemies list
    self.background = Background(background_image,50)
    self.craft_1 = Craft(
        DEFAULT_x,
        DEFAULT_y,
        DEFAULT_width,
        DEFAULT_height,
        "red",
        200,
        craft_image,
        100
    )
    self.enemies = Enemies()
    self.timer = 0
end

function Playing:keyreleased(key)
    if key == "space" then
        self.craft_1:shot()
    end
end

function Playing:exit()
    -- reset everything to the way it was 
    -- reset play craft health back to 100
    self.craft_1.health = 100
    -- reset player craft postion back to deafult
    self.craft_1.x = DEFAULT_x
    -- empty the list of shots of player craft
    self.craft_1.shots = {}

    -- emtpy the enemies list, alongside the shoots and everything
    self.enemies.enemies = {}

end

function Playing:update(dt)
    -- background
    self.background:update(dt)
    
    -- player craft
    self.craft_1:update_shots(dt)
    self.craft_1:check_remove()
    self.craft_1:check_collision(self.enemies)

    -- player keyboard inputs
    if love.keyboard.isDown("a") then
        self.craft_1:move("a", dt)
    elseif love.keyboard.isDown("d") then
        self.craft_1:move("d", dt)
    end

    -- check if player craft is destored then change the state to game over
    if self.craft_1:am_i_destroyed() == true then
        -- reset the plyare craft score back to 100
        self:exit()
        states:change_state(4)
    end
    
    -- enemies crafts
    self.enemies:update(dt)
    self.enemies:update_shots(dt)
    self.enemies:check_remove()
    self.enemies:check_if_destroyed()
    self.enemies:check_if_player_is_hit(self.craft_1)
    if self.timer >= 2 then
        -- make enemies shot at the target
        self.enemies:shot(self.craft_1, shot_image)
    end

    -- updating the timer
    if self.timer >= 2 then
        self.timer = 0
    end
    self.timer = self.timer + dt
end

function Playing:render()
    self.background:render()
    self.craft_1:render()
    self.craft_1:render_craft_shots()
    self.enemies:render()
    self.enemies:render_shots()
end
