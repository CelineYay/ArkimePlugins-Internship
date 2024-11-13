-- function_testluaunit.lua
-- /home/celinechan/Desktop/Repo/ArkimePlugins-Internship/function_testluaunit.lua
lu = require "luaunit"
math_functions = require("math_functions")

function Test1()
  lu.assertEquals(math_functions.add(3,5), 8)
end

os.exit(lu.LuaUnit.run())
--print(lu.assertEquals(math_functions.add(3, 5),8))
