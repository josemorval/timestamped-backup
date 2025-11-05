@echo off
rem ============================================================
rem === Backup Script ===
rem This script creates a timestamped backup folder in the same
rem directory as the script itself. It copies all files from a
rem specified source folder (if provided as an argument) or from
rem C:\ by default. It excludes system folders and the script’s
rem own folder.
rem ============================================================

rem === Get current date in format YYYY-MM-DD_HH-mm using PowerShell ===
for /f %%i in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd_HH-mm"') do set "DATE=%%i"

rem === Define destination folder (same path as script + timestamp) ===
set "DEST=%~dp0%DATE%"

rem === Determine source folder: argument or default to C:\ ===
if "%~1"=="" (
    set "SRC=C:\"
) else (
    if exist "%~1" (
        set "SRC=%~1"
    ) else (
        echo [ERROR] The specified path "%~1" does not exist.
        pause
        exit /b 1
    )
)

rem === Create destination folder if it doesn't exist ===
if not exist "%DEST%" mkdir "%DEST%"

rem === Copy files modified in the last day, excluding specific folders ===
robocopy %SRC% %DEST% /S /MAXAGE:1 /XD C:\$Recycle.Bin %~dp0 /MT:8
