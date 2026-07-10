@echo off
echo ============================================
echo  Pushing SSA Math Resources to GitHub...
echo ============================================
echo.

cd /d "C:\Users\myung\Documents\01 - Teaching\26-27"

:: Remove any old/broken remote and set the correct one
git remote remove origin 2>nul
git remote add origin https://github.com/mkuh-cmd/ssa-math-resources.git

:: If no commits yet (first run), set up the repo
git status | find "nothing to commit" >nul 2>&1
if %errorlevel% neq 0 (
    echo Committing files...
    git add .
    git commit -m "Initial commit: SSA Math Department Resources" 2>nul
    git branch -M main 2>nul
)

echo Pushing to GitHub...
git push -u origin main

if %errorlevel% neq 0 (
    echo.
    echo Push failed - a sign-in window may have opened.
    echo Sign in to GitHub, then double-click this script again.
) else (
    echo.
    echo ============================================
    echo  SUCCESS! Files are on GitHub.
    echo.
    echo  LAST STEP to go live:
    echo  1. Go to: https://github.com/mkuh-cmd/ssa-math-resources
    echo  2. Click Settings - Pages
    echo  3. Under Branch, select: main - Click Save
    echo.
    echo  Your site will be live at:
    echo  https://mkuh-cmd.github.io/ssa-math-resources/
    echo ============================================
)
echo.
pause
