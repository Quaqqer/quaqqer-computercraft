--- @class Vec3
--- @field x integer
--- @field y integer
--- @field z integer
local Vec3 = {}

--- @param x integer
--- @param y integer
--- @param z integer
--- @return Vec3
function Vec3:new(x, y, z)
   local obj = {}
   obj.x = x
   obj.y = y
   obj.z = z
   setmetatable(obj, self)
   return obj
end

--- @return string
function Vec3:__tostring()
   return string.format('(%d, %d, %d)', self.x, self.y, self.z)
end

--- @param other Vec3
--- @return Vec3
function Vec3:add(other)
   return Vec3:new(self.x + other.x, self.y + other.y, self.z + other.z)
end

--- @return Vec3
function Vec3:neg()
   return Vec3:new(-self.x, -self.y, -self.z)
end

--- @param other Vec3
--- @return Vec3
function Vec3:sub(other)
   return self:add(other:neg())
end

--- @param other Vec3
--- @return boolean
function Vec3:eq(other)
   return self.x == other.x and self.y == other.y and self.z == other.z
end

return Vec3
