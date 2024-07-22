@echo off
setlocal enabledelayedexpansion

:menu
cls
echo Select a Windows utility to execute:
echo 1. ipconfig
echo 2. tasklist
echo 3. taskkill
echo 4. chkdsk
echo 5. format
echo 6. defrag
echo 7. find
echo 8. attrib
set /p choice="Enter the number corresponding to your choice: "

if "%choice%"=="1" goto ipconfig
if "%choice%"=="2" goto tasklist
if "%choice%"=="3" goto taskkill
if "%choice%"=="4" goto chkdsk
if "%choice%"=="5" goto format
if "%choice%"=="6" goto defrag
if "%choice%"=="7" goto find
if "%choice%"=="8" goto attrib

echo Invalid choice, please select again.
pause
goto menu

:ipconfig
ipconfig
goto end

:tasklist
tasklist
goto end

:taskkill
set /p pid="Enter the PID of the process to kill: "
if "%pid%"=="" (
    echo No PID entered. Returning to menu.
    pause
    goto menu
)
taskkill /PID %pid%
goto end

:chkdsk
set /p drive="Enter the drive letter to check (Example, C:): "
if "%drive%"=="" (
    echo No drive letter entered. Returning to menu.
    pause
    goto menu
)
chkdsk %drive%
goto end

:format
set /p drive="Enter the drive letter to format (Example, D:): "
if "%drive%"=="" (
    echo No drive letter entered. Returning to menu.
    pause
    goto menu
)
echo WARNING: Formatting will erase all data on the drive %drive%
set /p confirm="Type 'YES' to confirm: "
if /I not "%confirm%"=="YES" (
    echo Format cancelled. Returning to menu.
    pause
    goto menu
)
format %drive%
goto end

:defrag
set /p drive="Enter the drive letter to defragment (Example, C:): "
if "%drive%"=="" (
    echo No drive letter entered. Returning to menu.
    pause
    goto menu
)
defrag %drive%
goto end

:find
set /p search="Enter the string to search for: "
set /p filepath="Enter the file path to search in: "
if "%search%"=="" (
    echo No search string entered. Returning to menu.
    pause
    goto menu
)
if "%filepath%"=="" (
    echo No file path entered. Returning to menu.
    pause
    goto menu
)
find "%search%" "%filepath%"
goto end

:attrib
set /p filepath="Enter the file path to change attributes: "
set /p attributes="Enter the attributes to set (Example, +r -s): "
if "%filepath%"=="" (
    echo No file path entered. Returning to menu.
    pause
    goto menu
)
if "%attributes%"=="" (
    echo No attributes entered. Returning to menu.
    pause
    goto menu
)
attrib %attributes% "%filepath%"
goto end

:end
echo.
echo Press any key to return to the menu.
pause
goto menu

