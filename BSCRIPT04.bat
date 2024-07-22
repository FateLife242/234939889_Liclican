@echo off
setlocal enabledelayedexpansion

:menu
echo Select one of the following shapes:
echo 1. Circle
echo 2. Triangle
echo 3. Quadrilateral
set /p shape="Enter the number corresponding to your choice: "

if "%shape%"=="1" goto circle
if "%shape%"=="2" goto triangle
if "%shape%"=="3" goto quadrilateral

echo Invalid choice, please select again.
goto menu

:circle
set /p radius="Enter the radius of the circle: "
set /a area=(22 * %radius% * %radius%) / 7
echo The area of the circle is: !area!
goto end

:triangle
set /p a="Enter the length of the first side: "
set /p b="Enter the length of the second side: "
set /p c="Enter the length of the third side: "

set /a s=(%a% + %b% + %c%) / 2
set /a area=s * (s - %a%) * (s - %b%) * (s - %c%)
call :sqrt %area% area_sqrt
echo The area of the triangle is approximately: !area_sqrt!

:: Determine the type of triangle
if "%a%"=="%b%" if "%b%"=="%c%" (
    echo The triangle is equilateral.
) else if "%a%"=="%b%" if not "%b%"=="%c%" (
    echo The triangle is isosceles.
) else if "%a%"=="%c%" if not "%b%"=="%c%" (
    echo The triangle is isosceles.
) else if "%b%"=="%c%" if not "%a%"=="%b%" (
    echo The triangle is isosceles.
) else (
    echo The triangle is scalene.
)
goto end

:quadrilateral
set /p length="Enter the length: "
set /p width="Enter the width: "

set /a area=%length% * %width%
echo The area of the quadrilateral is: !area!

if "%length%"=="%width%" (
    echo The quadrilateral is a square.
) else (
    echo The quadrilateral is a rectangle.
)
goto end

:sqrt
setlocal
set /a num=%1
set /a sqrt=num / 2
set /a temp=0

:loop
set /a temp=sqrt
set /a sqrt=(temp + num / temp) / 2
if %temp% neq %sqrt% goto loop

endlocal & set %2=%sqrt%
goto :eof

:end
echo.
echo Press any key to exit.
pause >nul

