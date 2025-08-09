package.path = package.path .. ';./libs/?.lua'

--- @param mod string
local function test_module(mod)
   print(string.format("Running test '%s'...", mod))
   require(mod)
end

local function run_tests()
   test_module('tests.heap')
   test_module('tests.vec3')
   test_module('tests.qlib')
   print('Tests ok!')
end

run_tests()
