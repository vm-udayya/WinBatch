@echo off
setlocal

:: Open Notepad
start notepad.exe
timeout /t 2 /nobreak >nul

:: Write "This is text" in Notepad
echo This is text > temp.txt
timeout /t 2 /nobreak >nul
type temp.txt | clip
timeout /t 2 /nobreak >nul
powershell -command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.SendKeys]::SendWait('^v')"
timeout /t 2 /nobreak >nul
del temp.txt

:: Loop to switch between Notepad and Teams every 2 minutes
:loop
timeout /t 120 /nobreak >nul
powershell -command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.SendKeys]::SendWait('%{TAB}')"
timeout /t 120 /nobreak >nul
powershell -command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.SendKeys]::SendWait('%{TAB}')"
goto loop

endlocal