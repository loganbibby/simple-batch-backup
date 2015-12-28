@echo off
setlocal EnableDelayedExpansion
:: variables
set destination=C:\Backup
set xcopyswitches=/s /e /h /i /y

:: welcome message
echo File backup.
echo/

:: counter
set /a n=0

:: personal files first
set user_directories=Documents Downloads Pictures Music Videos
for %%a in (%user_directories%) do (
	set dest_directories[!n!]=%%a
	set sour_directories[!n!]="%USERPROFILE%\%%a"
	set /a n = n + 1
)

:: to add additional directories:
::  1. add the destination folder to dest_directories array (use %n% as the counter)
::  2. add the source folder to the sour_directories array (again, use %n%)
::  3. increase the n variable by 1

::set dest_directories[!n!]=PowerShell
::set sour_directories[!n!]="C:\Program Files (x86)\WindowsPowerShell"
::set /a n = n + 1

:: remove the last element
set /a n = n -1

:: go!
echo The backup is starting now and may take a little bit...
echo/
echo/
for /L %%i in (0,1,%n%) do (
	echo Directory: !sour_directories[%%i]!
	xcopy !sour_directories[%%i]! "%destination%\!dest_directories[%%i]!" %xcopyswitches%
	echo/
)
echo/
echo Your backup is now complete. Enjoy your day.
