local M = {}

local Vec3 = require('lib.vec3')
local MinHeap = require('lib.heap')

--- @alias PathStep { type: "turn", dir: "left" | "right" } | { type: "forward" }

--- @alias Path PathStep[]

--- @param pos Vec3
--- @param goal Vec3
--- @param cache WorldCache
--- @return Path
function M.astar_search(pos, goal, cache)
   local q = MinHeap.new()
   local visited = {}
end

return M
