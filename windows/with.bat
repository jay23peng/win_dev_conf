@echo off
for /f "usebackq delims=" %%x in (`fzf`) do %1 %%x
