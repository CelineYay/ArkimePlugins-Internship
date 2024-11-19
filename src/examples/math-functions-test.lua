local lu = require("luaunit")
local MathFunctions = require("examples/math-functions")

local TestMath = {}

function TestMath:test1()
	lu.assertEquals(MathFunctions.add(1,2), 3)
end

function TestMath:test2()
	lu.assertEquals(MathFunctions.add(-65,5), -60)
end

function TestMath:test3()
	lu.assertEquals(MathFunctions.add(4,0), 4)
end

return TestMath
