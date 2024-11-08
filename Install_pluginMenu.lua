[[--
Purpose: Menu to allow user to configure & install any requirements for Arkime plugins (currently JA4+)

Mantainence:
If newer Arkime versions avalible, change:
	M1. Arkime version check for (currently Arkime v5.4.0)
	M2. links for downloading additional files (plugin functions)
--]]
-- (M1) Arkime Version
okV = "arkime-capture 5.4.0"
-- (M2) Download links
local JA4urlAMD = "\"https://github.com/arkime/arkime/releases/download/v5.4.0/ja4plus.amd64.so\""
local JA4urlARM = "\"https://github.com/arkime/arkime/releases/download/v5.4.0/ja4plus.arm64.so\""

-- {Plugin Functions} --
-- JA4+ plugin function
function install_Ja4(ktype, pastplugin)
	download = "sudo wget  -P /opt/arkime/plugins "
	if ktype:find("x86_64") ~= nil then
		-- AMD download & permissions
		os.execute(download..JA4urlAMD)
		os.execute("sudo chown " .. user .. ":" .. group .. " /opt/arkime/plugins/ja4plus.amd64.so")
		os.execute("chmod u+rwx /opt/arkime/plugins/ja4plus.amd64.so")
		-- write
		-- Restart
		-- check success
	elseif ktype:find("aarch64") ~= nil then
		-- ARM download & permissions
		os.execute(download..JA4urlARM)
		os.execute("sudo chown " .. user .. ":" .. group .. " /opt/arkime/plugins/ja4plus.arm64.so")
		os.execute("chmod u+rwx /opt/arkime/plugins/ja4plus.arm64.so")
		-- write
		-- Restart
		-- check success
	else
		print("No compatible Ja4+ plugin avalible to download")
	end
end
-- {I/O Functions} --
-- Write plugin line function TODO

-- Read plugin line function TODO

-- {Main} --
-- Check Arkime version (M1)
userVersion = --boolean TODO

-- Get kernel type (ktype [AMD/ARM/nil])
handle = io.popen("uname -m")
ktype = handle:read("*a")
handle:close()
print("Running "..ktype)
	
-- Get user & usergroup
handle = io.popen("whoami")
user = handle:read("*l")
handle:close()
handle = io.popen("id -gn")
group = handle:read("*l")
handle:close()
print(user..":"..group)

-- Check & get plugin line
validpluginLine = -- boolean TODO
pastplugin = -- string TODO

-- Menu TODO
if userV == okV then
	print("Choose a plugin to install:\n0.Quit\n1.All of the below\n2.Ja4+")
	choice = io.read("*n")
	if choice == 1 then
		--TODO
	elseif choice == 2 then
		install_Ja4(ktype, pastplugin)
	else
		print("Error: plugin unsuccessful")
	end
else
	print("ERROR: code not compactable; unable to install plugins\nplease update your "..userV.." Arkime to "..okV)
end

-- Written by Celine :)
