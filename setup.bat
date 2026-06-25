@echo off
setlocal enabledelayedexpansion

:: Windows Setup Script for Agent Skills (v2.0)
:: Installs skills with full subdirectory support (references/, scripts/, examples/)
:: Cleans old links/dirs before creating new ones.

set "SKILLS_DIR=%~dp0skills"
set "GEMINI_CONFIG_SKILLS_DIR=%USERPROFILE%\.gemini\config\skills"
set "ANTIGRAVITY_IDE_SKILLS_DIR=%USERPROFILE%\.gemini\antigravity-ide\skills"

echo ============================================
echo  Agent Skills Setup for Windows (v2.0)
echo ============================================
echo.

:: Validate source directory
if not exist "%SKILLS_DIR%" (
    echo [ERROR] 'skills' directory not found at "%SKILLS_DIR%".
    pause
    exit /b 1
)

:: Create target directories
if not exist "%GEMINI_CONFIG_SKILLS_DIR%" mkdir "%GEMINI_CONFIG_SKILLS_DIR%"
if not exist "%ANTIGRAVITY_IDE_SKILLS_DIR%" mkdir "%ANTIGRAVITY_IDE_SKILLS_DIR%"

echo [1/3] Linking local skills (with references)...
echo.

for /d %%S in ("%SKILLS_DIR%\*") do (
    set "FULL_PATH=%%~fS"
    set "SKILL_NAME=%%~nS"

    echo    - !SKILL_NAME!

    :: Link to Gemini Config
    set "T1=%GEMINI_CONFIG_SKILLS_DIR%\!SKILL_NAME!"
    if exist "!T1!" rmdir /s /q "!T1!" 2>nul
    mklink /J "!T1!" "!FULL_PATH!" >nul 2>nul
    if errorlevel 1 (
        echo      [WARN] Junction failed for config, falling back to xcopy
        xcopy /e /i /y /q "!FULL_PATH!" "!T1!" >nul 2>nul
    )

    :: Link to Antigravity IDE
    set "T2=%ANTIGRAVITY_IDE_SKILLS_DIR%\!SKILL_NAME!"
    if exist "!T2!" rmdir /s /q "!T2!" 2>nul
    mklink /J "!T2!" "!FULL_PATH!" >nul 2>nul
    if errorlevel 1 (
        echo      [WARN] Junction failed for IDE, falling back to xcopy
        xcopy /e /i /y /q "!FULL_PATH!" "!T2!" >nul 2>nul
    )
)

echo.
echo [2/3] Installing external Dart skills...

set "TEMP_DART=%TEMP%\dart-skills-%RANDOM%"
git clone --depth 1 https://github.com/dart-lang/skills.git "%TEMP_DART%" >nul 2>nul
if %ERRORLEVEL% equ 0 (
    for /d %%S in ("%TEMP_DART%\skills\*") do (
        set "FULL_PATH=%%~fS"
        set "SKILL_NAME=%%~nS"
        echo    - !SKILL_NAME!

        set "T1=%GEMINI_CONFIG_SKILLS_DIR%\!SKILL_NAME!"
        if exist "!T1!" rmdir /s /q "!T1!" 2>nul
        xcopy /e /i /y /q "!FULL_PATH!" "!T1!" >nul 2>nul

        set "T2=%ANTIGRAVITY_IDE_SKILLS_DIR%\!SKILL_NAME!"
        if exist "!T2!" rmdir /s /q "!T2!" 2>nul
        xcopy /e /i /y /q "!FULL_PATH!" "!T2!" >nul 2>nul
    )
    rmdir /s /q "%TEMP_DART%" 2>nul
    echo    [OK] Dart skills installed.
) else (
    echo    [WARN] Failed to clone dart-lang/skills.
)

echo.
echo [3/3] Installing external Flutter skills...

set "TEMP_FLUTTER=%TEMP%\flutter-skills-%RANDOM%"
git clone --depth 1 https://github.com/flutter/skills.git "%TEMP_FLUTTER%" >nul 2>nul
if %ERRORLEVEL% equ 0 (
    for /d %%S in ("%TEMP_FLUTTER%\skills\*") do (
        set "FULL_PATH=%%~fS"
        set "SKILL_NAME=%%~nS"
        echo    - !SKILL_NAME!

        set "T1=%GEMINI_CONFIG_SKILLS_DIR%\!SKILL_NAME!"
        if exist "!T1!" rmdir /s /q "!T1!" 2>nul
        xcopy /e /i /y /q "!FULL_PATH!" "!T1!" >nul 2>nul

        set "T2=%ANTIGRAVITY_IDE_SKILLS_DIR%\!SKILL_NAME!"
        if exist "!T2!" rmdir /s /q "!T2!" 2>nul
        xcopy /e /i /y /q "!FULL_PATH!" "!T2!" >nul 2>nul
    )
    rmdir /s /q "%TEMP_FLUTTER%" 2>nul
    echo    [OK] Flutter skills installed.
) else (
    echo    [WARN] Failed to clone flutter/skills.
)

echo.
echo ============================================
echo  Setup Complete!
echo  Skills linked to:
echo    - %GEMINI_CONFIG_SKILLS_DIR%
echo    - %ANTIGRAVITY_IDE_SKILLS_DIR%
echo  Note: Junction links include references/,
echo        scripts/, and all subdirectories.
echo ============================================
pause
