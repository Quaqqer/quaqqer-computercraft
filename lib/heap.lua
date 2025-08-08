--- @param i number
--- @return number
local function parent(i)
   return math.floor((i - 1) / 2) + 1
end

--- @param i number
--- @return number
local function child_left(i)
   return (i - 1) * 2 + 2
end

--- @param i number
--- @return number
local function child_right(i)
   return (i - 1) * 2 + 3
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
   local i = #self.__entries + 1
   self.__entries[i] = { priority = priority, value = value }

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
   table.remove(self.__entries, #self.__entries)

   -- Sift first down
   local i = 1
   while child_left(i) <= #self.__entries do
      local prio = self.__entries[i].priority
      local left_prio = self.__entries[child_left(i)].priority

      if child_right(i) <= #self.__entries then
         local right_prio = self.__entries[child_right(i)].priority

         if right_prio < left_prio then
            if right_prio < prio then
               swap(self, i, child_right(i))
               i = child_right(i)
               goto continue
            else
               return value
            end
         end
      end

      if left_prio < prio then
         swap(self, i, child_left(i))
         i = child_left(i)
      else
         return value
      end

      ::continue::
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
