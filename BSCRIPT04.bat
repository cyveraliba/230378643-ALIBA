@echo off
cls

REM Sort text files on Drive C: by date
echo Sorting text files on Drive C: by date...
cd /d C:\
for %%F in (*.txt) do (
    for /f "tokens=1-3 delims=/" %%A in ("%%~tF") do (
        set "mm=%%A"
        set "dd=%%B"
        set "yyyy=%%C"
    )
    ren "%%F" "%yyyy%-%mm%-%dd%-%%F"
)

REM Archive older files to a folder on Drive Z:
echo Archiving older files to a folder on Drive Z:...
robocopy C:\ Z:\Archive /s /maxage:30 /mov

REM Sort the archived files by size
echo Sorting the archived files by size...
cd /d Z:\Archive
dir /b /os > sorted_files.txt

REM Prompt User to set Permission to Delete Old, Large Files
echo.
set /p del_choice=Delete Old, Large Files? (yes/no): 
if /i "%del_choice%"=="yes" (
    set /p file_size=Enter Maximum File Size to Delete (Write in bytes): 
    for /f "delims=" %%F in (sorted_files.txt) do (
        for /f %%A in ('"forfiles /p "%%~dpF" /m "%%~nxF" /c "cmd /c echo @fsize" "') do (
            if %%A GEQ %file_size% (
                echo Deleting %%F...
                del "%%F"
            )
        )
    )
    echo Deletion Success.
) else (
    echo Deletion canceled.
)

pause