local M = {}

--- @param s string
--- @param split string
function M.split(s, split)
   local parts = {}
   for i, sub in string.gmatch(s, split) do
      parts[i] = sub
   end
   return parts
end

--- @generic T
--- @generic U
--- @param f fun(v: T): U
--- @param array T[]
--- @return U[]
function M.map(f, array)
   local new = {}
   for i, v in ipairs(array) do
      new[i] = f(v)
   end
   return new
end

M.Vec3 = require('lib.vec3')
M.Vec2 = require('lib.vec2')
M.MinHeap = require('lib.heap')

return M
