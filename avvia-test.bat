@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo ============================================
echo   Find Your Good - test in locale
echo ============================================
echo.
echo Apro l'app nel browser su http://localhost:8000/find-your-good.html
echo Per fermare il server: chiudi questa finestra oppure premi CTRL+C.
echo.

start "" http://localhost:8000/find-your-good.html

where python >nul 2>nul
if %errorlevel%==0 (
  python -m http.server 8000
  goto :eof
)

where py >nul 2>nul
if %errorlevel%==0 (
  py -m http.server 8000
  goto :eof
)

echo Python non trovato: apro il file direttamente nel browser.
echo (Alcune funzioni rendono meglio con un server locale: installa Python da https://www.python.org)
start "" "find-your-good.html"
pause
