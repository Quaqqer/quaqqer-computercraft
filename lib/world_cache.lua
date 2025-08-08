--- @alias BlockData string

--- @class WorldCache
--- @field __entries table<string, BlockData>
local WorldCache = {}
WorldCache.__index = WorldCache

--- @return WorldCache
function WorldCache.new()
   local o = {}
   o.__entries = {}
   setmetatable(o, WorldCache)
   return o
end

--- @param pos Vec3
--- @return BlockData?
function WorldCache:get(pos)
   return self.__entries[tostring(pos)]
end

--- @param pos Vec3
--- @param data BlockData
function WorldCache:set(pos, data)
   self.__entries[tostring(pos)] = data
end

function WorldCache:update_from_t()
   local present, info = turtle.inspect()
   if present then
   end
end

return WorldCache
