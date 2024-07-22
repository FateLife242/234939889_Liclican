@echo off
REM Open five websites
start "" "https://www.facebook.com/"
start "" "https://www.instagram.com/"
start "" "https://open.spotify.com/"
start "" "https://www.youtube.com/"
start "" "https://discord.com/"

REM Launch calculator
start calc.exe

REM Launch notepad
start notepad.exe

REM Wait for 30 seconds before shutting down
timeout /t 30

REM Initiate system shutdown
shutdown /s /t 0

