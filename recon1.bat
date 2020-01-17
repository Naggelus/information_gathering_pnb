@echo off

call:init
call:basic_info
pause
goto:eof

:init
title Recon1
exit /b

:basic_info
powershell /NoProfile /NoLogo /command "Write-Host -NoNewLine -ForegroundColor DarkYellow 'Username: '; Write-Host $env:USERNAME; Write-Host -NoNewLine -ForegroundColor DarkYellow 'Computername: '; Write-Host $env:COMPUTERNAME; Write-Host -NoNewLine -ForegroundColor DarkYellow 'Windows Edition: '; gwmi win32_operatingsystem | %% caption; Write-Host -NoNewLine -ForegroundColor DarkYellow 'Windows Version: '; (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion').ReleaseId;"
exit /b