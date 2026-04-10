@echo off
setlocal enabledelayedexpansion

:: Windows Setup Script for Agent Skills
:: This script links skills to global directories for Gemini CLI and Antigravity.

set "SKILLS_DIR=%cd%\skills"
set "GEMINI_SKILLS_DIR=%USERPROFILE%\.gemini\skills"
set "ANTIGRAVITY_SKILLS_DIR=%USERPROFILE%\.gemini\antigravity\skills"

echo 🚀 Starting Agent Skills Setup for Windows...

:: Check if skills directory exists
if not exist "%SKILLS_DIR%" (
    echo ❌ Error: 'skills' directory not found. Please run this script from the root of the .agents repository.
    exit /b 1
)

:: Ensure directories exist
if not exist "%GEMINI_SKILLS_DIR%" mkdir "%GEMINI_SKILLS_DIR%"
if not exist "%ANTIGRAVITY_SKILLS_DIR%" mkdir "%ANTIGRAVITY_SKILLS_DIR%"

echo 📦 Linking skills...

for /d %%S in ("%SKILLS_DIR%\*") do (
    set "skill_name=%%~nS"
    echo    🔗 Linking !skill_name!...
    
    :: Use mklink /D for directory symlinks
    :: /J for junctions if /D requires admin privileges, but /D is better for relative paths
    :: Here we use absolute paths.
    
    :: Remove existing link if it exists
    if exist "%GEMINI_SKILLS_DIR%\!skill_name!" rmdir "%GEMINI_SKILLS_DIR%\!skill_name!"
    mklink /D "%GEMINI_SKILLS_DIR%\!skill_name!" "%%S" >nul 2>&1
    if errorlevel 1 (
        :: Try mklink /J if /D fails (common if not running as admin)
        mklink /J "%GEMINI_SKILLS_DIR%\!skill_name!" "%%S" >nul 2>&1
    )

    if exist "%ANTIGRAVITY_SKILLS_DIR%\!skill_name!" rmdir "%ANTIGRAVITY_SKILLS_DIR%\!skill_name!"
    mklink /D "%ANTIGRAVITY_SKILLS_DIR%\!skill_name!" "%%S" >nul 2>&1
    if errorlevel 1 (
        mklink /J "%ANTIGRAVITY_SKILLS_DIR%\!skill_name!" "%%S" >nul 2>&1
    )
)

echo ✅ Setup Complete!
echo 💡 You can now use these skills in Gemini CLI or Antigravity.
pause
