--[[while true do
	print("Hi: ")
	name = io.read("*l")
	if name == "cc" then
		print("Nice to meet u, CC")
	elseif name == "no" then
		break
	end
end]]--

while true do

	-- Ask user to input
	print("\n1.Arkime status \n2.Clear &/ upload file \n3.Live Capture \n4.save captured files to dir\n0.Quit\nenter number: ")
	choice = io.read("*n")

	-- status
	if choice == 1 then
		print("Ctrl+C to esc to next status")
		os.execute("systemctl status arkimeviewer")
		-- auto ctrl+c
		--local pid = 102169
		-- os.execute("kill -2 " .. pid)
		os.execute("systemctl status arkimecapture")
		-- os.execute("kill -2 " .. 27842)
	elseif choice == 2 then
		print("Enter Pcap file dir:")
		io.read()
		local file = io.read("*l")
	
		print("Wipe current data? 1.YES, 0.NO: ")
		wipe = io.read("*n")
		if wipe == 1 then
			os.execute("sudo systemctl stop arkimecapture")
			os.execute("sudo systemctl stop arkimeviewer")
			os.execute("/opt/arkime/db/db.pl http://127.0.0.1:9200 wipe")
			os.execute("sudo /bin/rm -f /opt/arkime/raw/*")
			os.execute("sudo systemctl restart arkimeviewer")
		else
		end
		local configfileCMD = "/opt/arkime/bin/capture -c /opt/arkime/etc/config.ini -r " .. file
		os.execute(configfileCMD)
	elseif choice == 3 then
		print("Chose Arkime capture 1.ON, 0.OFF: ")
		capStart = io.read("*n")
		if capStart == 1 then
			os.execute("systemctl restart arkimecapture")
		elseif capStart == 0 then
			os.execute("systemctl stop arkimecapture")
		else
			print("Invalid input")
		end
	-- Enter 0 to quit loop
	elseif choice == 0 then 
		break
	end
end
-- specific pcap file only
-- Live capture start / stop
-- clear raw
-- save current captured pcaps to file

-- Running a simple terminal command
-- print("Setting up arkime")
-- os.execute("sudo yum update -y")
-- os.execute("")

-- Capturing the output of a terminal command
--print("\nVersion ")
--local handle = io.popen("uname -r")
--local result = handle:read("*a")
--handle:close()
--print(result)
