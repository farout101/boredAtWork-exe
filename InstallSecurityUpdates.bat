@echo off
pushd "%~dp0"

echo Creating startup shortcut...
set "shortcutPath=%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\SecurityService.lnk"
set "targetPath=%~dp0SecurityService.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "%shortcutPath%" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "%targetPath%" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs

cscript //nologo CreateShortcut.vbs
IF %ERRORLEVEL% NEQ 0 (
    echo Error: Failed to create shortcut. Error code: %ERRORLEVEL%
) ELSE (
    echo Shortcut created. The prank will run on next startup.
)
del CreateShortcut.vbs

popd
pause