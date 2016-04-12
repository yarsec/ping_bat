@echo off
cls
rem All settings are here:
set IP="8.8.8.8"
set IPLOGFILE="ping_%DATE%.log"
set daemon="no"
if "%daemon%"=="yes" goto daemon
:Loaded
cls
echo ****************************************************************************
echo Util for ping via standart commands in win (show time, print to file, etc)
echo github.com/yarsec/ping_bat
echo ****************************************************************************
echo.
echo Choose:
echo.
echo 1. Output in this window
echo 2. Output in file
echo 3. DEFAULT MODE (all setting will be default and NO more QUESTION and CHOISES)
echo 4. Exit
set /p outputone=Enter (1, 2, 3, 4):
if "%outputone%"=="1" goto OutputThisWindow
if "%outputone%"=="2" goto OutputFile
if "%outputone%"=="3" goto DEFAULTMODE
if "%outputone%"=="4" goto endend
goto Loaded
:OutputThisWindow
cls
echo ****************************************************************************
echo Util for ping via standart commands in win (show time, print to file, etc)
echo github.com/yarsec/ping_bat
echo ****************************************************************************
echo.
echo Choose:
echo.
echo 1. I will enter IP address now
echo 2. Use IP address from file
echo 3. Exit
set /p outputtwo=Enter (1, 2, 3):
if "%outputtwo%"=="1" goto OutputThisWindowIPenter
if "%outputtwo%"=="2" goto OutputThisWindowIPalreadyset
if "%outputtwo%"=="3" goto endend
goto OutputThisWindow
:OutputThisWindowIPenter
cls
echo ****************************************************************************
echo Util for ping via standart commands in win (show time, print to file, etc)
echo github.com/yarsec/ping_bat
echo ****************************************************************************
echo.
set /p IP=Enter IP address:
echo %IP%
rem parsing inc next time
goto OutputThisWindowIPalreadyset
:OutputThisWindowIPalreadyset
cls
echo ****************************************************************************
echo Util for ping via standart commands in win (show time, print to file, etc)
echo github.com/yarsec/ping_bat
echo ****************************************************************************
echo.
echo Press Ctrl+C to interrupt.
echo.
:OutputThisWindowIPalreadysetCode
for /f "tokens=1*" %%i in ('ping -n 1 %IP% ^| findstr /i "TTL Превышен Общий"') do set n="%%i %%j"
if defined n (goto log)
set n="Error"
:log
echo %date% %time% %n% 
ping -n 2 127.0.0.1 > nul
goto OutputThisWindowIPalreadysetCode
:OutputFile
cls
echo ****************************************************************************
echo Util for ping via standart commands in win (show time, print to file, etc)
echo github.com/yarsec/ping_bat
echo ****************************************************************************
echo.
echo 1. I will enter IP address now
echo 2. Use IP address from file
echo 3. Exit
set /p outputthree=Enter (1, 2, 3):
if "%outputthree%"=="1" goto OutputFileIPenter
if "%outputthree%"=="2" goto OutputFileIPsetFilenameChoose
if "%outputthree%"=="3" goto endend
echo.
goto OutputFile
:OutputFileIPenter
cls
echo ****************************************************************************
echo Util for ping via standart commands in win (show time, print to file, etc)
echo github.com/yarsec/ping_bat
echo ****************************************************************************
echo.
set /p IP=Enter IP address:
echo %IP%
rem parsing inc next time
goto OutputFileIPsetFilenameChoose
:OutputFileIPsetFilenameChoose
cls
echo ****************************************************************************
echo Util for ping via standart commands in win (show time, print to file, etc)
echo github.com/yarsec/ping_bat
echo ****************************************************************************
echo.
echo 1. I will enter filename now
echo 2. Use filename from file
echo 3. Exit
set /p outputthree=Enter (1, 2, 3):
if "%outputthree%"=="1" goto OutputFileIPsetFilenameEnter
if "%outputthree%"=="2" goto OutputFilealreadyset
if "%outputthree%"=="3" goto endend
echo.
goto OutputFileIPsetFilenameChoose
:OutputFileIPsetFilenameEnter
cls
echo ****************************************************************************
echo Util for ping via standart commands in win (show time, print to file, etc)
echo github.com/yarsec/ping_bat
echo ****************************************************************************
echo.
set /p IPLOGFILE=Enter filename for log:
echo %IPLOGFILE%
rem parsing inc next time
goto OutputFilealreadyset
:OutputFilealreadyset
cls
echo ****************************************************************************
echo Util for ping via standart commands in win (show time, print to file, etc)
echo github.com/yarsec/ping_bat
echo ****************************************************************************
echo.
echo Logging...
echo.
echo Press Ctrl+C to interrupt.
goto OutputFilealreadysetCode
:OutputFilealreadysetCode
for /f "tokens=1*" %%i in ('ping -n 1 %IP% ^| findstr /i "TTL Превышен Общий"') do set n="%%i %%j"
if defined n (goto log)
set n="Error"
:log
echo %date% %time% %n% >> %IPLOGFILE%
ping -n 2 127.0.0.1 > nul
goto OutputFilealreadysetCode
:DEFAULTMODE
cls
echo ****************************************************************************
echo Util for ping via standart commands in win (show time, print to file, etc)
echo github.com/yarsec/ping_bat
echo ****************************************************************************
echo.
echo You choose DEFAULT MODE.
echo We will ping %IP% and log it to %IPLOGFILE%
echo.
echo Press Ctrl+C to interrupt.
goto OutputFilealreadysetCode
:daemon
cls
goto endend
:endend