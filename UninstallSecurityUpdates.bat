@echo off
echo Removing startup shortcut...
del "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\SecurityService.lnk"

echo Terminating running prank process...
taskkill /f /im wscript.exe /fi "WINDOWTITLE eq Important System Security Process"

echo Prank removed.
pause