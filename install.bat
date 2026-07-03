@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ====================================================
echo   Promo Tool - Installation Script
echo ====================================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo.
    echo ❌ Python nahi mila! (Python not found)
    echo.
    echo Python download karne ke liye ye link kholein:
    echo https://www.python.org/downloads/
    echo.
    echo Installation instructions:
    echo 1. Python download karo
    echo 2. Installer ko run karo
    echo 3. "Add Python to PATH" checkbox check karo
    echo 4. Install karo
    echo 5. Phir se yeh install.bat file run karo
    echo.
    pause
    exit /b 1
)

echo ✓ Python mil gaya!
python --version
echo.

REM Check if pip is installed
pip --version >nul 2>&1
if errorlevel 1 (
    echo ❌ PIP nahi mila!
    pause
    exit /b 1
)

echo ✓ PIP mil gaya!
echo.

REM Install requirements
echo ====================================================
echo   Installing Python modules...
echo ====================================================
echo.

pip install --upgrade pip

if exist requirements.txt (
    echo Installing modules se requirements.txt...
    pip install -r requirements.txt
    if errorlevel 1 (
        echo.
        echo ❌ Modules install karte time error aaya!
        pause
        exit /b 1
    )
) else (
    echo ❌ requirements.txt nahi mila!
    pause
    exit /b 1
)

echo.
echo ====================================================
echo   ✓ Installation Complete!
echo ====================================================
echo.
echo Sab kuch successfully install ho gaya!
echo Promo tool ab ready hai use karne ke liye.
echo.
pause
