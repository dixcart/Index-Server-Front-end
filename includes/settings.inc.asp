<%
'Config file, with example of using same codebase in multiple offices
Dim SERVER_IP
SERVER_IP = Request.ServerVariables("LOCAL_ADDR")
Select Case  SERVER_IP

'Office 1
Case "172.16.1.1"
	strOfficeName = "My Office 1" 'This is displayed at the top of the results
	SEARCH_CATALOG = "Office_1_index" 'The name you gave the index when you created it
	strDriveLetter = "x:/documents/" 'The path on the server to your documents, this will be replaced with...
	strServerName = "server-01/"  'The name of the server/share that you access your documents through

'Office 2
Case "172.16.20.22"
	strOfficeName = "My Second Office"
	SEARCH_CATALOG = "Idnex_in_Office_2"
	strDriveLetter = "x:/data/document/"
	strServerName = "different-server-name/"

End Select

'ONLY REAL CONSTANT BETWEEN OFFICES:
CONST strVer = "2.2.12"
%>