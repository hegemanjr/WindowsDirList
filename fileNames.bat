@echo off

:: Format date and time so it is filename friendly
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a%%b)

:: Set variables :: username is built-in
set mytime=%mytime: =0%
set datetime=%mydate%_%mytime%
set filename=thisDirectoryContents_%datetime%_%username%.csv

Echo %filename%
::PAUSE

:: Output contents to file
Echo User: %username% > %filename%
Echo Date/Time: %datetime% >> %filename%
Echo Directory: %cd% >> %filename%
Echo.>> %filename%
dir /b  >> %filename%

:: Thank user
Echo Thank You!

::Wait 2 seconds before closing CMD
ping 1.1.1.1 -n 1 -w 3000 > nul
Exit

::PAUSE
