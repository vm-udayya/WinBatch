@echo off
setlocal

:: Define the content you want to write
set "content=This is a continuous write operation by a batch script!"

:: Define the file to write to
set "filename=continuous_write.txt"

:: Create or clear the file initially
echo. > %filename%

:loop
:: Append the content to the file
echo %content% >> %filename%

:: Open Notepad with the file if it's not already open
tasklist /FI "IMAGENAME eq notepad.exe" 2>NUL | find /I /N "notepad.exe">NUL
if "%ERRORLEVEL%"=="1" start notepad %filename%

:: Bring Notepad to the foreground
nircmd win activate ititle "continuous_write.txt - Notepad"

:: Wait for a few seconds before writing again
timeout /t 5 >nul

:: Go back to the loop
goto loop

endlocal
