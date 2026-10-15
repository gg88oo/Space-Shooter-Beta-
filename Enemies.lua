Enemies = Class{}

function Enemies:init()
    self.enemies = {}
end

function Enemies:render()
    for index, enemy in ipairs(self.enemies) do
        enemy:render()
    end
end

function Enemies:spawn_formation()
    local starting_x = 100
    local spacing = 20
    local max_enemies_per_lines = math.floor(1228 / (100 + spacing)) - 1

    
    for i = 1, max_enemies_per_lines do
        -- calculate the negative y, so that the enemeies are gonna first be spawend outside of the screen
        local negative_y = -DEFAULT_height

        -- calculate the next x
        local next_x = (DEFAULT_width + spacing) * i
        -- now start adding enemies to the list
        self:add_enemy(next_x, negative_y)

    end
end

function Enemies:update(dt)
    local max_y_to_update = DEFAULT_height + 40

    -- only update the y if it hasn't reached the max
    -- before anything check if self.eneimeis is empty
    if #self.enemies ~= 0 then
        local current_y = self.enemies[1].y
        if current_y < max_y_to_update then
            for index, enemy in ipairs(self.enemies) do
                enemy.y = enemy.y + 10 * dt
            end
        end
    end
end

function Enemies:render_shots()
    for index, enemy in ipairs(self.enemies) do
        enemy:render_craft_shots()
    end
end

function Enemies:update_shots(dt)
    for index, enemy in ipairs(self.enemies) do
        enemy:update_shots(dt)
    end
end
-- shoot
function Enemies:shot(player_craft, shot_image)
    for index, enemy in ipairs(self.enemies) do
        enemy:shoot(player_craft, shot_image)
    end
end

-- check if dead and remove
function Enemies:check_remove()
    for index, enemy in ipairs(self.enemies) do
        if enemy.health <= 0 then
            -- remove from the list
            destroyed:clone():play()
            table.remove(self.enemies, index)
        end
    end
end

function Enemies:add_enemy(x,y)
    local shots = {}
    local new_enemy = Enemy(
        x,
        y,
        DEFAULT_width,
        DEFAULT_height,
        "red",
        200,
        craft_image,
        100,
        shots
    )
    table.insert(self.enemies, new_enemy)
end

function Enemies:check_if_destroyed()
    if #self.enemies == 0 then
        -- spawn a new formation
        self:spawn_formation()
        print("new formation has been added")
    end
end

function Enemies:check_if_player_is_hit(player_craft)
    for index, enemy in ipairs(self.enemies) do
        enemy:check_collesion(player_craft)
    end
end