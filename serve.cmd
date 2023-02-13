@echo off
cd %~dp0content
cmd /k "python -m http.server --bind 127.0.0.1 3000"
pause