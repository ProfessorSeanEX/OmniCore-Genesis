@echo off
echo Installing Nova Heart Service with Administrator Privileges...
powershell -Command "Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File \"%~dp0install_service.ps1\"' -Verb RunAs -Wait"
pause 