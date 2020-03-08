@echo off
md Backup
copy .\TdGame\Config\DefaultAchievements.ini  .\Backup
copy .\TdGame\Config\DefaultGame.ini  .\Backup
copy .\TdGame\Config\DefaultPresence.ini  .\Backup
copy .\TdGame\DLCConfig\DefaultAchievements.ini  .\TdGame\Config
copy .\TdGame\DLCConfig\DefaultGame.ini  .\TdGame\Config
copy .\TdGame\DLCConfig\DefaultPresence.ini .\TdGame\Config
RD /s /q "TdGame\DLCConfig"
set Program=%~dp0\Binaries\MEMLA.exe
set LnkName=Mirror's Edge
set WorkDir=
set Desc=Mirror's Edge With DLC
if not defined WorkDir call:GetWorkDir "%Program%"
(echo Set WshShell=CreateObject("WScript.Shell"^)
echo strDesKtop=WshShell.SpecialFolders("DesKtop"^)
echo Set oShellLink=WshShell.CreateShortcut(strDesKtop^&"\%LnkName%.lnk"^)
echo oShellLink.TargetPath="%Program%"
echo oShellLink.WorkingDirectory="%WorkDir%"
echo oShellLink.WindowStyle=1
echo oShellLink.Description="%Desc%"
echo oShellLink.Save)>makelnk.vbs
makelnk.vbs
del /f /q makelnk.vbs
del %0
goto :eof
:GetWorkDir
set WorkDir=%~dp1
set WorkDir=%WorkDir:~,-1%
goto :eof
