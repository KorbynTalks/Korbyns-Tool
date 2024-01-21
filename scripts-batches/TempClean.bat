@echo off
echo Running Temp Clean..
:: All places that the batch file looks for any files that are Temporary.
cd C:\
rd %temp% /s /q
md %temp%
del /s /f /q %userprofile%\Recent\*.*
del /s /f /q C:\Windows\Prefetch\*.*
del /s /f /q C:\Windows\Temp\*.*
del /s /f /q %USERPROFILE%\appdata\local\temp\*.*
del %TEMP%\*.* /f /s /q
RD %TEMP%\. /S /Q
del C:\Windows\Prefetch*.* /Q
del C:\Windows\Temp*.* /Q
del "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Recent Items\*.*" /Q
del /s /f /q %windir%\temp\*.*
rd /s /q %windir%\temp
md %windir%\temp
del /s /f /q %windir%\Prefetch\*.*
rd /s /q %windir%\Prefetch
md %windir%\Prefetch
del /s /f /q %windir%\system32\dllcache\*.*
rd /s /q %windir%\system32\dllcache
md %windir%\system32\dllcache
del /s /f /q "%SysteDrive%\Temp"\*.*
rd /s /q "%SysteDrive%\Temp"
md "%SysteDrive%\Temp"
del /s /f /q %temp%\*.*
rd /s /q %temp%
md %temp%
echo removed System Temp files
del /s /f /q "%USERPROFILE%\Local Settings\History"\*.*
rd /s /q "%USERPROFILE%\Local Settings\History"
md "%USERPROFILE%\Local Settings\History"
del /s /f /q "%USERPROFILE%\Local Settings\Temporary Internet Files"\*.*
rd /s /q "%USERPROFILE%\Local Settings\Temporary Internet Files"
md "%USERPROFILE%\Local Settings\Temporary Internet Files"
del /s /f /q "%USERPROFILE%\Local Settings\Temp"\*.*
rd /s /q "%USERPROFILE%\Local Settings\Temp"
md "%USERPROFILE%\Local Settings\Temp"
del /s /f /q "%USERPROFILE%\Recent"\*.*
rd /s /q "%USERPROFILE%\Recent"
md "%USERPROFILE%\Recent"
del /s /f /q "%USERPROFILE%\Cookies"\*.*
rd /s /q "%USERPROFILE%\Cookies"
md "%USERPROFILE%\Cookies"
del /s /f /q c:\windows\temp\*.*
rd /s /q c:\windows\temp
md c:\windows\temp
del /s /f /q C:\WINDOWS\Prefetch
del /s /f /q %temp%\*.*
rd /s /q %temp%
md %temp%
del c:\WIN386.SWP
del /S /q c:\Windows\Recent\*.*
del /S /q c:\Windows\temp\*.*
del /S /q c:\$RECYCLE.BIN\*.*
del /S /q c:\temp\*.*
del /S /q %userprofile%\AppData\Local\Temp\*.*
del /S /q %userprofile%\AppData\Local\Tmp\*.*
del /S /q %localappdata%\Temp\*.*
del /s /f /q %USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache\*.*
del /s /f /q %USERPROFILE%\Downloads\*.*
del /s /f /q %USERPROFILE%\AppData\Local\CrashDumps\*.*
del /s /f /q %USERPROFILE%\AppData\LocalLow\Temp\*.*
del /s /f /q C:\Windows\Logs\*.*
del C:\Windows\WindowsUpdate.log /s /q /f
del C:\Windows\PFRO.log /s /q /f
del C:\Windows\iis.log /s /q /f
msg * "all Temporary Files removed."
exit