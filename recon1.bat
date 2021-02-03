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
echo.
powershell /NoProfile /NoLogo /command "Write-Host -NoNewLine -ForegroundColor DarkYellow 'Username: '; Write-Host $env:USERNAME; Write-Host -NoNewLine -ForegroundColor DarkYellow 'Computername: '; Write-Host $env:COMPUTERNAME; Write-Host -NoNewLine -ForegroundColor DarkYellow 'Windows Edition: '; gwmi win32_operatingsystem | %% caption; Write-Host -NoNewLine -ForegroundColor DarkYellow 'Windows Version: '; (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion').ReleaseId;"
echo.
echo Options:
echo 1) IPs
echo 2) Set Background
echo 3) Prepare
echo.
echo More commands coming soon!
exit /b

:select
choice /C 123456789 /N
if ERRORLEVEL 255 exit /b
if ERRORLEVEL 9 call:c9
if ERRORLEVEL 8 call:c8
if ERRORLEVEL 7 call:c7
if ERRORLEVEL 6 call:c6
if ERRORLEVEL 5 call:c5
if ERRORLEVEL 4 call:c4
if ERRORLEVEL 3 call:c3
if ERRORLEVEL 2 call:c2
if ERRORLEVEL 1 call:c1
exit /b

:c1
cls
rem ipconfig /all
powershell /NoProfile /NoLogo /command "Get-NetIPConfiguration | ?{$_.InterfaceAlias -notlike '*Bluetooth*' -and $_.InterfaceAlias -notlike '*Virtual*' } | select @{Name='<==================';Expression={}},@{Name='Interface';Expression={$_.InterfaceAlias}},@{Name='IP';Expression={$_.IPv4Address}},@{Name='Gateway';Expression={$_.IPv4DefaultGateway.NextHop}},@{Name='DNS';Expression={$_.DNSServer.ServerAddresses}},@{Name='==================>';Expression={}}"
exit /b

:c2
cls
powershell -encodedCommand "TgBlAHcALQBJAHQAZQBtAFAAcgBvAHAAZQByAHQAeQAgAC0AUABhAHQAaAAgACIASABLAEMAVQA6AFwAQwBvAG4AdAByAG8AbAAgAFAAYQBuAGUAbABcAEQAZQBzAGsAdABvAHAAIgAgAC0ATgBhAG0AZQAgAFcAYQBsAGwAcABhAHAAZQByAFMAdAB5AGwAZQAgAC0AUAByAG8AcABlAHIAdAB5AFQAeQBwAGUAIABTAHQAcgBpAG4AZwAgAC0AVgBhAGwAdQBlACAAMAAgAC0ARgBvAHIAYwBlADsATgBlAHcALQBJAHQAZQBtAFAAcgBvAHAAZQByAHQAeQAgAC0AUABhAHQAaAAgACIASABLAEMAVQA6AFwAQwBvAG4AdAByAG8AbAAgAFAAYQBuAGUAbABcAEQAZQBzAGsAdABvAHAAIgAgAC0ATgBhAG0AZQAgAFQAaQBsAGUAVwBhAGwAbABwAGEAcABlAHIAIAAtAFAAcgBvAHAAZQByAHQAeQBUAHkAcABlACAAUwB0AHIAaQBuAGcAIAAtAFYAYQBsAHUAZQAgADAAIAAtAEYAbwByAGMAZQA7AEEAZABkAC0AVAB5AHAAZQAgAC0AVAB5AHAAZQBEAGUAZgBpAG4AaQB0AGkAbwBuACAAIgB1AHMAaQBuAGcAIABTAHkAcwB0AGUAbQA7AGAAbgB1AHMAaQBuAGcAIABTAHkAcwB0AGUAbQAuAFIAdQBuAHQAaQBtAGUALgBJAG4AdABlAHIAbwBwAFMAZQByAHYAaQBjAGUAcwA7AGAAbgBwAHUAYgBsAGkAYwAgAGMAbABhAHMAcwAgAFAAYQByAGEAbQBzAGAAbgB7AGAAbgBbAEQAbABsAEkAbQBwAG8AcgB0ACgAYAAiAFUAcwBlAHIAMwAyAC4AZABsAGwAYAAiACwAQwBoAGEAcgBTAGUAdAA9AEMAaABhAHIAUwBlAHQALgBVAG4AaQBjAG8AZABlACkAXQBgAG4AcAB1AGIAbABpAGMAIABzAHQAYQB0AGkAYwAgAGUAeAB0AGUAcgBuACAAaQBuAHQAIABTAHkAcwB0AGUAbQBQAGEAcgBhAG0AZQB0AGUAcgBzAEkAbgBmAG8AIAAoAEkAbgB0ADMAMgAgAHUAQQBjAHQAaQBvAG4ALABgAG4ASQBuAHQAMwAyACAAdQBQAGEAcgBhAG0ALABgAG4AUwB0AHIAaQBuAGcAIABsAHAAdgBQAGEAcgBhAG0ALABgAG4ASQBuAHQAMwAyACAAZgB1AFcAaQBuAEkAbgBpACkAOwBgAG4AfQBgAG4AIgAuAFQAbwBTAHQAcgBpAG4AZwAoACkAOwBJAG4AdgBvAGsAZQAtAFcAZQBiAFIAZQBxAHUAZQBzAHQAIAAtAFUAcgBpACAAIgBoAHQAdABwAHMAOgAvAC8AaQBtAGcAdQByAC4AYwBvAG0ALwBzAHIAMgA0AEMAYQBrAC4AagBwAGcAIgAgAC0ATwB1AHQARgBpAGwAZQAgACQAZQBuAHYAOgBUAEUATQBQAFwAUABTAFcAYQBsAGwAcABhAHAAZQByAC4AagBwAGcAOwAgAFsAUABhAHIAYQBtAHMAXQA6ADoAUwB5AHMAdABlAG0AUABhAHIAYQBtAGUAdABlAHIAcwBJAG4AZgBvACgAMAB4ADAAMAAxADQALAAgADAALAAgACIAJABlAG4AdgA6AFQARQBNAFAAXABQAFMAVwBhAGwAbABwAGEAcABlAHIALgBqAHAAZwAiACwAIAAoADAAeAAwADEAIAAtAGIAbwByACAAMAB4ADAAMgApACkAOwA="
exit /b

:c3
cls
mkdir C:\SippicomInstall
powershell -command "wget https://github.com/Naggelus/information_gathering_pnb/raw/master/resources/Setups/7zip.exe -OutFile C:\SippicomInstall\7zip.exe"
exit /b