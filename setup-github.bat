@echo off
echo ============================================
echo  SSA Math Department - GitHub Pages Setup
echo ============================================
echo.

cd /d "C:\Users\myung\Documents\01 - Teaching\26-27"

echo Cleaning up any previous partial setup...
rmdir /s /q .git 2>nul

echo Initializing git repository...
git init
if %errorlevel% neq 0 (
    echo ERROR: git init failed. Make sure Git is installed.
    pause
    exit /b 1
)

echo.
echo Configuring git identity...
git config user.email "myungkuh@gmail.com"
git config user.name "Myung"

echo.
echo Adding all files...
git add .

echo.
echo Creating initial commit...
git commit -m "Initial commit: SSA Math Department Resources"
if %errorlevel% neq 0 (
    echo ERROR: Commit failed.
    pause
    exit /b 1
)

echo.
echo Renaming branch to main...
git branch -M main

echo.
echo ============================================
echo  NEXT STEP: Enter your GitHub repo URL
echo  Go to github.com, create a new repo, then
echo  copy the URL (ends in .git)
echo  Example: https://github.com/myungkuh/ssa-math-resources.git
echo ============================================
echo.
set /p REPO_URL="Paste your GitHub repo URL here and press Enter: "

if "%REPO_URL%"=="" (
    echo ERROR: No URL entered. Run the script again.
    pause
    exit /b 1
)

git remote add origin %REPO_URL%
git push -u origin main

if %errorlevel% neq 0 (
    echo.
    echo Push failed. You may need to sign in to GitHub.
    echo A browser window may open asking for your credentials.
    echo If it does, sign in and re-run this script.
) else (
    echo.
    echo ============================================
    echo  SUCCESS! Files are on GitHub.
    echo.
    echo  LAST STEP: Enable GitHub Pages
    echo  1. Go to your repo on github.com
    echo  2. Click Settings - Pages
    echo  3. Under Branch, select: main
    echo  4. Click Save
    echo.
    echo  Your site will be live at:
    echo  https://YOUR-USERNAME.github.io/REPO-NAME/
    echo ============================================
)
echo.
pause
