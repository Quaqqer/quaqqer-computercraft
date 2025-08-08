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

--- @param o any
--- @return string
function M.inspect(o)
   if type(o) == 'table' and o[1] ~= nil then
      local parts = {}
      for _, v in ipairs(o) do
         table.insert(parts, M.inspect(v))
      end
      return '[' .. table.concat(parts, ', ') .. ']'
   elseif type(o) == 'table' then
      local parts = {}
      for k, v in pairs(o) do
         table.insert(parts, string.format('%s = %s', tostring(k), M.inspect(v)))
      end
      return '{' .. table.concat(parts, ', ') .. '}'
   elseif type(o) == 'string' then
      return string.format('"%s"', o)
   end

   return tostring(o)
end

return M
