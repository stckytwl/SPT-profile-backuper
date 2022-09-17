@echo off

set origpath=%~dp0
cd %origpath%
if not exist "%origpath%\user\profile backups\" mkdir "%origpath%\user\profile backups\"
cd user\profile backups

set counter=0
mkdir "" 2>nul || goto :TryNext

:continue
cd %origpath%
xcopy /s /i "user\profiles" "user\profile backups\(%counter%)" 
goto :eof

:TryNext
set /a counter+=1
mkdir "(%counter%)" 2>nul || goto :TryNext
goto :continue