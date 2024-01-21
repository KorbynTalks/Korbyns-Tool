@echo off
echo Running CorruptFixer..
DISM /Online /Cleanup-Image /CheckHealth
sfc /scannow
msg * "Fixed Corrupt Files Successfully."