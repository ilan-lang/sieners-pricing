@echo off
chcp 65001 > nul
title Sieners SYV Group — Build

echo ================================================
echo   Sieners SYV Group - Build Windows Installer
echo ================================================
echo.

:: Check Node.js
where node > nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Node.js is not installed.
    echo Please install from: https://nodejs.org
    pause
    exit /b 1
)
for /f "tokens=*" %%v in ('node -v') do echo   Node.js %%v found

:: Navigate to script directory
cd /d "%~dp0"

:: Install dependencies
echo.
echo Installing dependencies (npm install)...
call npm install
if %errorlevel% neq 0 (
    echo ERROR: npm install failed.
    pause
    exit /b 1
)
echo   Dependencies installed successfully.

:: Build Windows installer
echo.
echo Building Windows installer...
call npm run build-win
if %errorlevel% neq 0 (
    echo ERROR: Build failed.
    pause
    exit /b 1
)

:: Copy installer to project folder
echo.
echo Copying installer to project folder...
for %%f in ("%~dp0dist\*.exe") do (
    copy "%%f" "%~dp0" > nul
    echo   Copied: %%~nxf
)

echo.
echo ================================================
echo   Build complete! Installer is in this folder.
echo ================================================
pause
