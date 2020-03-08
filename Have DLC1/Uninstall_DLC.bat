@echo off
copy .\Backup\DefaultAchievements.ini .\TDDLC\DLC1\Config
copy .\Backup\DefaultGame.ini  .\TDDLC\DLC1\Config
copy .\Backup\DefaultPresence.ini .\TDDLC\DLC1\Config
RD /s /q Backup
RD /s /q "TDDLC\DLC1\Maps\dlc09"
del /f /q ".\Binaries\MEMLA.exe"
set Program=%~dp0\Binaries\MirrorsEdge.exe
set LnkName=Mirror's Edge
set WorkDir=
set Desc=Mirror's Edge
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




