local component = require("component")
local gpu = component.gpu
local keyboard = require("keyboard")

local UP = 0
local DOWN = 1
local LEFT = 2
local RIGHT = 3

local x = 10
local y = 10
local dir = RIGHT

gpu.setForeground(0x000000)
gpu.setBackground(0xFFFFFF)

while true do
  os.sleep(0.1)
  if keyboard.isControlDown() and keyboard.isKeyDown(keyboard.keys.c) then
    break
  end

  gpu.fill(x,y," ")
  if keyboard.isKeyDown(keyboard.keys.w) then
    dir = UP
  elseif keyboard.isKeyDown(keyboard.keys.s) then
    dir = DOWN
  elseif keyboard.isKeyDown(keyboard.keys.a) then
    dir = LEFT
  elseif keyboard.isKeyDown(keyboard.keys.d) then
    dir = RIGHT
  end

  if dir == UP then
    y = y-1
  elseif dir == DOWN then
    y = y+1
  elseif dir == LEFT then
    x = x-1
  elseif dir == RIGHT then
    x = x+1
  end

  gpu.fill(x,y,"X")
end
