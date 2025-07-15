@echo off
pushd "%~dp0"

echo.
echo  --- Annoyance-As-A-Service Configuration ---
echo.
echo  Set the time range for how often a random action should occur.
echo.

:min_delay_prompt
set /p "min_delay=Enter the minimum delay in seconds (e.g., 300 for 5 minutes): "
echo %min_delay% | findstr /r /c:"^[0-9][0-9]*$" >nul
if errorlevel 1 (
    echo Invalid input. Please enter a number.
    goto min_delay_prompt
)

:max_delay_prompt
set /p "max_delay=Enter the maximum delay in seconds (e.g., 1200 for 20 minutes): "
echo %max_delay% | findstr /r /c:"^[0-9][0-9]*$" >nul
if errorlevel 1 (
    echo Invalid input. Please enter a number.
    goto max_delay_prompt
)

if %min_delay% GEQ %max_delay% (
    echo Error: Minimum delay must be less than maximum delay.
    goto min_delay_prompt
)

echo Creating configuration file...
echo set MIN_DELAY=%min_delay% > config.bat
echo set MAX_DELAY=%max_delay% >> config.bat
echo Configuration saved to config.bat
echo.

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