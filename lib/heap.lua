--- @param i number
--- @return number
local function parent(i)
   return math.ceil((i - 1) / 2)
end

--- @param i number
--- @return number
local function child_left(i)
   return i * 2
end

--- @param i number
--- @return number
local function child_right(i)
   return i * 2 + 1
end

--- @param heap MinHeap
--- @param a integer
--- @param b integer
local function swap(heap, a, b)
   -- Swap them
   local temp = heap.__entries[a]
   heap.__entries[a] = heap.__entries[b]
   heap.__entries[b] = temp
end

--- @generic T
--- @class MinHeap<T>
--- @field __entries { value: T, priority: number }[]
--- A min heap
local MinHeap = {}
MinHeap.__index = MinHeap

--- @return MinHeap
function MinHeap.new()
   local obj = {}
   obj.__entries = {}
   setmetatable(obj, MinHeap)
   return obj
end

--- @generic T
--- @param priority number
--- @param value T
function MinHeap:insert(priority, value)
   table.insert(self.__entries, { priority = priority, value = value })

   local i = #self.__entries
   while i > 1 and self.__entries[i].priority < self.__entries[parent(i)].priority do
      swap(self, i, parent(i))
      i = parent(i)
   end
end

--- @generic T
--- @return T?
function MinHeap:pop()
   if #self.__entries == 0 then
      return nil
   end

   -- Swap last and first
   local value = self.__entries[1].value
   self.__entries[1] = self.__entries[#self.__entries]
   table.remove(self.__entries)

   -- Sift first down
   local i = 1
   while child_left(i) <= #self.__entries do
      local prio = self.__entries[i].priority
      local li = child_left(i)
      local ri = child_right(i)
      local l = self.__entries[li]
      local r = self.__entries[ri]

      if r ~= nil and r.priority < l.priority and r.priority < prio then
         swap(self, i, ri)
         i = ri
      elseif l.priority < prio then
         swap(self, i, li)
         i = li
      else
         break
      end
   end

   return value
end

--- @generic T
--- @return T?
function MinHeap:top()
   if #self.__entries == 0 then
      return nil
   end

   return self.__entries[1]
end

--- @return boolean
function MinHeap:empty()
   return #self.__entries == 0
end

return MinHeap
