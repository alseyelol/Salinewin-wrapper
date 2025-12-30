@echo off

IF EXIST "C:\Users\%username%\Checkpoint.bat" (
    
) ELSE (
    copy Checkpoint.bat C:\Users\%username%
)
exit