Background = Class{}

function Background:init(background_image, speed)
    self.image1 = background_image
    self.speed = speed
    self.image2 = background_image
    self.y1 = -720
    self.y2 = 0 
end

function Background:render()
    local scaleX = 1228 / self.image1:getWidth()
    local scaleY = 720 / self.image1:getHeight()
    
    love.graphics.draw(self.image1, 0, math.floor(self.y1), 0, scaleX, scaleY)
    love.graphics.draw(self.image2, 0, math.floor(self.y2), 0, scaleX, scaleY)
    --love.graphics.draw(self.image1, 0, self.y1)
    --love.graphics.draw(self.image2, 0, self.y2)
end

function Background:update(dt)
    self.y1 = self.y1 + self.speed * dt
    self.y2 = self.y2 + self.speed * dt

    if self.y1 >= 720 then
        self.y1 = self.y2 - 720
    elseif self.y2 >= 720 then
        self.y2 = self.y1 - 720
    end
end