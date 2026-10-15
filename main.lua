
Class = require 'class'

require 'Craft'
require 'Shot'
require 'Enemy'
require 'Enemies'
require 'Background'
require 'MachineStates'
require 'states/Playing'
require 'states/Menu'
require 'states/Count'
require 'states/Game_over'


WIDTH = 1228
HEIGHT = 720


DEFAULT_width = 100
DEFAULT_height = 40
DEFAULT_x = (WIDTH / 2) - (DEFAULT_width / 2)
DEFAULT_y = HEIGHT - (DEFAULT_height * 3)
DEFAULT_speed = 300

local timer = 0

function love.load()
    love.window.setMode(WIDTH, HEIGHT, {resizable=true, vsync=0, minwidth=400, minheight=300})
    
    --loading images
    craft_image = love.graphics.newImage('images/craft.png')
    craft_image:setFilter("nearest", "nearest")
    shot_image = love.graphics.newImage('images/shot.png')
    background_image = love.graphics.newImage('images/background.png')
    menu_background = love.graphics.newImage('/images/menu_background.png')
    background = Background(background_image, 50)

    -- loading the sounds
    game_music = love.audio.newSource("sounds/8bit_music.mp3", "static")
    shooting = love.audio.newSource("sounds/shot.wav", "static")
    destroyed = love.audio.newSource("sounds/explosion.wav", "static")
    score = love.audio.newSource("/sounds/score.wav", "static")

    -- loading game states
    menu = Menu()
    count = Count()
    playing = Playing()
    game_over = Game_over()
    states = MachineStates()

    states:add_state(menu)
    states:add_state(count)
    states:add_state(playing)
    states:add_state(game_over)

end

function love.keyreleased(key)
    states:keyreleased(key)
end

function love.update(dt)
    states:update(dt)
end

function love.draw()
    states:render()
    game_music:play()
end