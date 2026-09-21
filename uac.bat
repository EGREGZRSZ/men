@echo off
:: Vérification des droits administrateur
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :admin
) else (
    echo Demande des droits administrateur...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:admin
:: Ouvre la console de commande dans le répertoire courant
cd /d "%~dp0"
cmd.exe