local lib = require('qlib')

local h = lib.MinHeap.new()

local STEPS = 1000

local rands = {}
for _ = 1, STEPS do
   local rand = math.floor(math.random() * 10 * STEPS)
   h:insert(rand, rand)
   table.insert(rands, rand)
end

table.sort(rands)

for i = 1, STEPS do
   local popped = h:pop()
   assert(popped == rands[i])
end
