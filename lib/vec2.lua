--- @class Vec2
--- @field x integer
--- @field y integer
local Vec2 = {}

--- @param x integer
--- @param y integer
--- @return Vec2
function Vec2:new(x, y)
   local obj = {}
   obj.x = x
   obj.y = y
   setmetatable(obj, self)
   return obj
end

--- @return string
function Vec2:__tostring()
   return string.format('(%d, %d, %d)', self.x, self.y)
end

--- @param other Vec2
--- @return Vec2
function Vec2:add(other)
   return Vec2:new(self.x + other.x, self.y + other.y)
end

--- @return Vec2
function Vec2:neg()
   return Vec2:new(-self.x, -self.y)
end

--- @param other Vec2
--- @return Vec2
function Vec2:sub(other)
   return self:add(other:neg())
end

--- @return Vec2
function Vec2:rot_right()
   return Vec2:new(self.y, -self.x)
end

--- @return Vec2
function Vec2:rot_left()
   return Vec2:new(-self.y, self.x)
end

--- @param other Vec2
--- @return boolean
function Vec2:eq(other)
   return self.x == other.x and self.y == other.y
end

return Vec2
