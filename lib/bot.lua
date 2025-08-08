local Vec3 = require('lib.vec3')

--- @class Bot
--- @field __pos Vec3
--- @field __dir Vec3
local Bot = {}
Bot.__index = Bot

--- @param pos Vec3
--- @param dir Vec3
--- @return Bot
function Bot.new(pos, dir)
   local o = { __pos = pos, __dir = dir }
   o.__pos = pos
   o.__dir = dir
   setmetatable(o, Bot)
   return o
end

function Bot:go_forward()
   local success, error = turtle.forward()
   if success then
      self.__pos = self.__pos + self.__dir
   end
   return success, error
end

function Bot:go_down()
   local success, error = turtle.down()
   if success then
      self.__pos = self.__pos + Vec3.DOWN
   end
   return success, error
end

function Bot:go_up()
   local success, error = turtle.up()
   if success then
      self.__pos = self.__pos + Vec3.UP
   end
   return success, error
end

--- Rotate the bot left
function Bot:rotate_left()
   local success, error = turtle.turnLeft()
   if success then
      self.__dir = self.__dir:rot_left()
   end
   return success, error
end

--- Rotate the bot right
function Bot:rotate_right()
   local success, error = turtle.turnRight()
   if success then
      self.__dir = self.__dir:rot_right()
   end
   return success, error
end

--- Rotate to face a direction.
---
--- @param dir Vec3
function Bot:rotate_to(dir)
   if dir.y ~= 0 then
      error('Cannot face up/down')
   end

   if self.__dir == dir then
   elseif self.__dir == -dir then
      self:rotate_left()
      self:rotate_left()
   elseif dir == self.__dir:rot_left() then
      self:rotate_left()
   else
      self:rotate_right()
   end
end

--- Walk in a direction with the bot.
---
--- @param dir Vec3
function Bot:go_direction(dir)
   if dir == Vec3.DOWN then
      self:go_down()
   elseif dir == Vec3.UP then
      self:go_up()
   else
      self:rotate_to(dir)
      self:go_forward()
   end
end

--- @alias Side "left" | "right"

--- @param side? Side
function Bot:dig_forward(side)
   return turtle.dig(side)
end

--- @param side? Side
function Bot:dig_down(side)
   return turtle.digDown(side)
end
---
--- @param side? Side
function Bot:dig_up(side)
   return turtle.digUp(side)
end

--- @param width integer
--- @param height integer
--- @param depth integer
function Bot:dig_perimeter(width, height, depth)
   for y = 1, height do
      self:dig_down()
      self:go_direction(Vec3.DOWN)

      for x = 1, width do
         for z = 1, depth - 1 do
            self:rotate_to(Vec3.SOUTH)
            self:dig_forward()
            self:go_forward()
         end

         for z = 1, depth - 1 do
            self:go_direction(Vec3.NORTH)
         end

         if x ~= width then
            self:rotate_to(Vec3.EAST)
            self:dig_forward()
            self:go_forward()
         else
            for x2 = 1, width - 1 do
               self:go_direction(Vec3.WEST)
            end
         end
      end
   end
end

return Bot
