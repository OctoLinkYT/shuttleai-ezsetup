@echo off

:: Check for administrator privileges

net session >nul 2>&1
if %errorLevel% neq 0 (
    :: Relaunch the batch file with administrator privileges
    echo Loading...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: Your main script starts here
setlocal
echo [93mShuttleAI Python API - Project Setup[0m
echo [93mWritten by [wholeworldcoding][0m
:: Prompt for directory input
set /p directory="Define the directory where the project folder will be placed: "

:: Change to the specified directory
cd /d "%directory%"
echo [93m[SHUTTLEAI] Installing Dependencies...[0m

pip install shuttleai
pip install poetry
echo [93m[SHUTTLEAI] Downloading project base & resources...[0m
echo "[SHUTTLEAI] Downloading project base & resources..."
git clone https://github.com/shuttleai/shuttleai-python
cd shuttleai-python
poetry install
echo. > main.py
echo [93m[SHUTTLEAI] Done![0m
py -m idlelib.idle main.py

pause
