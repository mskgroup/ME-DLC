@echo off
del /f /q ".\TdGame\CookedPC\Audio\ADLC_00TimeTrialHUD.upk"
del /f /q ".\TdGame\CookedPC\Audio\ADLC_01Pink_Amb.upk"
del /f /q ".\TdGame\CookedPC\Audio\ADLC_02Purple_Amb.upk"
del /f /q ".\TdGame\CookedPC\Audio\ADLC_03Orange_Amb.upk"
del /f /q ".\TdGame\CookedPC\Audio\ADLC_04Blue_Amb.upk"
del /f /q ".\TdGame\CookedPC\Audio\ADLC_05Red_Amb.upk"
del /f /q ".\TdGame\CookedPC\Audio\ADLC_06Spots.upk"
del /f /q ".\TdGame\CookedPC\Audio\ADLC_07SpeedPreFab.upk"
del /f /q ".\TdGame\CookedPC\Packages\DLCCheckpoints.upk"
del /f /q ".\TdGame\CookedPC\Packages\DLCLightEffects.upk"
del /f /q ".\TdGame\CookedPC\Packages\DLCMaterials.upk"
del /f /q ".\TdGame\CookedPC\Packages\DLCMaterials_02.upk"
del /f /q ".\TdGame\CookedPC\Packages\DLCProps_01.upk"
del /f /q ".\TdGame\CookedPC\Packages\DLCProps_02.upk"
del /f /q ".\TdGame\CookedPC\Packages\DLCProps_03.upk"
copy .\Backup\DefaultAchievements.ini .\TdGame\Config
copy .\Backup\DefaultGame.ini  .\TdGame\Config
copy .\Backup\DefaultPresence.ini .\TdGame\Config
RD /s /q Backup
RD /s /q "TdGame\CookedPC\Maps\DLC"
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




