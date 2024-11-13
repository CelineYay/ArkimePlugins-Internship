-- function_testluaunit.lua
-- /home/celinechan/Desktop/Repo/ArkimePlugins-Internship/function_testluaunit.lua
local version = _VERSION:match("%d+%.%d+")

package.path = "lua_modules/share/lua/" .. version ..
    "/?.lua;lua_modules/share/lua/" .. version .. "/?/init.lua;" ..
    package.path .. ";src/?.lua"
package.cpath = "lua_modules/lib/lua/" .. version .. "/?.so;" .. package.cpath

lu = require "luaunit"
math_functions = require("math_functions")

function Test1()
  lu.assertEquals(math_functions.add(3,5), 8)
end

os.exit(lu.LuaUnit.run())
--print(lu.assertEquals(math_functions.add(3, 5),8))
