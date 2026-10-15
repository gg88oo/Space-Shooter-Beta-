Enemy = Class{}

function Enemy:init(x,y,width,height,color,speed,image,health,shots)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.color = color
    self.speed = speed
    self.image = image
    self.health = health
    self.shots = shots
end

function Enemy:shoot(player_craft, shot_image)
    if self.x >= player_craft.x and self.x <= (player_craft.x + DEFAULT_width) or 
    (self.x + DEFAULT_width) >= player_craft.x and (self.x + DEFAULT_width) <= (player_craft.x + DEFAULT_width) then

    -- make the craft shot cuz it's in range
        local new_shot_object = Shot(
           'down',
           DEFAULT_speed,
           20,
           self.x,
           self.y,
           shot_image,
           40,
           30
       )
       shooting:clone():play()
       table.insert(self.shots, new_shot_object)
    end 
end

function Enemy:render_craft_shots()
    for index, shot in ipairs(self.shots) do
        shot:render()
    end
end

function Enemy:render()
    local scaleX = self.width / self.image:getWidth()
local scaleY = self.height / self.image:getHeight()

love.graphics.draw(
    self.image,
    self.x + self.width,
    self.y + self.height,
    0,
    -scaleX,
    -scaleY
)
end

function Enemy:check_collesion(craft)
    for index, shot in ipairs(self.shots) do
        if shot:collision(craft) == true then
            craft.health = craft.health - shot.damage
            table.remove(self.shots, index)
            break
        end
    end
end

function Enemy:update_shots(dt)
    for index, shot in ipairs(self.shots) do
        shot:update(dt)
    end
end