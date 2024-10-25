-- TODO test file & case5.ini
--[[
cases:
1 	commented 	--> no plugins 		(# plugins=)
2	notcommented 	--> existing plugins 	(plugins= blaaa)
3	multiple 	--> too many err  	(plugins= plugins=) ?!
4	non existent 	--> no plugin line err	()
5	installed	--> plugined already	(plugins = ja4plus.so)

#testing testing
# plugins = testing 
plugins = teehehe
#another one\nanother
]]--

-- Open Configuration file
-- TODO file = io.open("/opt/arkime/etc/config.ini","rb")
file = io.open("/home/celinechan/Desktop/Repo/ArkimePlugins-Internship/case1.ini", "rb") -- test sample


-- Read Configuration file
og_content = file:read("*all")
file:close()

-- check "plugin=" count
if string.find(og_content, "\n[^#]*%s*plugins%s*=")~=nil then
	-- plugins= already exists
	edited, count = string.gsub(og_content,"\n[^#]*%s*plugins%s*=", "\nplugins = ja4plus.so;")
	if count>1 then
		print("Error multiple instances of plugins declared!")
		edited = og_content
	elseif string.find(og_content, "\n[^#]*%s*plugins%s*=%s%a;?ja4plus.so")~=nil then
		print("Plugin already installed")
		edited = og_content	
	end	
else
	if string.find(og_content, "\n[#]*%s*plugins%s*=")~=nil then
		edited, count = string.gsub(og_content,"\n[#]*%s*plugins%s*=", "\nplugins = ja4plus.so;")
	else
		print("Error missing plugins declaration line")
		edited = og_content
	end
		
end


-- Write to configuration file
-- TODO rancase directory file to config
file = io.open("/home/celinechan/Desktop/Repo/ArkimePlugins-Internship/rancase.ini", "wb")
file:write(edited)

-- Save & close configuration file
file:close()
