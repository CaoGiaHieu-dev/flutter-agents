@echo off
setlocal enabledelayedexpansion

:: Windows Setup Script for Agent Skills (Robust Version)
:: Tự động dọn dẹp các thư mục/link cũ trước khi tạo liên kết mới.

set "SKILLS_DIR=%~dp0skills"
set "GEMINI_SKILLS_DIR=%USERPROFILE%\.gemini\skills"
set "ANTIGRAVITY_SKILLS_DIR=%USERPROFILE%\.gemini\antigravity\skills"

echo Starting Agent Skills Setup for Windows...

:: Kiểm tra thư mục skills
if not exist "%SKILLS_DIR%" (
    echo Error: 'skills' directory not found at "%SKILLS_DIR%".
    pause
    exit /b 1
)

:: Tạo thư mục gốc nếu chưa có
if not exist "%GEMINI_SKILLS_DIR%" mkdir "%GEMINI_SKILLS_DIR%"
if not exist "%ANTIGRAVITY_SKILLS_DIR%" mkdir "%ANTIGRAVITY_SKILLS_DIR%"

echo Linking skills...

for /d %%S in ("%SKILLS_DIR%\*") do (
    set "FULL_PATH=%%~fS"
    set "SKILL_NAME=%%~nS"
    
    echo    - Linking !SKILL_NAME!...

    :: Xử lý cho Gemini CLI
    set "TARGET_LINK_GEMINI=%GEMINI_SKILLS_DIR%\!SKILL_NAME!"
    if exist "!TARGET_LINK_GEMINI!" (
        :: Xóa sạch thư mục/link cũ nếu đã tồn tại
        rmdir /s /q "!TARGET_LINK_GEMINI!" 2>nul
    )
    mklink /J "!TARGET_LINK_GEMINI!" "!FULL_PATH!" >nul

    :: Xử lý cho Antigravity
    set "TARGET_LINK_ANTI=%ANTIGRAVITY_SKILLS_DIR%\!SKILL_NAME!"
    if exist "!TARGET_LINK_ANTI!" (
        rmdir /s /q "!TARGET_LINK_ANTI!" 2>nul
    )
    mklink /J "!TARGET_LINK_ANTI!" "!FULL_PATH!" >nul
)

echo.
echo Setup Complete!
echo All skills have been successfully linked.
pause
