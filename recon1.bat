@echo off
call:init

:main_loop
call:basic_info
call:select
pause

goto:main_loop
goto:eof





:init
title Recon1
exit /b

:basic_info
cls
powershell /NoProfile /NoLogo /command "Write-Host -NoNewLine -ForegroundColor DarkYellow 'Username: '; Write-Host $env:USERNAME; Write-Host -NoNewLine -ForegroundColor DarkYellow 'Computername: '; Write-Host $env:COMPUTERNAME; Write-Host -NoNewLine -ForegroundColor DarkYellow 'Windows Edition: '; gwmi win32_operatingsystem | %% caption; Write-Host -NoNewLine -ForegroundColor DarkYellow 'Windows Version: '; (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion').ReleaseId;"
echo.
echo Options:
echo 1) IPs
echo.
echo More commands coming soon!
exit /b

:select
choice /C 123456789 /N
if ERRORLEVEL 1 call:c1
if ERRORLEVEL 2 call:c2
if ERRORLEVEL 3 call:c3
if ERRORLEVEL 4 call:c4
if ERRORLEVEL 5 call:c5
if ERRORLEVEL 6 call:c6
if ERRORLEVEL 7 call:c7
if ERRORLEVEL 8 call:c8
if ERRORLEVEL 9 call:c9
exit /b

:c1
cls
rem ipconfig /all
powershell /NoProfile /NoLogo /command "Get-NetIPConfiguration | ?{$_.InterfaceAlias -notlike '*Bluetooth*' -and $_.InterfaceAlias -notlike '*Virtual*' } | select @{Name='<==================';Expression={}},@{Name='Interface';Expression={$_.InterfaceAlias}},@{Name='IP';Expression={$_.IPv4Address}},@{Name='Gateway';Expression={$_.IPv4DefaultGateway.NextHop}},@{Name='DNS';Expression={$_.DNSServer.ServerAddresses}},@{Name='==================>';Expression={}}"
exit /b

