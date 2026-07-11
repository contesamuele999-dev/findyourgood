@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo ============================================
echo   Pubblica Find Your Good su GitHub Pages
echo ============================================
echo.

where git >nul 2>nul
if not %errorlevel%==0 (
  echo [ERRORE] Git non e' installato.
  echo Scaricalo da: https://git-scm.com/download/win
  echo Poi riavvia questo file.
  pause
  exit /b 1
)

REM index.html e' la pagina servita da GitHub Pages: la teniamo sempre uguale all'app.
copy /Y "find-your-good.html" "index.html" >nul
echo - index.html aggiornato dall'app.

if not exist ".git" goto primoavvio
goto committa

:primoavvio
echo.
echo Primo avvio: preparo il repository Git.
git init
git branch -M main
echo.
echo Incolla l'URL del tuo repository GitHub.
echo Esempio: https://github.com/TUONOME/find-your-good.git
set /p REPOURL="URL repo: "
git remote add origin "%REPOURL%"

:committa
echo.
set /p MSG="Descrivi la modifica (INVIO = 'aggiornamento'): "
if "%MSG%"=="" set MSG=aggiornamento

git add -A
git commit -m "%MSG%"
git push -u origin main

echo.
echo ============================================
echo   Fatto! Tra 1-2 minuti sara' tutto online.
echo ============================================
pause
