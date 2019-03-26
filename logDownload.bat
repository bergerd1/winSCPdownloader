::
:: This script is for connecting to a specified server and downloading
:: the XYZ.log file on that specified server.
::
@echo off
echo.
echo Enter the server ID to download logs from.
echo Example: myServerHostName or myOtherServerHostName
echo.
echo.
set /p serverID=Server:
cls
echo.
echo %input%
echo.
echo Opening WinSCP terminal to download logs from %serverID% server
echo.
"C:\Program Files (x86)\WinSCP\WinSCP.exe" /console /command "open %:%@myserver" "get
mylogs" "exit"
goto SelectAnother
:SelectAnother
echo. Logs have downloaded from %serverID%
echo.
@echo off
set hh=%time:~-11,2%
set /a hh=%hh%+100
set hh=%hh:~1%
Set mydir=log-%serverID%-%date:~10,4%-%date:~4,2%-%date:~7,2%-%hh%-%time:~3,2%-%time:~6,2%
mkdir %mydir%
move %cd%\XYZ.log*.* %cd%\%mydir%\
echo.
echo. Log file has been moved over.
start "" "%cd%\%mydir%\"
echo.
echo. Press any key to end session
echo.
pause >nul
exit
