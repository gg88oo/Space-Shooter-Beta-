Craft = Class{}


function Craft:init(x,y,width,height,color,speed,image,health)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.color = color
    self.speed = speed
    self.image = image
    self.health = health
    self.cooldown = 0
    self.menuFont = love.graphics.newFont("fonts/Orbitron-VariableFont_wght.ttf", 20)
    self.shots = {}

end

function Craft:move(key, dt)
   if key == "a" then
      -- move to the right
      self.x = self.x - self.speed * dt
   elseif key == "d" then
      -- move to the left
      self.x = self.x + self.speed * dt
   end
end


function Craft:render()
    --love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    
    local scaleX = self.width / self.image:getWidth()
    local scaleY = self.height / self.image:getHeight()
    love.graphics.draw(
      self.image,
      self.x, 
      self.y,
      0,
      scaleX,
      scaleY,
      self.width,
      self.height
  )
  -- draw the health
  love.graphics.setColor({0.35, 0.85, 1})
  love.graphics.setFont(self.menuFont)
  love.graphics.print(self.health, 20, 20)
  love.graphics.setColor(1, 1, 1)
end

-- render craft shots
function Craft:render_craft_shots()
   for index, shot in ipairs(self.shots) do
      shot:render()
      --print(index)
  end
end

-- update craft shots
function Craft:update_shots(dt)
   if self.cooldown > 0 then
      self.cooldown = self.cooldown - dt   -- count down every frame
   end
   for index, shot in ipairs(self.shots) do
      shot:update(dt)
   end
end

-- check craft's shots collecsiton with the enemis
function Craft:check_collision(enemies)
   -- loop throught out all the of the shots and for each you have to check every enemy, 
   -- only check a shot with the enemeis list if the y close to 80
   for index, shot in ipairs(self.shots) do
      -- loop thoguht the enemeis list and check if the shot colleds
      for e_index, enemy in ipairs(enemies.enemies) do
         if shot:collision(enemy) == true then
            -- if the collede, remove the shot and apply the damage
            enemy.health = enemy.health - shot.damage
            table.remove(self.shots, index)
            break
         end
      end
   end
end

-- removing the shots
function Craft:check_remove()
   for index, shot in ipairs(self.shots) do
      if shot.y < 0 and shot.direction == 'up' then
         table.remove(self.shots, index)
      elseif shot.y > HEIGHT and direction == 'down' then
         table.remove(self.shots, index)
      end
   end
end   

function Craft:am_i_destroyed()
   if self.health <= 0 then
      destroyed:clone():play()
      return true
   end
   return false
end
 
function Craft:shot()
   if self.cooldown <= 0 then
      local new_shot_object = Shot(
      'up',
      DEFAULT_speed,
      20,
      self.x + 20,
      self.y, --craft_1.y,
      shot_image,
      40,
      30
      )
      table.insert(self.shots, new_shot_object)
      shooting:play()
      self.cooldown = 1
   end
   
end