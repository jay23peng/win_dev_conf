:: Put me in C:\windows
@echo off
rem -- Run Vim --

:: fix for shell pref in emacs
SET SHELL=

SET HOME=%USERPROFILE%
set VIM_EXE_DIR=C:\Program Files (x86)\Vim\vim74
if exist "%VIM%\vim74\gvim.exe" set VIM_EXE_DIR=%VIM%\vim74
if exist "%VIMRUNTIME%\gvim.exe" set VIM_EXE_DIR=%VIMRUNTIME%

if exist "%VIM_EXE_DIR%\gvim.exe" goto havevim
echo "%VIM_EXE_DIR%\gvim.exe" not found
goto eof

:havevim
if .%1==. goto noarg
if not .%1==. goto witharg 

:noarg
start "dummy" /b "%VIM_EXE_DIR%\gvim.exe" --servername GVIM 
goto eof

:witharg
start "dummy" /b "%VIM_EXE_DIR%\gvim.exe" --servername GVIM --remote-tab-silent %*
goto eof

:eof
