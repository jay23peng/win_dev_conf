@echo off
for /f "usebackq delims=" %%i in (`fzf`) do set SELECTION=%%~fi
if not defined ConEmuHWND goto EXECMD
start %1 %SELECTION% -cur_console:n
goto END
:EXECMD
start  %1 %SELECTION% 
:END
