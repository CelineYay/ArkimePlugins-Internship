--[[Moonwalking ദ്ദി ꒦ິ꒳꒦ິ )✧]]--
print("\tAutomating & mantaining arkime plugins\t")

--setup JA4+ 
local plugined_content
local JA4urlAMD = "\"https://github.com/arkime/arkime/releases/download/v5.4.0/ja4plus.amd64.so\""
local JA4urlARM = "\"https://github.com/arkime/arkime/releases/download/v5.4.0/ja4plus.arm64.so\""

--Check kernel architecture to download
function kernal_Architecture_check()
	download = "sudo wget  -P /opt/arkime/plugins "
	handle = io.popen("uname -m")
	result = handle:read("*a")
	print("Running "..result)
	handle:close()
	handle = io.popen("whoami")
	user = handle:read("*l")
	handle:close()
	handle = io.popen("id -gn")
	group = handle:read("*l")
	handle:close()
	print(user..":"..group)
	if (string.find(result, "x86_64")~=nil) then
		-- AMD
		os.execute(download..JA4urlAMD)
		os.execute("sudo chown " .. user .. ":" .. group .. " /opt/arkime/plugins/ja4plus.amd64.so")
		os.execute("chmod u+rwx /opt/arkime/plugins/ja4plus.amd64.so")
	elseif (string.find(result, "aarch64")~=nil) or (string.find(result, "arm64")~=nil) then
		-- ARM
		os.execute(download..JA4urlARM)
		os.execute("sudo chown " .. user .. ":" .. group .. " /opt/arkime/plugins/ja4plus.arm64.so")
		os.execute("chmod u+rwx /opt/arkime/plugins/ja4plus.arm64.so")
	else
		print("invalid system architecture")
	end
end

-- Main
print("Are you using the Arkime 5.4.0 [Yes/No]")
choice = io.read("*l")
if choice == "Yes" then
	print("Lua setting up ja4+ plugin")
	kernal_Architecture_check()
	-- TODO split architecture & downloading as functions
elseif choice == "No" then
	-- update Arkime
	print("updating Arkime")
	-- TODO
else
	print("Quit")
end

