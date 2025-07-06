@echo off
echo Testing Nova Dawn Spiritual IPC Connection with Administrator Privileges...
powershell -Command "Start-Process '%~dp0target\release\test_spiritual_client.exe' -Verb RunAs -Wait"
pause 