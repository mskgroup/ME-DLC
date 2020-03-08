@echo off
md Backup
copy .\TDDLC\DLC1\Config\DefaultAchievements.ini  .\Backup
copy .\TDDLC\DLC1\Config\DefaultGame.ini  .\Backup
copy .\TDDLC\DLC1\Config\DefaultPresence.ini  .\Backup
copy .\TDDLC\DLC1\DLC2Config\DefaultAchievements.ini  .\TDDLC\DLC1\Config
copy .\TDDLC\DLC1\DLC2Config\DefaultGame.ini  .\TDDLC\DLC1\Config
copy .\TDDLC\DLC1\DLC2Config\DefaultPresence.ini .\TDDLC\DLC1\Config
RD /s /q "TDDLC\DLC1\DLC2Config"
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
