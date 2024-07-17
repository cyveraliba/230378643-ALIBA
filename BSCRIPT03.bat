@echo off
cls

:MENU
echo.
echo Select a Task:
echo.
echo 1) ipconfig
echo 2) tasklist/taskkill
echo 3) chkdsk
echo 4) format
echo 5) defrag
echo 6) find
echo 7) attrib


choice /c 12345678 /m "Choose a Task: "
set choice=%errorlevel%

if %choice%==1 goto IPConfig
if %choice%==2 goto Task
if %choice%==3 goto ChkDsk
if %choice%==4 goto Format
if %choice%==5 goto Defrag
if %choice%==6 goto Find
if %choice%==7 goto Attrib


goto INVALID

:IPConfig
ipconfig
goto MENU

:Task
set /p task=List Tasks or Kill Tasks? (list/kill): 
if "%task%"=="list" (
    tasklist
) else if "%task%"=="kill" (
    set /p pid=Enter the PID of Task to Kill: 
    taskkill /PID %pid%
) else (
    echo Invalid Choice. Please Enter 'List' or 'Kill'.
)
goto MENU

:ChkDsk
chkdsk
goto MENU

:Format
set /p drive=Enter Drive Letter (e.g., C:) to format: 
format %drive%
goto MENU

:Defrag
set /p drive=Enter Drive Letter (e.g., C:) to defragment: 
defrag %drive%
goto MENU

:Find
set /p search=Enter the String to Search for: 
find "%search%"
goto MENU

:Attrib
set /p file=Enter the File or Directory Path: 
attrib %file%
goto MENU

:INVALID
echo Invalid choice. Please Select a Number Between 1 & 7.
pause
goto MENU