local Vec3 = require('lib.vec3')

-- Test addition
local v0 = Vec3.new(0, 0, 0)
assert(tostring(v0) == '(0, 0, 0)')
v0 = v0 + Vec3.new(1, 2, 3)
assert(tostring(v0) == '(1, 2, 3)')
v0 = v0 + Vec3.new(1, 2, 3)
assert(tostring(v0) == '(2, 4, 6)')

-- Test equality
assert(v0 == Vec3.new(2, 4, 6))
assert(v0 ~= Vec3.new(1, 4, 6))

-- Test negation
assert(tostring(-v0) == '(-2, -4, -6)')

-- Test subtraction
assert(tostring(Vec3.new(0, 0, 0) - v0) == '(-2, -4, -6)')

-- Test parsing of vectors
assert(Vec3.parse(tostring(v0)) == v0)
assert(Vec3.parse('(0, 0, 0)') == Vec3.new(0, 0, 0))
assert(Vec3.parse('(3, 2, 1)') == Vec3.new(3, 2, 1))
assert(Vec3.parse('(100, -13, 047)') == Vec3.new(100, -13, 47))
assert(Vec3.parse('(1, 1, 1)') == Vec3.new(1, 1, 1))
assert(Vec3.parse('(-1, -1, -1)') == Vec3.new(-1, -1, -1))
