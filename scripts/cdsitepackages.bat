@echo off

if not defined WORKON_HOME (
    set "WORKON_HOME=%USERPROFILE%\Envs"
)

set "_LAST_DIR=%CD%"

if defined PYTHONHOME (
    set "PYHOME=%PYTHONHOME%"
    goto MAIN
)
for /f "usebackq tokens=*" %%a in (`python.exe -c "import sys;print(sys.exec_prefix)"`) do (
    set "PYHOME=%%a"
)

:MAIN
cd /d "%PYHOME%\Lib\site-packages"
set PYHOME=

:END
