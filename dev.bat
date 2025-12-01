@echo off

REM Iniciar API en una nueva terminal
start "API Server" cmd /k "cd api && php artisan serve"

REM Iniciar Web en otra terminal
start "Web Frontend" cmd /k "cd web && pnpm start"

