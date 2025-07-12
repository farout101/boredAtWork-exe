@echo off
echo Creating startup shortcut...
set "shortcutPath=%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\SecurityService.lnk"
set "targetPath=%~dp0SecurityService.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "%shortcutPath%" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "%targetPath%" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs

cscript CreateShortcut.vbs
del CreateShortcut.vbs

echo Shortcut created. The prank will run on next startup.
pause