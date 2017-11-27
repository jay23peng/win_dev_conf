:: Put me in C:\windows
@echo off
rem -- Run Vim --
set VIM_EXE_DIR=C:\Program Files\Vim\vim80
if exist "%VIM%\vim80\gvim.exe" set VIM_EXE_DIR=%VIM%\vim80
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
