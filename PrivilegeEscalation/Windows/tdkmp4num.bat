@echo off
echo.
echo [45m[+] Windows Privilege Escalation Enumeration Script by tdkmp4n4[0m
echo.
echo.
for %%i in (powershell.exe) do if "%%~$path:i"=="" (
	echo [32m[+] PowerShell not available. Enumerating using MS-DoS commands[0m
	echo.
	echo.
	echo [+] Enumerating current user
	whoami /all
	echo.
	echo.
	echo [+] Enumerating hostname
	echo.
	hostname
	echo.
	echo.
	echo [+] Enumerating local users
	net user
	echo.
	echo.
	echo [+] Enumerating system information
	systeminfo
	echo.
	echo.
	echo [+] Enumerating non-system32 service paths
	echo.
	wmic service get DisplayName,State,PathName,StartName | findstr /i /v "system32"
	echo.
	echo.
	echo [+] Enumerating running processes
	tasklist /SVC
	echo.
	echo.
	echo [+] Enumerating network information
	ipconfig /all
	echo.
	echo.
	echo [+] Enumerating routing information
	echo.
	route print
	echo.
	echo.
	echo [+] Enumerating active connections
	netstat -ano
	echo.
	echo.
	echo [+] Enumerating firewall status
	netsh advfirewall show currentprofile
	echo.
	echo.
	echo [+] Enumerating scheduled tasks
	echo.
	schtasks /query /fo LIST | findstr TaskName
	echo.
	echo.
	echo [+] Enumerating processes and owner
	echo.
	tasklist /V
	echo.
	echo.
	echo [+] Enumerating installed applications and patch levels
	echo.
	wmic product get name,version,vendor
	wmic qfe get caption,description,hotfixid,installedon
	echo.
	echo.
	echo [+] Enumerating world-writable files
	echo.
	echo [-] PowerShell not available. Transfer accesschk.exe and issue 'accesschk.exe -uws "Everyone" "C:\Program Files"'
	echo.
	echo.
	echo [+] Enumerating unmounted disks
	echo.
	mountvol
	echo.
	echo.
	echo [+] Enumerating device drivers and kernel modules
	echo.
	echo [-] PowerShell not available. Try 'drivequery.exe /v /fo csv
	echo.
	echo.
	echo [+] Enumerating binaries that autoelevate
	echo.
	reg query HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Installer
	reg query HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Installer
	echo.
	echo.

) else (
	echo [32m[+] PowerShell available. Enumerating using PowerShell[0m
	echo.
	echo.
	echo [+] Enumerating current user
	whoami /all
	echo.
	echo.
	echo [+] Enumerating hostname
	echo.
	hostname
	echo.
	echo.
	echo [+] Enumerating local users
	net user
	echo.
	echo.
	echo [+] Enumerating system information
	systeminfo
	echo.
	echo.
	echo [+] Enumerating non-system32 service paths
	powershell.exe -Command "Get-WmiObject win32_service | select DisplayName, State, PathName, StartName | ?{$_.PathName -NotLike '*system32*'}"
	echo.
	echo.
	echo [+] Enumerating running processes
	tasklist /SVC
	echo.
	echo.
	echo [+] Enumerating network information
	ipconfig /all
	echo.
	echo.
	echo [+] Enumerating routing information
	echo.
	route print
	echo.
	echo.
	echo [+] Enumerating active connections
	netstat -ano
	echo.
	echo.
	echo [+] Enumerating firewall status
	netsh advfirewall show currentprofile
	echo.
	echo.
	echo [+] Enumerating scheduled tasks
	echo.
	schtasks /query /fo LIST | findstr TaskName
	echo.
	echo.
	echo [+] Enumerating processes and owner
	powershell.exe -Command "Get-WmiObject Win32_Process | Select Name, @{Name='UserName';Expression={$_.GetOwner().Domain+'\'+$_.GetOwner().User}} | Sort-Object UserName, Name"
	echo.
	echo.
	echo [+] Enumerating installed applications and patch levels
	echo.
	wmic product get name,version,vendor
	wmic qfe get caption,description,hotfixid,installedon
	echo.
	echo.
	echo [+] Enumerating world-writable files
	powershell.exe -Command "Get-ChildItem 'C:\Program Files' -Recurse | Get-ACL | ?{$_.AccessToString -Match 'Everyone\sallow \s\smodify'}"
	echo.
	echo.
	echo [+] Enumerating unmounted disks
	echo.
	mountvol
	echo.
	echo.
	echo [+] Enumerating device drivers and kernel modules
	powershell.exe -Command "Get-WmiObject Win32_PnPSignedDriver | Select-Object DeviceName,DeviceVersion,Manufacturer | Where-Object {$_.Manufacturer -NotLike '(Standard system devices)'}"
	echo.
	echo.
	echo [+] Enumerating binaries that autoelevate
	echo.
	reg query HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Installer
	reg query HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Installer
	echo.
	echo.
)

