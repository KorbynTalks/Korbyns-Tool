@echo off

msiexec /unreg
msiexec /regserver

taskkill /IM explorer.exe /f
explorer