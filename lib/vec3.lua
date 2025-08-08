--- @class Vec3
--- @field x integer
--- @field y integer
--- @field z integer
--- @operator add(Vec3): Vec3
--- @operator sub(Vec3): Vec3
--- @operator unm: Vec3
local Vec3 = {}
Vec3.__index = Vec3

--- @param x integer
--- @param y integer
--- @param z integer
--- @return Vec3
function Vec3.new(x, y, z)
   local obj = {}
   obj.x = x
   obj.y = y
   obj.z = z
   setmetatable(obj, Vec3)
   return obj
end

Vec3.ZERO = Vec3.new(0, 0, 0)
Vec3.DOWN = Vec3.new(0, -1, 0)
Vec3.UP = Vec3.new(0, 1, 0)
Vec3.NORTH = Vec3.new(0, 0, -1)
Vec3.EAST = Vec3.new(1, 0, 0)
Vec3.SOUTH = Vec3.new(0, 0, 1)
Vec3.WEST = Vec3.new(-1, 0, 0)

--- @return string
function Vec3:__tostring()
   return string.format('(%d, %d, %d)', self.x, self.y, self.z)
end

--- @param other Vec3
--- @return Vec3
function Vec3:__add(other)
   return Vec3.new(self.x + other.x, self.y + other.y, self.z + other.z)
end

--- @return Vec3
function Vec3:__unm()
   return Vec3.new(-self.x, -self.y, -self.z)
end

--- @param other Vec3
--- @return Vec3
function Vec3:__sub(other)
   return self + -other
end

--- @param other Vec3
--- @return boolean
function Vec3:__eq(other)
   return self.x == other.x and self.y == other.y and self.z == other.z
end

--- @return Vec3
function Vec3:rot_left()
   return Vec3.new(self.z, self.y, -self.x)
end

--- @return Vec3
function Vec3:rot_right()
   return Vec3.new(-self.z, self.y, self.x)
end

return Vec3
