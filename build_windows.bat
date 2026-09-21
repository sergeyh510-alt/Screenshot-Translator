@echo off
setlocal
cd /d "%~dp0"

echo [1/4] Installing build dependencies...
python -m pip install --upgrade pyinstaller
python -m pip install -r requirements.txt

if not exist "Screenshot_translator.py" (
    if exist "app.py" (
        copy /Y "app.py" "Screenshot_translator.py" >nul
    ) else (
        echo ERROR: Screenshot_translator.py or app.py was not found.
        pause
        exit /b 1
    )
)

echo [2/4] Cleaning old build folders...
if exist build rmdir /s /q build
if exist dist rmdir /s /q dist
if exist Screenshot_translator.spec del /q Screenshot_translator.spec

echo [3/4] Building executable...
python -m PyInstaller --noconfirm --clean --onefile --windowed ^
  --name Screenshot_Translator ^
  --icon screenshot_translator.ico ^
  --add-data "screenshot_translator.ico;." ^
  --add-data "screenshot_translator.png;." ^
  Screenshot_translator.py

if errorlevel 1 (
    echo.
    echo BUILD FAILED.
    pause
    exit /b 1
)

echo [4/4] Copying support files to dist...
copy /Y "README.md" "dist\README.md" >nul
copy /Y "requirements.txt" "dist\requirements.txt" >nul

echo.
echo BUILD COMPLETE.
echo Executable: %CD%\dist\Screenshot_Translator.exe
pause
