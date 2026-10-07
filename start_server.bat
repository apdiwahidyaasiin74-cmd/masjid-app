@echo off
title Nidaamka Masaajidka - Server (Port 8000)
cd /d "C:\Users\Administrator\Desktop\shiine"
echo =========================================================
echo    NIDAAMKA MAAMULKA MASAAJIDKA - SERVER (PORT 8000)
echo    Server-ku hadda wuxuu ka shaqaynayaa:
echo    Local:   http://127.0.0.1:8000
echo    Network: http://10.127.176.200:8000
echo =========================================================
echo.
"C:\xampp\php\php.exe" artisan serve --host=0.0.0.0 --port=8000
pause
