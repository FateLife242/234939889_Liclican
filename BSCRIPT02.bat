@echo off
setlocal enabledelayedexpansion

:: Set variables
set source_path=C:\
set archive_path=D:\ArchivedFiles\
set temp_file=%temp%\temp_sort.txt

:: Create archive folder if it doesn't exist
if not exist "%archive_path%" mkdir "%archive_path%"

echo Sorting text files on Drive C: by date...
:: Find all .txt files on Drive C: and sort them by date
for /r %source_path% %%f in (*.txt) do (
    echo %%~tf %%f
) | sort > %temp_file%

echo Archiving older text files to Drive D:...
:: Move older files to the archive folder
for /f "tokens=1,* delims= " %%a in (%temp_file%) do (
    move "%%b" "%archive_path%"
)

:: Cleanup temporary file
del %temp_file%

echo Sorting archived files by size...
:: Sort files in the archive folder by size
for %%f in ("%archive_path%*.txt") do (
    echo %%~zf %%f
) | sort /r > %temp_file%

:: Display sorted files
echo The archived files sorted by size are:
type %temp_file%

:: Prompt user for permission to delete old, large files
echo.
set /p confirm="Do you want to delete the old, large files? (yes/no): "

if /i "%confirm%"=="yes" (
    echo Deleting old, large files...
    for /f "tokens=2 delims= " %%a in (%temp_file%) do (
        del "%%a"
    )
    echo Old, large files deleted.
) else (
    echo Deletion canceled.
)

:: Cleanup temporary file
del %temp_file%

:end
echo.
echo Task completed. Press any key to exit.
pause >nul

