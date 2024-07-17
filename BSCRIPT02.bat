@echo off

:MENU
cls
echo.
echo Please select a shape:
echo.
echo 1) Circle
echo 2) Triangle
echo 3) Quadrilateral

choice /c 123 /m "Choose A Shape: "
set choice=%errorlevel%

if %choice%==1 goto Circle
if %choice%==2 goto Triangle
if %choice%==3 goto Quadrilateral
goto INVALID

:INVALID
echo Wrong Input. Please Select a Number Between 1 & 3.
pause
goto MENU

:Circle
cls
set /p radius=Input Radius of Circle (Must Be Postive Num):

if "%radius%"=="" goto INVALID_CIRCLE
if %radius% LEQ 0 goto INVALID_CIRCLE

set /a area=314159 * %radius% * %radius% / 100000
echo The Area of The Cirlce Is: %area%

pause
goto MENU

:INVALID_CIRCLE
echo Please Input a Valid Radius.
pause
goto Circle

:Triangle
cls
set /p side1=Input Length of Side 1 (positive number):
if "%side1%"=="" goto INVALID_TRIANGLE
if %side1% LEQ 0 goto INVALID_TRIANGLE

set /p side2=Input Length of Side 2 (positive number):
if "%side2%"=="" goto INVALID_TRIANGLE
if %side2% LEQ 0 goto INVALID_TRIANGLE

set /p side3=Input Length of Side 3 (positive number):
if "%side3%"=="" goto INVALID_TRIANGLE
if %side3% LEQ 0 goto INVALID_TRIANGLE

set /a valid1=%side1% + %side2%
set /a valid2=%side1% + %side3%
set /a valid3=%side2% + %side3%

if %side1% GEQ %valid3% goto INVALID_TRIANGLE
if %side2% GEQ %valid2% goto INVALID_TRIANGLE
if %side3% GEQ %valid1% goto INVALID_TRIANGLE

set /a perimeter=%side1% + %side2% + %side3%
set /a semiperimeter=%perimeter% / 2
set /a area=(%semiperimeter% * (%semiperimeter% - %side1%) * (%semiperimeter% - %side2%) * (%semiperimeter% - %side3%))
set /a area=%area% / 100

echo The Area of the Triangle is: %area%

if %side1%==%side2% if %side1%==%side3% (
  echo Triangle type: Equilateral
) else if %side1%==%side2% if not %side1%==%side3% (
  echo Triangle type: Isosceles
) else if %side1%==%side3% if not %side1%==%side2% (
  echo Triangle type: Isosceles
) else if %side2%==%side3% if not %side2%==%side1% (
  echo Triangle type: Isosceles
) else (
  echo Triangle type: Scalene
)

pause
goto MENU

:INVALID_TRIANGLE
echo Please Input Valid Length Values for Side
pause
goto Triangle

:Quadrilateral
cls
set /p length=Input the Length of the Quadrilateral (Must be Positive Num):
if "%length%"=="" goto INVALID_QUADRILATERAL
if %length% LEQ 0 goto INVALID_QUADRILATERAL

set /p width=Input the Width of the Quadrilateral (Must be Positive Num):
if "%width%"=="" goto INVALID_QUADRILATERAL
if %width% LEQ 0 goto INVALID_QUADRILATERAL

set /a area=%length% * %width%
echo The Area of the Quadrilateral is: %area%

if %length%==%width% (
  echo Quadrilateral type: Square
) else (
  echo Quadrilateral type: Rectangle
)

pause
goto MENU

:INVALID_QUADRILATERAL
echo Please Input Valid Dimensions.
pause
goto Quadrilateral