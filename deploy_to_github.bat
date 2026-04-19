@echo off
echo ========================================
echo 🚀 DSA Tracker - GitHub Setup & Deploy
echo ========================================
echo.

echo This script will help you deploy your DSA Tracker to free hosting
echo.

echo Step 1: Installing Git (if not installed)
echo.

REM Check if Git is installed
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Git not found. Please install Git from: https://git-scm.com/downloads
    echo.
    pause
    exit /b 1
)

echo ✅ Git is installed
echo.

echo Step 2: Initializing Git repository
echo.

if exist .git (
    echo Repository already initialized
) else (
    git init
    echo ✅ Git repository initialized
)

echo.
echo Step 3: Adding all files to Git
echo.

git add .
git status

echo.
echo Step 4: Commit your changes
echo.

git commit -m "Deploy DSA Tracker to free hosting"

echo.
echo Step 5: Set up remote repository
echo.

set /p repo_url="Enter your GitHub repository URL (https://github.com/username/repo.git): "

if defined repo_url (
    git remote add origin "%repo_url%" 2>nul
    git branch -M main
    git push -u origin main

    echo.
    echo ✅ Code pushed to GitHub successfully!
    echo.
    echo 🌐 Now deploy to free hosting:
    echo 1. Railway: https://railway.app (Recommended)
    echo 2. Render: https://render.com
    echo 3. Fly.io: https://fly.io
    echo.
    echo 📖 Check FREE_HOSTING_GUIDE.md for detailed instructions
) else (
    echo No repository URL provided. Please create a GitHub repository first.
    echo Visit: https://github.com/new
)

echo.
pause