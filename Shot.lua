Shot = Class{}

function Shot:init(direction, speed, damage, x, y,image, width, height)
    self.direction = direction
    self.speed = speed
    self.damage = damage
    self.x = x
    self.y = y
    self.image = image
    self.width = width
    self.height = height
end

function Shot:update(dt)
    if self.direction == 'up' then
        self.y = self.y - self.speed * dt
    elseif self.direction == 'down' then
        self.y = self.y + self.speed * dt
    end
end

function Shot:collision(craft)
    if self.x < craft.x + craft.width          -- shot left is left of craft right
    and self.x + self.width > craft.x          -- shot right is right of craft left
    and self.y < craft.y + craft.height        -- shot top is above craft bottom
    and self.y + self.height > craft.y then    -- shot bottom is below craft top
        return true
    end

    return false
end



function Shot:render()
    --love.graphics.rectangle("fill", self.x, self.y, 10, 10)
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
end

