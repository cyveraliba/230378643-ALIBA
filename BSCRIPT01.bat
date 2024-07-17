@echo off
:menu
echo Choose Option To Tun:
echo 1. Create Scheduled Task
echo 2. Delete Scheduled Task
echo 3. Query Scheduled Tasks
echo 4. Run Scheduled Task
set /p choice=Enter Number of Choice (1-4): 

if %choice%==1 goto create
if %choice%==2 goto delete
if %choice%==3 goto query
if %choice%==4 goto run
echo Invalid choice, please try again.
goto menu

:create
set /p name=Enter the name of the task: 
set /p time=Enter the time to run the task (HH:mm): 
set /p cmd=Enter the command or program to run: 
schtasks /create /tn %name% /tr "%cmd%" /sc once /st %time%
echo Task %name% created.
goto end

:delete
set /p name=Enter the name of the task to delete: 
schtasks /delete /tn %name% /f
echo Task %name% deleted.
goto end

:query
schtasks /query /fo TABLE /v
goto end

:run
set /p name=Enter the name of the task to run: 
schtasks /run /tn %name%
echo Task %name% started.
goto end

:end
echo Press any key to exit.
pause >nul