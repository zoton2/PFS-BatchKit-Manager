@echo off

:--------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if "%errorlevel%" NEQ "0" (
REM    echo Requesting Administrative Privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

chcp 1252

call "%~dp0BAT\LANG2.BAT"
call "%~dp0BAT\CFG2.BAT"

IF EXIST "%~dp0TMP" rmdir /Q/S "%~dp0TMP" >nul 2>&1

attrib +h "BAT"

IF NOT EXIST "%~dp0APPS\" MD "%~dp0APPS"
IF NOT EXIST "%~dp0ART\"  MD "%~dp0ART"
IF NOT EXIST "%~dp0CD\"   MD "%~dp0CD"
IF NOT EXIST "%~dp0CFG\"  MD "%~dp0CFG"
IF NOT EXIST "%~dp0CHT\"  MD "%~dp0CHT"
IF NOT EXIST "%~dp0DVD\"  MD "%~dp0DVD"
IF NOT EXIST "%~dp0LOG\"  MD "%~dp0LOG"
IF NOT EXIST "%~dp0POPS\" MD "%~dp0POPS"
IF NOT EXIST "%~dp0THM\"  MD "%~dp0THM"
IF NOT EXIST "%~dp0VMC\"  MD "%~dp0VMC"

IF NOT EXIST "%~dp0POPS\VMC" MD "%~dp0POPS\VMC"
IF NOT EXIST "%~dp0POPS-Binaries\" MD "%~dp0POPS-Binaries\"
IF NOT EXIST "%~dp0HDD-OSD\__sysconf" MD "%~dp0HDD-OSD\__sysconf"
IF NOT EXIST "%~dp0HDD-OSD\__system" MD "%~dp0HDD-OSD\__system"
IF NOT EXIST "%~dp0HDD-OSD\PP.HEADER" MD "%~dp0HDD-OSD\PP.HEADER"

cls
:mainmenu
"%~dp0BAT\Diagbox" gd 0f
cd /d "%~dp0"
cls
title PFS BatchKit Manager v1.0.8 By GDX
echo.Welcome in PFS BatchKit Manager v1.0.8 By GDX
endlocal
endlocal
setlocal EnableDelayedExpansion
setlocal EnableExtensions
echo.------------------------------------------
echo.
ECHO 1. Transfer PS1 Games
ECHO 2. Transfer PS2 Games
ECHO 3. Transfer APPS,ART,CFG,CHT,VMC,THM,POPS-VMC
ECHO 4. Transfer POPS Binaries
ECHO.
ECHO.
ECHO.7. Backup PS1 Games
ECHO 8. Backup PS2 Games
ECHO 9. Backup ART,CFG,CHT,VMC,POPS-VMC
ECHO.
ECHO 10. Advanced Menu
ECHO.
ECHO 11. Exit
ECHO.
ECHO.
ECHO 12. About
echo.------------------------------------------
set /p choice="Select Option:"

if "%choice%"=="1" (goto TransferPS1Games)
if "%choice%"=="2" (goto TransferPS2Games)
if "%choice%"=="3" (goto TransferAPPSARTCFGCHTTHMVMC)
if "%choice%"=="4" (goto TransferPOPSBinaries)     

if "%choice%"=="7" (goto BackupPS1Games)
if "%choice%"=="8" (goto BackupPS2Games)
if "%choice%"=="9" (goto BackupARTCFGCHTVMC)
if "%choice%"=="10" (goto AdvancedMenu)
if "%choice%"=="11" exit
if "%choice%"=="12" (goto About)

(goto mainmenu)

:About
"%~dp0BAT\Diagbox" gd 0f
cd /d "%~dp0"
cls
title PFS BatchKit Manager v1.0.8 By GDX 
echo.Welcome in PFS BatchKit Manager v1.0.8 By GDX
endlocal
endlocal
setlocal DisableDelayedExpansion
echo.------------------------------------------
ECHO ABOUT ME
echo.
ECHO I was inspired by the scripts of NeMesiS, Dekkit and Rs1n to make this script
ECHO.
ECHO This batch script is intended to help people prepare their hard drive for the PS2!
ECHO. 
ECHO Many thanks to the PS2 community for their contribution to the program used to make this scripts!
ECHO. 
ECHO GDX
ECHO.
echo.------------------------------------------
ECHO 1. My Twitter
ECHO 2. My Discord : GDX#5466
ECHO 3. My Youtube Channel
ECHO 4.
ECHO 5.
ECHO 6.
ECHO 7.
ECHO 8. Officiel PS2 Forum
ECHO 9. Officiel PS2 Discord
ECHO.
ECHO 10. Back to main menu
ECHO 11. Exit
echo.------------------------------------------
set /p choice="Select Option:"

if "%choice%"=="1" (start https://twitter.com/GDX_SM)
if "%choice%"=="3" (start https://www.youtube.com/user/GDXTV/videos)
if "%choice%"=="8" (start https://www.psx-place.com/forums/#playstation-2-forums.6)
if "%choice%"=="9" (start https://discord.gg/PWGvKXjRgy)

if "%choice%"=="10" (goto mainmenu)
if "%choice%"=="11" exit

if "%choice%"=="99" (goto poop)
if "%choice%"=="100" (goto GDX-X)

(goto About)

:AdvancedMenu
"%~dp0BAT\Diagbox" gd 0f
cd /d "%~dp0"
cls
title PFS BatchKit Manager v1.0.8 By GDX
echo.Welcome in PFS BatchKit Manager v1.0.8 By GDX
endlocal
endlocal
setlocal EnableDelayedExpansion
setlocal EnableExtensions
echo.------------------------------------------
ECHO Advanced Menu
ECHO.
ECHO 1. Conversion
ECHO 2. Games Management
ECHO 3. Downloads/Updates
ECHO 4. 
ECHO 5. PC Utility
ECHO 6.
ECHO 7. HDD-OSD/PSBBN/XMB
ECHO 8. PS2 Online
ECHO 9. HDD Management
ECHO.
ECHO 10. Back to main menu
ECHO 11. Exit
ECHO.
echo.------------------------------------------
set /p choice="Select Option:"

if "%choice%"=="1" (goto ConversionMenu)
if "%choice%"=="2" (goto GamesManagement)
if "%choice%"=="3" (goto DownloadsMenu)

if "%choice%"=="5" (goto UtilityMenu)

if "%choice%"=="7" (goto HDDOSDMenu)
if "%choice%"=="8" (goto PS2OnlineMenu)
if "%choice%"=="9" (goto HDDManagementMenu)
if "%choice%"=="10" (goto mainmenu)
if "%choice%"=="11" exit

(goto AdvancedMenu)

:ConversionMenu
"%~dp0BAT\Diagbox" gd 0f
cd /d "%~dp0"
cls
title PFS BatchKit Manager v1.0.8 By GDX
echo.Welcome in PFS BatchKit Manager v1.0.8 By GDX
endlocal
endlocal
setlocal EnableDelayedExpansion
setlocal EnableExtensions
echo.------------------------------------------
ECHO Conversion Menu
ECHO.
ECHO 1. Convert .BIN to .VCD (Multi-Tracks .BIN Compatible)
ECHO 2. Convert .VCD to .BIN
ECHO 3. Convert .BIN to .CHD (Multi-Tracks .BIN Compatible)
ECHO 4. Convert .CHD to .BIN
ECHO 5. Convert .ECM to .BIN
ECHO.
ECHO 7. Convert .BIN to .ISO (Only for PS2 Games Usefull for PCSX2)
ECHO 8. Convert Multi-Tracks .BIN to Single .BIN
ECHO 9. Restore Single .BIN to Multi-Tracks .BIN (If compatible, it will rebuild the original .bin with the Multi-Track)
ECHO.
ECHO 10. Back
ECHO 11. Back to main menu
ECHO 12. Exit
ECHO.
ECHO.
echo.------------------------------------------
set /p choice="Select Option:"

if "%choice%"=="1" (goto BIN2VCD)
if "%choice%"=="2" (goto VCD2BIN)
if "%choice%"=="3" (goto BIN2CHD)
if "%choice%"=="4" (goto CHD2BIN)
if "%choice%"=="5" (goto ECM2BIN)

if "%choice%"=="7" (goto BIN2ISO)
if "%choice%"=="8" (goto multibin2bin)
if "%choice%"=="9" (goto bin2split)
if "%choice%"=="10" (goto AdvancedMenu)
if "%choice%"=="11" (goto mainmenu)
if "%choice%"=="12" exit

(goto ConversionMenu)

:GamesManagement
"%~dp0BAT\Diagbox" gd 0f
cd /d "%~dp0"
cls
title PFS BatchKit Manager v1.0.8 By GDX
echo.Welcome in PFS BatchKit Manager v1.0.8 By GDX
endlocal
endlocal
setlocal EnableDelayedExpansion
setlocal EnableExtensions
echo.------------------------------------------
ECHO Games Management
ECHO.
ECHO 1. Dump your CD-DVD
ECHO 2. Check MD5 Hash of your PS2 .ISO/.BIN with the redump database
ECHO 3. Create CHEATS.CHT With Mastercode
ECHO 4. Assign titles database for your .VCDs
ECHO 5.
ECHO 6. 
ECHO 7. Delete a games (Installed in HDD)
ECHO 8. Rename a games (Installed in HDD)
ECHO 9. Export game list (Installed in HDD)
ECHO.
ECHO 10. Back
ECHO 11. Back to main menu
ECHO 12. Exit
ECHO.
ECHO.
echo.------------------------------------------
set /p choice="Select Option:"

if "%choice%"=="1" (goto DumpCDDVD)
if "%choice%"=="2" (goto checkMD5HashPS2Games)
if "%choice%"=="3" (copy "%~dp0BAT\make_cheat_mastercode.bat" >nul "%~dp0" & cls & call make_cheat_mastercode.bat & del make_cheat_mastercode.bat & pause)
if "%choice%"=="4" (goto RenameVCDDB)

if "%choice%"=="7" (goto DeleteChoiceGamesHDD)
if "%choice%"=="8" (goto RenameChoiceGames)
if "%choice%"=="9" (goto ExportChoiceGamesListHDD)

if "%choice%"=="10" (goto AdvancedMenu)
if "%choice%"=="11" (goto mainmenu)
if "%choice%"=="12" exit

(goto GamesManagement)

:DownloadsMenu
"%~dp0BAT\Diagbox" gd 0f
cd /d "%~dp0"
cls
title PFS BatchKit Manager v1.0.8 By GDX
echo.Welcome in PFS BatchKit Manager v1.0.8 By GDX
endlocal
endlocal
setlocal EnableDelayedExpansion
setlocal EnableExtensions
echo.------------------------------------------
ECHO Downloads Menu 
ECHO.
REM ECHO 1. Applications
ECHO 1.
ECHO 2. Artworks
ECHO 3. Configs
ECHO 4. Cheats
ECHO 5.
ECHO 6.
ECHO 7.
ECHO 8.
ECHO 9.
REM ECHO 9. Update your APPS,ART,CFG,CHT (Automatically updates files found in your +OPL partition)
ECHO.
ECHO 10. Back
ECHO 11. Back to main menu
ECHO 12. Exit
ECHO.
echo.------------------------------------------
set /p choice="Select Option:"

if "%choice%"=="2" (goto DownloadARTMenu)
if "%choice%"=="3" (goto DownloadCFG)
if "%choice%"=="4" (goto DownloadCheatsMenu)

if "%choice%"=="10" (goto AdvancedMenu)
if "%choice%"=="11" (goto mainmenu)
if "%choice%"=="12" exit

(goto DownloadsMenu)

:DownloadARTMenu
"%~dp0BAT\Diagbox" gd 0f
cd /d "%~dp0"
cls
title PFS BatchKit Manager v1.0.8 By GDX
echo.Welcome in PFS BatchKit Manager v1.0.8 By GDX
endlocal
endlocal
setlocal EnableDelayedExpansion
setlocal EnableExtensions
echo.------------------------------------------
ECHO Download ART Menu 
ECHO.
REM ECHO 1. Download COV
REM ECHO 2. Download COV2
REM ECHO 3. Download ICO
REM ECHO 4. Download LAB
REM ECHO 5. Download LGO
REM ECHO 6. Download BG
REM ECHO 7. Download SCR
REM ECHO 8. Download SCR2
ECHO 1.
ECHO 2.
ECHO 3.
ECHO 4.
ECHO 5.
ECHO 6.
ECHO 7.
ECHO 8.
ECHO.
ECHO 9 Download ARTs PS2
ECHO.
ECHO 10. Back
ECHO 11. Back to main menu
ECHO 12. Exit
ECHO.
echo.------------------------------------------
set /p choice="Select Option:"

if "%choice%"=="9" (goto DownloadARTPS2)
if "%choice%"=="20" (goto DownloadARTPS1)

if "%choice%"=="10" (goto DownloadsMenu)
if "%choice%"=="11" (goto mainmenu)
if "%choice%"=="12" exit

(goto DownloadARTMenu)

:DownloadCheatsMenu
"%~dp0BAT\Diagbox" gd 0f
cd /d "%~dp0"
cls
title PFS BatchKit Manager v1.0.8 By GDX
echo.Welcome in PFS BatchKit Manager v1.0.8 By GDX
endlocal
endlocal
setlocal EnableDelayedExpansion
setlocal EnableExtensions
echo.------------------------------------------
ECHO Download Cheats Menu 
ECHO.
ECHO 1.
ECHO 2.
ECHO 3.
ECHO 4.
ECHO 5.
REM ECHO 5. Grand Theft Auto Uncensored blood (European version)
ECHO 6.
ECHO 7.
ECHO 8.
ECHO 9. Widescreen Cheats (4/3 to 16/9)

ECHO.
ECHO 10. Back
ECHO 11. Back to main menu
ECHO 12. Exit
ECHO.
echo.------------------------------------------
set /p choice="Select Option:"

if "%choice%"=="9" (goto DownloadWideScreenCheat)

if "%choice%"=="10" (goto DownloadsMenu)
if "%choice%"=="11" (goto mainmenu)
if "%choice%"=="12" exit

(goto DownloadCheatsMenu)


:UtilityMenu
"%~dp0BAT\Diagbox" gd 0f
cd /d "%~dp0"
cls
title PFS BatchKit Manager v1.0.8 By GDX
echo.Welcome in PFS BatchKit Manager v1.0.8 By GDX
endlocal
endlocal
setlocal EnableDelayedExpansion
setlocal EnableExtensions
echo.------------------------------------------
ECHO PC Utility
ECHO.
ECHO 1. PS1 Save Utility
ECHO 2. PS2 Save Utility
ECHO 3. OPL Manager
ECHO 4. HDL Batch Installer
ECHO 5. 
ECHO 6. PS2 Controller Remapper
ECHO 7.
ECHO 8.
ECHO 9.
ECHO.
ECHO 10. Back
ECHO 11. Back to main menu
ECHO 12. Exit
ECHO.
echo.------------------------------------------
set /p choice="Select Option:"

if "%choice%"=="1" (start https://github.com/ShendoXT/memcardrex/releases)
if "%choice%"=="2" (start https://www.psx-place.com/resources/mymc-dual-by-joack.675) 
if "%choice%"=="3" (start https://oplmanager.com/site)
if "%choice%"=="4" (start https://github.com/israpps/HDL-Batch-installer/releases)
if "%choice%"=="6" (start https://www.psx-place.com/resources/ps2-controller-remapper-by-pelvicthrustman.692/)


if "%choice%"=="10" (goto AdvancedMenu)
if "%choice%"=="11" (goto mainmenu)
if "%choice%"=="12" exit

(goto UtilityMenu)

:HDDOSDMenu
"%~dp0BAT\Diagbox" gd 0f
cd /d "%~dp0"
cls
title PFS BatchKit Manager v1.0.8 By GDX
echo.Welcome in PFS BatchKit Manager v1.0.8 By GDX
endlocal
endlocal
setlocal EnableDelayedExpansion
setlocal EnableExtensions
echo.------------------------------------------
ECHO HDD-OSD/PSBBN/XMB
ECHO.
ECHO 1. Install HDD-OSD (Browser 2.0)
ECHO 2. Uninstall HDD-OSD
ECHO 3. Partitions Management
REM ECHO 2. Install PSBBN
REM ECHO 3. Install BlackRhino
REM ECHO 4. Install Linux 2.6
ECHO 4. 
ECHO 5.
ECHO 7.
ECHO 8.
ECHO 9.
ECHO.
ECHO 10. Back
ECHO 11. Back to main menu
ECHO 12. Exit
ECHO.
echo.------------------------------------------
set /p choice="Select Option:"

if "%choice%"=="1" (goto InstallHDDOSD)
if "%choice%"=="2" (goto UnInstallHDDOSD)
if "%choice%"=="3" (goto HDDOSDPartManagement)

if "%choice%"=="10" (goto AdvancedMenu)
if "%choice%"=="11" (goto mainmenu)
if "%choice%"=="12" exit

(goto HDDOSDMenu)

:HDDOSDPartManagement
"%~dp0BAT\Diagbox" gd 0f
cd /d "%~dp0"
cls
title PFS BatchKit Manager v1.0.8 By GDX
echo.Welcome in PFS BatchKit Manager v1.0.8 By GDX
endlocal
endlocal
setlocal EnableDelayedExpansion
setlocal EnableExtensions
echo.------------------------------------------
ECHO HDD-OSD/PSBBN/XMB Partitions Management
ECHO.
ECHO 1. Transfer PS1 Games (Install as Partition)
ECHO 2. 
ECHO 3. Inject OPL-Launcher (Launch PS2 games from HDD-OSD)
ECHO 4. Hide Partition (Hide partitions in HDD-OSD)
ECHO 5. Unhide Partition (Show partitions in HDD-OSD)
ECHO 7.
ECHO 8.
ECHO 9.
REM ECHO 9. Modify Partition header
ECHO.
ECHO 10. Back
ECHO 11. Back to main menu
ECHO 12. Exit
ECHO.
echo.------------------------------------------
set /p choice="Select Option:"
if "%choice%"=="1" (goto TransferPS1GamesHDDOSD)


if "%choice%"=="3" (goto InjectOPL-Launcher)
if "%choice%"=="4" (goto pphide)
if "%choice%"=="5" (goto ppunhide)


if "%choice%"=="10" (goto HDDOSDMenu)
if "%choice%"=="11" (goto mainmenu)
if "%choice%"=="12" exit

(goto HDDOSDPartManagement)

:PS2OnlineMenu
"%~dp0BAT\Diagbox" gd 0f
cd /d "%~dp0"
cls
title PFS BatchKit Manager v1.0.8 By GDX
echo.Welcome in PFS BatchKit Manager v1.0.8 By GDX
endlocal
endlocal
setlocal EnableDelayedExpansion
setlocal EnableExtensions
echo.------------------------------------------
ECHO Online Menu
ECHO.
REM ECHO 1. Patch DNAS MODE 1 = sceDNAS2GetStatus injection fake deinit, error 0, status 5
REM ECHO 2. Patch DNAS MODE 2 = sceDNAS2GetStatus injection status 5
REM ECHO 3. Patch DNAS MODE 3 = SetStatus patch status 5 semi-forcing
REM ECHO 4. Patch DNAS MODE 4 = SetStatus patch status 5 instead of 6 (DNASrep required)
REM ECHO 5. DNAS MODE 5 = scan-only, no patching, output codes when possible
ECHO 1.
ECHO 2.
ECHO 3.
ECHO 4.
ECHO 5.
ECHO 6.
ECHO 7.
ECHO 8.
ECHO 9. Show PS2 Games Compatibles (Show only games that don't need a patch)
ECHO.
ECHO 10. Back
ECHO 11. Back to main menu
ECHO 12. Exit
ECHO.
echo.------------------------------------------
set /p choice="Select Option:"

if "%choice%"=="9" (start https://docs.google.com/spreadsheets/d/1bbxOGm4dPxZ4Vbzyu3XxBnZmuPx3Ue-cPqBeTxtnvkQ)
if "%choice%"=="10" (goto AdvancedMenu)
if "%choice%"=="11" (goto mainmenu)
if "%choice%"=="12" exit

(goto PS2OnlineMenu)

:HDDManagementMenu
"%~dp0BAT\Diagbox" gd 0f
cd /d "%~dp0"
cls
title PFS BatchKit Manager v1.0.8 By GDX
echo.Welcome in PFS BatchKit Manager v1.0.8 By GDX
endlocal
endlocal
setlocal EnableDelayedExpansion
setlocal EnableExtensions
echo.------------------------------------------
ECHO HDD Management 
ECHO.
ECHO 1. Create Partition
ECHO 2. Delete Partition
ECHO 3.
ECHO 4. 
ECHO 5. Show Partition Informations
ECHO 6. Scan Partition Errors
ECHO 7. NBD Server (Only to access PS2 HDD from network)
"%~dp0BAT\Diagbox" gd 06
ECHO 8. Hack your HDD To PS2 Format (Exploit Temporarily BOOT From wLaunchELF)
"%~dp0BAT\Diagbox" gd 0c
ECHO 9. Format HDD To PS2 Format
"%~dp0BAT\Diagbox" gd 0f
ECHO.
ECHO 10. Back
ECHO 11. Back to main menu
ECHO 12. Exit
ECHO.
echo.------------------------------------------
set /p choice="Select Option:"

if "%choice%"=="1"  (goto CreatePART)
if "%choice%"=="2"  (goto DeletePART)

if "%choice%"=="5"  (goto ShowPartitionInfos) 
if "%choice%"=="6"  (goto DIAGPARTERROR)
if "%choice%"=="7"  (goto NBDServer)
if "%choice%"=="8"  (goto hackHDDtoPS2)
if "%choice%"=="9"  (goto formatHDDtoPS2)
if "%choice%"=="10" (goto AdvancedMenu)
if "%choice%"=="11" (goto mainmenu)
if "%choice%"=="12" exit

(goto HDDManagementMenu)

:ShowPartitionInfos
"%~dp0BAT\Diagbox" gd 0f
cd /d "%~dp0"
cls
title PFS BatchKit Manager v1.0.8 By GDX
echo.Welcome in PFS BatchKit Manager v1.0.8 By GDX
endlocal
endlocal
setlocal EnableDelayedExpansion
setlocal EnableExtensions
echo.------------------------------------------
ECHO Partition Informations
ECHO.
ECHO 1. Show PS1 Games Partitions Table
ECHO 2. Show PS2 Games Partitions Table
ECHO 3. Show System Partitions Table
ECHO 4. 
ECHO 5.
ECHO 6.
ECHO 7.
ECHO 8.
ECHO 9.
ECHO.
ECHO 10. Back
ECHO 11. Back to main menu
ECHO 12. Exit
ECHO.
echo.------------------------------------------
set /p choice="Select Option:"

if "%choice%"=="1" set ShowPS1GameList=yes & (goto partitionGameList)
if "%choice%"=="2" set ShowPS2GameList=yes & (goto partitionGameList)
if "%choice%"=="3" (goto partitionSystemList)

if "%choice%"=="10" (goto HDDManagementMenu)
if "%choice%"=="11" (goto mainmenu)
if "%choice%"=="12" exit

(goto ShowPartitionInfos)

:NBDServer
"%~dp0BAT\Diagbox" gd 0f
cd /d "%~dp0"
cls
title PFS BatchKit Manager v1.0.8 By GDX
echo.Welcome in PFS BatchKit Manager v1.0.8 By GDX
endlocal
endlocal
setlocal EnableDelayedExpansion
setlocal EnableExtensions
echo.------------------------------------------
ECHO Network block device Server
ECHO.
ECHO 1. Mount Device 
ECHO 2. Umount Device
ECHO 3. Show list of mounted devices
ECHO 4.
ECHO 5.
ECHO 6.
ECHO 7.
ECHO 8. Install/Update NBD Driver
ECHO 9. Uninstall NBD Driver
ECHO.
ECHO 10. Back
ECHO 11. Back to main menu
ECHO 12. Exit
ECHO.
echo.------------------------------------------
set /p choice="Select Option:"

if "%choice%"=="1" (
echo\
echo\
set /p nbdip="Enter the ip of your PS2 NBD Server:"
cls
echo Connection to the server 
echo Please wait...
echo\
"%~dp0BAT\wnbd-client.exe" map PS2HDD !nbdip!
echo\
"%~dp0BAT\Diagbox" gd 03
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD"
"%~dp0BAT\Diagbox" gd 07
echo\
pause
)

if "%choice%"=="2" cls & "%~dp0BAT\wnbd-client.exe" unmap PS2HDD & echo\ & echo\ & pause
if "%choice%"=="3" cls & "%~dp0BAT\wnbd-client.exe" list & echo\ & echo\ & pause


if "%choice%"=="8"  (goto InstallNBDDriver)
if "%choice%"=="9" ( 
cls
echo\
echo Are you sure you want to uninstall the drivers?
echo\
choice /c YN 
if errorlevel 2 (goto NBDServer)

"%~dp0BAT\wnbd-client.exe" uninstall-driver

echo\ 
pause
)

if "%choice%"=="10" (goto HDDManagementMenu)
if "%choice%"=="11" (goto mainmenu)
if "%choice%"=="12" exit

(goto NBDServer)

REM ############################################################################################################################################################
:TransferPS2Games

rem **********************************************************************
rem *
rem * HDLBATCH 1.15
rem *
rem **********************************************************************
rem * DATE: 02-JAN-2020
rem * 
rem * Created and tested on a Windows 10 machine
rem * Based on a batch file "HDL_HDD_Batcher" by Dekkit that calls an
rem * older version of HDL DUMP: HDL_DUMP_090.EXE
rem *
rem * Format your PS2 HDD using uLaunch and then connect it to your PC
rem * either directly or using a USB adapter. Place this batch file along
rem * with HDL_DUMP.EXE (0.9.2) in the same directory as all your games
rem * (either CUE/BIN or ISO files).
rem * 
rem * Right click on this batch file and select "Run as Administrator"
rem * since it calls HDL_DUMP.EXE (0.9.2), which requires access to
rem * hardware. Then follow the prompts.
rem *
rem * When you are truly ready to install, edit the OPTIONS section below
rem * and run the batch file as directed above.
rem *
rem * Game files may be prefixed with GAME ID as (sometimes) required by
rem * certain version of  OPL Manager. In such cases, the GAME ID will be
rem * stripped from the file name and the remaining portion (excluding
rem * file extension) will be used as the game title.
rem *
rem * If gameid.txt" is found, then the HDLBATCH will use the first-found
rem * occurrence of a matched game title, falling back on the file name
rem * if no match is found. The format of the gameid.txt" file is:
rem *
rem * SABC_XXX.YY Tile of Game
rem * 
rem * where SABC is the developer/region code, and XXX.YY is the GAME ID
rem *
rem * Thanks to Wizard 0f 0z et. al, and AKuHAK for HDLDUMP
rem * (HDL_DUMP sources at: https://www.github.com/AKuHAK/hdl-dump)
rem *
rem * Hanst3r
rem *
rem **********************************************************************
rem * EXAMPLE 
rem **********************************************************************
rem * FILE:	SCUS_973.28.Gran Turismo 4.iso
rem * TARGET:	hdd1:
rem *
rem * hdl_dump inject_dvd hdd1: "Gran Turismo 4" "SCUS_973.28.Gran Turismo 4.iso" "SCUS_973.28" *u4
rem **********************************************************************



rem **********************************************************************
rem OPTIONS:
rem **********************************************************************
rem 	set TEST=NO			(all caps) do real install
rem	set TEST=<anything else>	only print installation info

set TEST=NO

rem **********************************************************************
rem * NOTHING TO EDIT BELOW THIS LINE

cls
mkdir "%~dp0CD-DVD" >nul 2>&1
mkdir "%~dp0TMP" >nul 2>&1
cd /d "%~dp0CD-DVD"

del gameid.txt
REM copy "%~dp0BAT\boot.kelf" "%~dp0CD-DVD" >nul 2>&1

copy "%~dp0BAT\DB\gameidPS2ENG.txt" "%~dp0CD-DVD\gameid.txt" >nul 2>&1
copy "%~dp0BAT\hdl_dump.exe" "%~dp0CD-DVD" >nul 2>&1
REM copy "%~dp0BAT\hdl_dump_093.exe" "%~dp0CD-DVD\hdl_dump.exe"
cls

if "%TEST%"=="NO" (

"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo Scanning for Playstation 2 HDDs:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD"
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD" | "%~dp0BAT\busybox" cut -c2-6 > "%~dp0TMP\hdl-hdd.txt"

set /P @hdl_path=<"%~dp0TMP\hdl-hdd.txt"
::del "%~dp0TMP\hdl-hdd.txt" >nul 2>&1
IF "!@hdl_path!"=="" ( 
"%~dp0BAT\Diagbox" gd 0c
		echo         Playstation 2 HDD Not Detected
		echo         Drive Must Be Formatted First
		echo\
		echo\
"%~dp0BAT\Diagbox" gd 07
		rmdir /Q/S "%~dp0TMP" >nul 2>&1
		del info.sys >nul 2>&1     
		pause & (goto mainmenu)
	)
)

"%~dp0BAT\Diagbox" gd 0e
echo\
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 07

set usedb=no
if exist gameid.txt (
	echo.
	echo Game title database found.
	choice /c YN /m "Use titles from database? "
	if errorlevel 2 ( set usedb=no) else ( set usedb=yes)
	
    ) else (
	"%~dp0BAT\Diagbox" gd 0e
	echo.
	echo NOTE: No game title database found. Using file names as titles.
	"%~dp0BAT\Diagbox" gd 07
	pause
)

IF %usedb%==yes (

echo\
echo\
echo Choose the titles language of the games list
echo\
echo Some games have their own title in several languages for example:
echo English = The Simpsons Game
echo French  = Les Simpson le jeu
"%~dp0BAT\Diagbox" gd 06
echo NOTE: Some titles are not translated
"%~dp0BAT\Diagbox" gd 07
echo\
echo 1 English
echo 2 French
echo\
CHOICE /C 12 /M "Select Option:"
if errorlevel 1 set language=english
if errorlevel 2 set language=french
REM if errorlevel 3 set language=spanish

IF !language!==english (
copy "%~dp0BAT\DB\gameidPS2ENG.txt" "%~dp0CD-DVD\gameid.txt" >nul 2>&1
echo English Language selected
  )
   
IF !language!==french (
copy "%~dp0BAT\DB\gameidPS2FRA.txt" "%~dp0CD-DVD\gameid.txt" >nul 2>&1
echo French Language selected
  )
   
REM IF !language!==spanish (
REM setlocal DisableDelayedExpansion
REM copy "%~dp0BAT\DB\gameidPS2SPA.txt" "%~dp0CD-DVD\gameid.txt" >nul 2>&1
REM echo Spanish Language selected!
REM endlocal
REM   )
)
echo ----------------------------------------------------
echo\
echo Create cheats.CHT For your games with Mastercode?
"%~dp0BAT\Diagbox" gd 06
echo It is recommended to create the cheat files now
"%~dp0BAT\Diagbox" gd 07
echo\
CHOICE /C YN /M "Select Option:"
if errorlevel 1 set CreateCHT=yes
if errorlevel 2 set CreateCHT=no

IF !CreateCHT!==yes (
echo Creating .CHT Please wait...
cd /d "%~dp0" & copy "%~dp0BAT\make_cheat_mastercode.bat" "%~dp0" >nul & "%~dp0BAT\busybox" sed -i "$aexit" "make_cheat_mastercode.bat" | START /wait /MIN CMD.EXE /C make_cheat_mastercode.bat & del make_cheat_mastercode.bat
copy "%~dp0BAT\hdl_dump.exe" "%~dp0CD-DVD" >nul 2>&1
echo Don't forget to transfer your .CHTs to the HDD
)

echo ----------------------------------------------------
REM %~dp0BAT\7z.exe x -bso0 "%~dp0CD-DVD\*.zip"

REM CHECK IF .CUE IS MISSING FOR .BIN IF IT IS NOT DETECTED IT WILL BE CREATED
cd "%~dp0CD"
if not exist "%%~nf.cue" call "%~dp0BAT\cuemaker.bat"
move *.bin "%~dp0CD-DVD" >nul 2>&1
move *.cue "%~dp0CD-DVD" >nul 2>&1
move *.iso "%~dp0CD-DVD" >nul 2>&1

cd "%~dp0DVD"
move *.iso "%~dp0CD-DVD" >nul 2>&1
cd "%~dp0CD-DVD"

set /a gamecount=0
for %%f in (*.iso *.cue *.nrg *.gi *.iml) do (
	set /a gamecount+=1
    echo.
	echo.
	echo !gamecount! - %%f

	setlocal disabledelayedexpansion
	set filename=%%f
	for /f "tokens=1,2,3,4,5*" %%i in ('hdl_dump cdvd_info2 ".\%%f"') do (

		set fname=%%~nf

		setlocal enabledelayedexpansion
		set fnheader=!fname:~0,11!

		if "!fnheader!"==%%l (
			set title=!fname:~12!
		) else (
			if "!fnheader!"==%%m ( set title=!fname:~12!) else ( set title=!fname!)
		)

		set disctype=unknown
		if "%%i"=="CD" ( set disctype=inject_cd && set gameidtmp=%%~l)
		if "%%i"=="DVD" ( set disctype=inject_dvd && set gameidtmp=%%~l)
		if "%%i"=="dual-layer" ( if "%%j"=="DVD" ( set disctype=inject_dvd && set gameidtmp=%%~m))
		echo !gameidtmp! > "%~dp0TMP\gameidtmp.txt"
		"%~dp0BAT\busybox" sed -i "s/\s*$//" "%~dp0TMP\gameidtmp.txt"
		set /P gameid=<"%~dp0TMP\gameidtmp.txt"
		
		if "!disctype!"=="unknown" (
		
		"%~dp0BAT\Diagbox" gd 0c
		echo	WARNING: Unable to determine disc type^! File ignored.
	    "%~dp0BAT\Diagbox" gd 07
		
		) else (

			if "!usedb!"=="yes" (

				set "dbtitle="
				for /f "tokens=1*" %%A in ( 'findstr !gameid! gameid.txt' ) do (
					if not defined dbtitle set dbtitle=%%B
				)

				if defined dbtitle (

					if "!dbtitle:~-1,1!"==" " (
						set title=!dbtitle:~0,-1!
					) else (
						set title=!dbtitle!
					)

				)
			)

			echo 	Install type: !disctype!	ID: !gameid!
			echo 	Title: !title!
			"%~dp0BAT\Diagbox" gd 0d
			if "%TEST%"=="NO" hdl_dump !disctype! !@hdl_path! "!title!" "!filename!" *u4
			"%~dp0BAT\Diagbox" gd 07
		)
		endlocal
		
	)
	endlocal
	
)
endlocal
echo\

cd "%~dp0CD-DVD"
move *.bin "%~dp0CD" >nul 2>&1
move *.cue "%~dp0CD" >nul 2>&1
move *.iso "%~dp0DVD" >nul 2>&1

cd "%~dp0"
rmdir /Q/S "%~dp0TMP" >nul 2>&1
rmdir /Q/S "%~dp0CD-DVD" >nul 2>&1

echo\
pause & (goto mainmenu)

REM ########################################################################################################################################################################
:TransferAPPSARTCFGCHTTHMVMC

cd /d "%~dp0"
cls

mkdir "%~dp0TMP" >nul 2>&1
"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo %HDD_SCAN%
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD"
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD" | "%~dp0BAT\busybox" cut -c2-6 > "%~dp0TMP\hdl-hdd.txt"
"%~dp0BAT\busybox" sed -i "s/hdd/\\\\.\\\PhysicalDrive/g; s/://g" "%~dp0TMP\hdl-hdd.txt"

set /P @hdl_path=<"%~dp0TMP\hdl-hdd.txt"
REM del "%~dp0TMP\hdl-hdd.txt" >nul 2>&1
IF "!@hdl_path!"=="" ( 
"%~dp0BAT\Diagbox" gd 0c
		echo         Playstation 2 HDD Not Detected
		echo         Drive Must Be Formatted First
		echo\
		echo\
"%~dp0BAT\Diagbox" gd 07
		rmdir /Q/S "%~dp0TMP" >nul 2>&1
		del info.sys >nul 2>&1
	    pause & (goto mainmenu)
	)
		
"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo %Transfer% Applications: [APPS]
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) %YES%
"%~dp0BAT\Diagbox" gd 0c
echo         2) %NO%
"%~dp0BAT\Diagbox" gd 0e
echo		3) Yes Create title.cfg for each ELF To launch APPS from OPL
"%~dp0BAT\Diagbox" gd 07
echo\
CHOICE /C 123 /M %BASIC_CHOICE%

IF ERRORLEVEL 1 set @pfs_apps=yes
IF ERRORLEVEL 2 set @pfs_apps=no
IF ERRORLEVEL 3 set @pfs_apps=yes & copy "%~dp0BAT\make_title_cfg.bat" "%~dp0" >nul & call make_title_cfg.bat & del make_title_cfg.bat

"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo %Transfer% Artworks: [ART]
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) %YES%
"%~dp0BAT\Diagbox" gd 0c
echo         2) %NO%
echo\
"%~dp0BAT\Diagbox" gd 07
CHOICE /C 12 /M %BASIC_CHOICE%

IF ERRORLEVEL 1 set @pfs_art=yes
IF ERRORLEVEL 2 set @pfs_art=no


"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo %Transfer% Configs: [CFG]
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) %YES%
"%~dp0BAT\Diagbox" gd 0c
echo         2) %NO%
"%~dp0BAT\Diagbox" gd 07
echo\
CHOICE /C 12 /M %BASIC_CHOICE%

IF ERRORLEVEL 1 set @pfs_cfg=yes
IF ERRORLEVEL 2 set @pfs_cfg=no


"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo %Transfer% Cheats: [CHT]
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) %YES%
"%~dp0BAT\Diagbox" gd 0c
echo         2) %NO%
"%~dp0BAT\Diagbox" gd 07
echo\
CHOICE /C 12 /M %BASIC_CHOICE%

IF ERRORLEVEL 1 set @pfs_cht=yes
IF ERRORLEVEL 2 set @pfs_cht=no


"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo %Transfer% Virtual Memory Cards: [VMC]
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) %YES%
"%~dp0BAT\Diagbox" gd 0c
echo         2) %NO%
"%~dp0BAT\Diagbox" gd 07
echo\
CHOICE /C 123 /M %BASIC_CHOICE%

IF ERRORLEVEL 1 set @pfs_vmc=yes
IF ERRORLEVEL 2 set @pfs_vmc=no

"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo %Transfer% Themes: [THM]
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) %YES%
"%~dp0BAT\Diagbox" gd 0c
echo         2) %NO%
"%~dp0BAT\Diagbox" gd 07
echo\
CHOICE /C 12 /M %BASIC_CHOICE%

IF ERRORLEVEL 1 set @pfs_thm=yes
IF ERRORLEVEL 2 set @pfs_thm=no

"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo %Transfer% POPS Virtual Memory Cards:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) %YES%
"%~dp0BAT\Diagbox" gd 0c
echo         2) %NO%
"%~dp0BAT\Diagbox" gd 07
echo\
CHOICE /C 12 /M %BASIC_CHOICE%

IF ERRORLEVEL 1 set @pfs_popvmc=yes
IF ERRORLEVEL 2 set @pfs_popvmc=no

"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo %SEARCHING_OPLPART% [%OPLPART%]
echo ----------------------------------------------------

	echo device !@hdl_path! > "%~dp0TMP\pfs-prt.txt"
	echo ls -l >> "%~dp0TMP\pfs-prt.txt"
	echo exit >> "%~dp0TMP\pfs-prt.txt"
	type "%~dp0TMP\pfs-prt.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-prt.log"
	"%~dp0BAT\busybox" cat "%~dp0TMP\pfs-prt.log" | "%~dp0BAT\busybox" grep "+OPL" | "%~dp0BAT\busybox" sed "s/.*+OPL/+OPL/" | "%~dp0BAT\busybox" tr -d " " | "%~dp0BAT\busybox" head -1 | "%~dp0BAT\busybox" sed -e "s/@/\//g" > "%~dp0TMP\hdd-prt.txt"
	set /P @hdd_avl=<"%~dp0TMP\hdd-prt.txt"
	del "%~dp0TMP\pfs-prt.txt" "%~dp0TMP\pfs-prt.log" >nul 2>&1 "%~dp0TMP\hdd-prt.txt"

	IF "!@hdd_avl!"=="+OPL/" (
	"%~dp0BAT\Diagbox" gd 0a
		echo         %OPLPART% - %DETECTED_OPLPART%
		"%~dp0BAT\Diagbox" gd 07
		) else (
		"%~dp0BAT\Diagbox" gd 0c
		echo         %OPLPART% - %MISSING_OPLPART%
		"%~dp0BAT\Diagbox" gd 07
		echo         %FORMAT_OPLPART%
		echo\
		echo\
		rmdir /Q/S "%~dp0TMP" >nul 2>&1
		del info.sys >nul 2>&1
	    pause & (goto mainmenu)
		)

echo\
echo\
pause
cls
setlocal DisableDelayedExpansion

REM OPL APPS
IF %@pfs_apps%==yes (

echo\
echo\
echo %INSTALLING% Applications [APPS]
echo ----------------------------------------------------
echo\

IF /I EXIST "%~dp0APPS\*" (
	cd "%~dp0APPS"
	echo         Creating Que

	REM MOUNT OPL

	echo device %@hdl_path% > "%~dp0TMP\pfs-apps.txt"
	echo mount %OPLPART% >> "%~dp0TMP\pfs-apps.txt"

	REM PARENT DIR (OPL\APPS)

	echo mkdir APPS >> "%~dp0TMP\pfs-apps.txt"
	echo cd APPS >> "%~dp0TMP\pfs-apps.txt"
	
    REM APPS FILES (OPL\APPS\files.xxx)
	
 	for %%0 in (*) do (echo put "%%0") >> "%~dp0TMP\pfs-apps.txt"

	REM APPS 1 DIR (OPL\APPS\APP)

	for /D %%a in (*) do (
	echo mkdir "%%a" >> "%~dp0TMP\pfs-apps.txt"
	echo lcd "%%a" >> "%~dp0TMP\pfs-apps.txt"
 	echo cd "%%a" >> "%~dp0TMP\pfs-apps.txt"
 	cd "%%a"

	REM APPS FILES (OPL\APPS\APP\files.xxx)

 	for %%1 in (*) do (echo put "%%1") >> "%~dp0TMP\pfs-apps.txt"

	REM APPS 2 SUBDIR (OPL\APPS\APP\SUBDIR)

	for /D %%b in (*) do (
	echo mkdir "%%b" >> "%~dp0TMP\pfs-apps.txt"
	echo lcd "%%b" >> "%~dp0TMP\pfs-apps.txt"
	echo cd "%%b" >> "%~dp0TMP\pfs-apps.txt"
	cd "%%b"

	REM APPS SUBDIR FILES (OPL\APPS\APP\SUBDIR\files.xxx)

	for %%2 in (*) do (echo put "%%2") >> "%~dp0TMP\pfs-apps.txt"
	
	REM APPS 3 SUBDIR (OPL\APPS\APP\SUBDIR\SUBDIR)

	for /D %%c in (*) do (
	echo mkdir "%%c" >> "%~dp0TMP\pfs-apps.txt"
	echo lcd "%%c" >> "%~dp0TMP\pfs-apps.txt"
	echo cd "%%c" >> "%~dp0TMP\pfs-apps.txt"
	cd "%%c"
	
	REM APPS SUBDIR FILES (OPL\APPS\APP\SUBDIR\SUBDIR\files.xxx)
	
	for %%3 in (*) do (echo put "%%3") >> "%~dp0TMP\pfs-apps.txt"
	
    REM APPS 4 SUBDIR (OPL\APPS\APP\SUBDIR\SUBDIR\SUBDIR\SUBDIR)

	for /D %%e in (*) do (
	echo mkdir "%%e" >> "%~dp0TMP\pfs-apps.txt"
	echo lcd "%%e" >> "%~dp0TMP\pfs-apps.txt"
	echo cd "%%e" >> "%~dp0TMP\pfs-apps.txt"
	cd "%%e"
	
	REM APPS SUBDIR FILES (OPL\APPS\APP\SUBDIR\SUBDIR\SUBDIR\files.xxx)
	
	for %%4 in (*) do (echo put "%%4") >> "%~dp0TMP\pfs-apps.txt"
	
	REM APPS 5 SUBDIR (OPL\APPS\APP\SUBDIR\SUBDIR\SUBDIR\SUBDIR\)

	for /D %%f in (*) do (
	echo mkdir "%%f" >> "%~dp0TMP\pfs-apps.txt"
	echo lcd "%%f" >> "%~dp0TMP\pfs-apps.txt"
	echo cd "%%f" >> "%~dp0TMP\pfs-apps.txt"
	cd "%%f"
	
	REM APPS SUBDIR FILES (OPL\APPS\APP\SUBDIR\SUBDIR\SUBDIR\SUBDIR\files.xxx)
	
	for %%5 in (*) do (echo put "%%5") >> "%~dp0TMP\pfs-apps.txt"
	
	REM APPS 6 SUBDIR (OPL\APPS\APP\SUBDIR\SUBDIR\SUBDIR\SUBDIR\)

	for /D %%g in (*) do (
	echo mkdir "%%g" >> "%~dp0TMP\pfs-apps.txt"
	echo lcd "%%g" >> "%~dp0TMP\pfs-apps.txt"
	echo cd "%%g" >> "%~dp0TMP\pfs-apps.txt"
	cd "%%g"
	
	REM APPS SUBDIR FILES (OPL\APPS\APP\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\files.xxx)
	
	for %%6 in (*) do (echo put "%%6") >> "%~dp0TMP\pfs-apps.txt"
	
	REM APPS 7 SUBDIR (OPL\APPS\APP\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\)

	for /D %%h in (*) do (
	echo mkdir "%%h" >> "%~dp0TMP\pfs-apps.txt"
	echo lcd "%%h" >> "%~dp0TMP\pfs-apps.txt"
	echo cd "%%h" >> "%~dp0TMP\pfs-apps.txt"
	cd "%%h"
	
	REM APPS SUBDIR FILES (OPL\APPS\APP\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\files.xxx)
	
	for %%7 in (*) do (echo put "%%7") >> "%~dp0TMP\pfs-apps.txt"
	
	REM APPS 8 SUBDIR (OPL\APPS\APP\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\)

	for /D %%i in (*) do (
	echo mkdir "%%i" >> "%~dp0TMP\pfs-apps.txt"
	echo lcd "%%i" >> "%~dp0TMP\pfs-apps.txt"
	echo cd "%%i" >> "%~dp0TMP\pfs-apps.txt"
	cd "%%i"
	
	REM APPS SUBDIR FILES (OPL\APPS\APP\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\files.xxx)
	
	for %%8 in (*) do (echo put "%%8") >> "%~dp0TMP\pfs-apps.txt"
	
	REM APPS 9 SUBDIR (OPL\APPS\APP\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\)

	for /D %%j in (*) do (
	echo mkdir "%%j" >> "%~dp0TMP\pfs-apps.txt"
	echo lcd "%%j" >> "%~dp0TMP\pfs-apps.txt"
	echo cd "%%j" >> "%~dp0TMP\pfs-apps.txt"
	cd "%%j"
	
	REM APPS SUBDIR FILES (OPL\APPS\APP\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\files.xxx)
	
	for %%9 in (*) do (echo put "%%9") >> "%~dp0TMP\pfs-apps.txt"
	
	REM EXIT SUBDIR

	echo lcd .. >> "%~dp0TMP\pfs-apps.txt"
	echo cd .. >> "%~dp0TMP\pfs-apps.txt"
	cd ..

	)
	
	echo lcd .. >> "%~dp0TMP\pfs-apps.txt"
	echo cd .. >> "%~dp0TMP\pfs-apps.txt"
 	cd ..
	
	)
	
	echo lcd .. >> "%~dp0TMP\pfs-apps.txt"
	echo cd .. >> "%~dp0TMP\pfs-apps.txt"
 	cd ..
	
	)
	
	echo lcd .. >> "%~dp0TMP\pfs-apps.txt"
	echo cd .. >> "%~dp0TMP\pfs-apps.txt"
 	cd ..

    )
	
	echo lcd .. >> "%~dp0TMP\pfs-apps.txt"
	echo cd .. >> "%~dp0TMP\pfs-apps.txt"
 	cd ..
	
	)
	
	echo lcd .. >> "%~dp0TMP\pfs-apps.txt"
	echo cd .. >> "%~dp0TMP\pfs-apps.txt"
 	cd ..
	
	)
	
	echo lcd .. >> "%~dp0TMP\pfs-apps.txt"
	echo cd .. >> "%~dp0TMP\pfs-apps.txt"
 	cd ..
	
	)
	
	echo lcd .. >> "%~dp0TMP\pfs-apps.txt"
	echo cd .. >> "%~dp0TMP\pfs-apps.txt"
 	cd ..
	
	)
	
	echo lcd .. >> "%~dp0TMP\pfs-apps.txt"
	echo cd .. >> "%~dp0TMP\pfs-apps.txt"
 	cd ..

	REM UNMOUNT OPL

	)
	echo umount >> "%~dp0TMP\pfs-apps.txt"
	echo exit >> "%~dp0TMP\pfs-apps.txt"

	echo         %INSTALLING% Que
	type "%~dp0TMP\pfs-apps.txt" | "%~dp0BAT\pfsshell" >nul 2>&1
	del "%~dp0TMP\pfs-apps.txt" >nul 2>&1
	
	echo         %CREAT_LOG%
	echo device %@hdl_path% > "%~dp0TMP\pfs-log.txt"
	echo mount %OPLPART% >> "%~dp0TMP\pfs-log.txt"
	echo cd APPS >> "%~dp0TMP\pfs-log.txt"
	echo ls -l >> "%~dp0TMP\pfs-log.txt"
	echo umount >> "%~dp0TMP\pfs-log.txt"
	echo exit >> "%~dp0TMP\pfs-log.txt"
	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
	mkdir "%~dp0LOG" >nul 2>&1
	"%~dp0BAT\busybox" grep -i -e "drwx" "%~dp0TMP\pfs-tmp.log" | "%~dp0BAT\busybox" sed -e "1,2d" > "%~dp0LOG\PFS-APPS.log"
	del "%~dp0TMP\pfs-log.txt" "%~dp0TMP\pfs-tmp.log" >nul 2>&1
	echo         APPS %COMPLETED%	
	cd "%~dp0"
	) else ( echo         APPS - %IS_EMPTY% )
)


REM OPL ARTWORK

IF %@pfs_art%==yes (

echo\
echo\
echo %INSTALLING% Artworks [ART]
echo ----------------------------------------------------
echo\

IF /I EXIST "%~dp0ART\*.*" (

	cd /d "%~dp0ART" & for %%F in ( "*.*" ) do if %%~zF==0 del "%%F"
	echo         Creating Que
	echo device %@hdl_path% > "%~dp0TMP\pfs-art.txt"
	echo mount %OPLPART% >> "%~dp0TMP\pfs-art.txt"
	echo mkdir ART >> "%~dp0TMP\pfs-art.txt"
	echo cd ART >> "%~dp0TMP\pfs-art.txt"
	for %%f in (*) do (echo put "%%f") >> "%~dp0TMP\pfs-art.txt"
	echo umount >> "%~dp0TMP\pfs-art.txt"
	echo exit >> "%~dp0TMP\pfs-art.txt"
	
	echo         %INSTALLING% Que
	type "%~dp0TMP\pfs-art.txt" | "%~dp0BAT\pfsshell" >nul 2>&1
	del "%~dp0TMP\pfs-art.txt" >nul 2>&1
	
	echo         %CREAT_LOG%
	echo device %@hdl_path% > "%~dp0TMP\pfs-log.txt"
	echo mount %OPLPART% >> "%~dp0TMP\pfs-log.txt"
	echo cd ART >> "%~dp0TMP\pfs-log.txt"
	echo ls -l >> "%~dp0TMP\pfs-log.txt"
	echo umount >> "%~dp0TMP\pfs-log.txt"
	echo exit >> "%~dp0TMP\pfs-log.txt"
	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
	mkdir "%~dp0LOG" >nul 2>&1
	"%~dp0BAT\busybox" grep -i -e ".png" -e ".jpg" "%~dp0TMP\pfs-tmp.log" > "%~dp0LOG\PFS-ART.log"
	del "%~dp0TMP\pfs-log.txt" "%~dp0TMP\pfs-tmp.log" >nul 2>&1
	echo         ART %COMPLETED%	
	cd "%~dp0"
	) else ( echo         ART - %IS_EMPTY% )
)


REM OPL CONFIGS

IF %@pfs_cfg%==yes (

echo\
echo\
echo %INSTALLING% Configs [CFG]
echo ----------------------------------------------------
echo\

IF /I EXIST "%~dp0CFG\*.*" (

	cd "%~dp0CFG"
	echo         Creating Que
	echo device %@hdl_path% > "%~dp0TMP\pfs-cfg.txt"
	echo mount %OPLPART% >> "%~dp0TMP\pfs-cfg.txt"
	echo mkdir CFG >> "%~dp0TMP\pfs-cfg.txt"
	echo cd CFG >> "%~dp0TMP\pfs-cfg.txt"
	for %%f in (*.cfg) do (echo put "%%f") >> "%~dp0TMP\pfs-cfg.txt"
	echo umount >> "%~dp0TMP\pfs-cfg.txt"
	echo exit >> "%~dp0TMP\pfs-cfg.txt"
	
	echo         %INSTALLING% Que
	type "%~dp0TMP\pfs-cfg.txt" | "%~dp0BAT\pfsshell" >nul 2>&1
	del "%~dp0TMP\pfs-cfg.txt" >nul 2>&1
	
	echo         %CREAT_LOG%
	echo device %@hdl_path% > "%~dp0TMP\pfs-log.txt"
	echo mount %OPLPART% >> "%~dp0TMP\pfs-log.txt"
	echo cd CFG >> "%~dp0TMP\pfs-log.txt"
	echo ls -l >> "%~dp0TMP\pfs-log.txt"
	echo umount >> "%~dp0TMP\pfs-log.txt"
	echo exit >> "%~dp0TMP\pfs-log.txt"
	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
	mkdir "%~dp0LOG" >nul 2>&1
	"%~dp0BAT\busybox" grep -i -e ".*\.cfg$" "%~dp0TMP\pfs-tmp.log" > "%~dp0LOG\PFS-CFG.log"
	del "%~dp0TMP\pfs-log.txt" "%~dp0TMP\pfs-tmp.log" >nul 2>&1
	echo         CFG %COMPLETED%	
	cd "%~dp0"
	) else ( echo         CFG - %CFG_EMPTY% )
)

REM OPL CHEATS

IF %@pfs_cht%==yes (

echo\
echo\
echo %INSTALLING% Cheats: [CHT]
echo ----------------------------------------------------
echo\

IF /I EXIST "%~dp0CHT\*.*" (

	cd "%~dp0CHT"
	echo         Creating Que
	echo device %@hdl_path% > "%~dp0TMP\pfs-cht.txt"
	echo mount %OPLPART% >> "%~dp0TMP\pfs-cht.txt"
	echo mkdir CHT >> "%~dp0TMP\pfs-cht.txt"
	echo cd CHT >> "%~dp0TMP\pfs-cht.txt"
	for %%f in (*.cht) do (echo put "%%f") >> "%~dp0TMP\pfs-cht.txt"
	echo umount >> "%~dp0TMP\pfs-cht.txt"
	echo exit >> "%~dp0TMP\pfs-cht.txt"
	
	echo         %INSTALLING% Que
	type "%~dp0TMP\pfs-cht.txt" | "%~dp0BAT\pfsshell" >nul 2>&1
	del "%~dp0TMP\pfs-cht.txt" >nul 2>&1
	
	echo         %CREAT_LOG%
	echo device %@hdl_path%  > "%~dp0TMP\pfs-log.txt"
	echo mount %OPLPART% >> "%~dp0TMP\pfs-log.txt"
	echo cd CHT >> "%~dp0TMP\pfs-log.txt"
	echo ls -l >> "%~dp0TMP\pfs-log.txt"
	echo umount >> "%~dp0TMP\pfs-log.txt"
	echo exit >> "%~dp0TMP\pfs-log.txt"
	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
	mkdir "%~dp0LOG" >nul 2>&1
	"%~dp0BAT\busybox" grep -i -e ".*\.cht$" "%~dp0TMP\pfs-tmp.log" > "%~dp0LOG\PFS-CHT.log"
	del "%~dp0TMP\pfs-log.txt" "%~dp0TMP\pfs-tmp.log" >nul 2>&1
	echo         CHT %COMPLETED%	
	cd "%~dp0"
	) else ( echo         CHT - %CHT_EMPTY% )
)


REM OPL VMC

IF %@pfs_vmc%==yes (

echo\
echo\
echo %INSTALLING% Virtual Memory Card: [VMC]
echo ----------------------------------------------------
echo\

IF /I EXIST "%~dp0VMC\*.*" (

	cd "%~dp0VMC"
	echo         Creating Que
	echo device %@hdl_path% > "%~dp0TMP\pfs-vmc.txt"
	echo mount %OPLPART% >> "%~dp0TMP\pfs-vmc.txt"
	echo mkdir VMC >> "%~dp0TMP\pfs-vmc.txt"
	echo cd VMC >> "%~dp0TMP\pfs-vmc.txt"
	for %%f in (*.bin) do (echo put "%%f") >> "%~dp0TMP\pfs-vmc.txt"
	echo umount >> "%~dp0TMP\pfs-vmc.txt"
	echo exit >> "%~dp0TMP\pfs-vmc.txt"
	
	echo         %INSTALLING% Que
	type "%~dp0TMP\pfs-vmc.txt" | "%~dp0BAT\pfsshell" >nul 2>&1
	del "%~dp0TMP\pfs-vmc.txt" >nul 2>&1
	
	echo         %CREAT_LOG%
	echo device %@hdl_path% > "%~dp0TMP\pfs-log.txt"
	echo mount %OPLPART% >> "%~dp0TMP\pfs-log.txt"
	echo cd VMC >> "%~dp0TMP\pfs-log.txt"
	echo ls -l >> "%~dp0TMP\pfs-log.txt"
	echo umount >> "%~dp0TMP\pfs-log.txt"
	echo exit >> "%~dp0TMP\pfs-log.txt"
	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
	mkdir "%~dp0LOG" >nul 2>&1
	"%~dp0BAT\busybox" grep -i -e ".bin" "%~dp0TMP\pfs-tmp.log" > "%~dp0LOG\PFS-VMC.log"
	del "%~dp0TMP\pfs-log.txt" "%~dp0TMP\pfs-tmp.log" >nul 2>&1
	echo         VMC %COMPLETED%	
	cd "%~dp0"
	) else ( echo         VMC - %VMC_EMPTY% )
)


REM OPL THM

IF %@pfs_thm%==yes (

echo\
echo\
echo %INSTALLING% Themes: [THM]
echo ----------------------------------------------------
echo\

IF /I EXIST "%~dp0THM\*" (

	cd "%~dp0THM"
	echo         Creating Que

	REM MOUNT OPL

	echo device %@hdl_path% > "%~dp0TMP\pfs-thm.txt"
	echo mount %OPLPART% >> "%~dp0TMP\pfs-thm.txt"

	REM PARENT DIR (OPL\THM)

	echo mkdir THM >> "%~dp0TMP\pfs-thm.txt"
	echo cd THM >> "%~dp0TMP\pfs-thm.txt"

	REM THEME DIR (OPL\THM\THEME)

	for /D %%x in (*) do (
	echo mkdir "%%x" >> "%~dp0TMP\pfs-thm.txt"
	echo lcd "%%x" >> "%~dp0TMP\pfs-thm.txt"
 	echo cd "%%x" >> "%~dp0TMP\pfs-thm.txt"
 	cd "%%x"

	REM THEME FILES (OPL\THM\THEME\files.xxx)

 	for %%f in (*) do (echo put "%%f") >> "%~dp0TMP\pfs-thm.txt"

	REM THEME SUBDIR (OPL\THM\THEME\SUBDIR)

	for /D %%y in (*) do (
	echo mkdir "%%y" >> "%~dp0TMP\pfs-thm.txt"
	echo lcd "%%y" >> "%~dp0TMP\pfs-thm.txt"
	echo cd "%%y" >> "%~dp0TMP\pfs-thm.txt"
	cd "%%y"

	REM THEME SUBDIR FILES (OPL\THM\THEME\SUBDIR\files.xxx)

	for %%l in (*) do (echo put "%%l") >> "%~dp0TMP\pfs-thm.txt"

	REM EXIT SUBDIR

	echo lcd .. >> "%~dp0TMP\pfs-thm.txt"
	echo cd .. >> "%~dp0TMP\pfs-thm.txt"
	cd ..

	)
	
	echo lcd .. >> "%~dp0TMP\pfs-thm.txt"
	echo cd .. >> "%~dp0TMP\pfs-thm.txt"
 	cd ..

	REM UNMOUNT OPL

	)
	echo umount >> "%~dp0TMP\pfs-thm.txt"
	echo exit >> "%~dp0TMP\pfs-thm.txt"

	echo         %INSTALLING% Que
	type "%~dp0TMP\pfs-thm.txt" | "%~dp0BAT\pfsshell" >nul 2>&1
	del "%~dp0TMP\pfs-thm.txt" >nul 2>&1
	
	echo         %CREAT_LOG%
	echo device %@hdl_path% > "%~dp0TMP\pfs-log.txt"
	echo mount %OPLPART% >> "%~dp0TMP\pfs-log.txt"
	echo cd THM >> "%~dp0TMP\pfs-log.txt"
	echo ls -l >> "%~dp0TMP\pfs-log.txt"
	echo umount >> "%~dp0TMP\pfs-log.txt"
	echo exit >> "%~dp0TMP\pfs-log.txt"
	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
	mkdir "%~dp0LOG" >nul 2>&1
	"%~dp0BAT\busybox" grep -i -e "drwx" "%~dp0TMP\pfs-tmp.log" | "%~dp0BAT\busybox" sed -e "1,2d" > "%~dp0LOG\PFS-THM.log"
	del "%~dp0TMP\pfs-log.txt" "%~dp0TMP\pfs-tmp.log" >nul 2>&1
	echo         THM %COMPLETED%	
	cd "%~dp0"
	) else ( echo         THM - %IS_EMPTY% )
)

IF %@pfs_popvmc%==yes (

echo\
echo\
echo %INSTALLING% POPS-VMC:
echo ----------------------------------------------------
echo\

IF /I EXIST "%~dp0POPS\VMC\*" (

	cd "%~dp0POPS\VMC"
	echo         Creating Que

	REM MOUNT __common

	echo device %@hdl_path% > "%~dp0TMP\pfs-popsmvc.txt"
	echo mount __common >> "%~dp0TMP\pfs-popsmvc.txt"

	REM PARENT DIR (__common\POPS)

	echo mkdir POPS >> "%~dp0TMP\pfs-popsmvc.txt"
	echo cd POPS >> "%~dp0TMP\pfs-popsmvc.txt"

	REM POPS DIR (__common\POPS\SCES_XXX.XX)

	for /D %%x in (*) do (
	echo mkdir "%%x" >> "%~dp0TMP\pfs-popsmvc.txt"
	echo lcd "%%x" >> "%~dp0TMP\pfs-popsmvc.txt"
 	echo cd "%%x" >> "%~dp0TMP\pfs-popsmvc.txt"
 	cd "%%x"

	REM THEME FILES (__common\POPS\SCES_XXX.XX\Files.xxx)

 	for %%f in (*) do (echo put "%%f") >> "%~dp0TMP\pfs-popsmvc.txt"
	
	echo lcd .. >> "%~dp0TMP\pfs-popsmvc.txt"
	echo cd .. >> "%~dp0TMP\pfs-popsmvc.txt"
 	cd ..

    )
   
	echo umount >> "%~dp0TMP\pfs-popsmvc.txt"
	echo exit >> "%~dp0TMP\pfs-popsmvc.txt"

	echo         %INSTALLING% Que
	type "%~dp0TMP\pfs-popsmvc.txt" | "%~dp0BAT\pfsshell" >nul 2>&1
	del "%~dp0TMP\pfs-popsmvc.txt" >nul 2>&1
	
	echo         %CREAT_LOG%
	echo device %@hdl_path% > "%~dp0TMP\pfs-log.txt"
	echo mount __common >> "%~dp0TMP\pfs-log.txt"
	echo cd POPS >> "%~dp0TMP\pfs-log.txt"
	echo ls -l >> "%~dp0TMP\pfs-log.txt"
	echo umount >> "%~dp0TMP\pfs-log.txt"
	echo exit >> "%~dp0TMP\pfs-log.txt"
	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
	mkdir "%~dp0LOG" >nul 2>&1
	"%~dp0BAT\busybox" grep -i -e "drwx" "%~dp0TMP\pfs-tmp.log" | "%~dp0BAT\busybox" sed -e "1,2d" > "%~dp0LOG\PFS-POPS-VMC.log"
	del "%~dp0TMP\pfs-log.txt" "%~dp0TMP\pfs-tmp.log" >nul 2>&1
	echo         POPS-VMC %COMPLETED%	
	cd "%~dp0"
	) else ( echo         POPS-VMC - %IS_EMPTY% )
)

rmdir /Q/S "%~dp0TMP" >nul 2>&1
del info.sys >nul 2>&1

echo\
echo\
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo Installations %COMPLETED%
echo\
echo\
"%~dp0BAT\Diagbox" gd 07

endlocal
pause & (goto mainmenu)

REM ########################################################################################################################################################################
:TransferPS1Games

cd "%~dp0"
cls

mkdir "%~dp0TMP" >nul 2>&1
"%~dp0BAT\Diagbox" gd 0e

echo\
echo\
echo Scanning for Playstation 2 HDDs:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD"
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD" | "%~dp0BAT\busybox" cut -c2-6 > "%~dp0TMP\hdl-hdd.txt"
"%~dp0BAT\busybox" sed -i "s/hdd/\\\\.\\\PhysicalDrive/g; s/://g" "%~dp0TMP\hdl-hdd.txt"

set /P @hdl_path=<"%~dp0TMP\hdl-hdd.txt"
del "%~dp0TMP\hdl-hdd.txt" >nul 2>&1
IF "!@hdl_path!"=="" ( 
"%~dp0BAT\Diagbox" gd 0c
		echo         Playstation 2 HDD Not Detected
		echo         Drive Must Be Formatted First
		echo\
		echo\
"%~dp0BAT\Diagbox" gd 07
		rmdir /Q/S "%~dp0TMP" >nul 2>&1
		del info.sys >nul 2>&1
		pause & (goto mainmenu)
	)

"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo Transfer VCD:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) %YES%
"%~dp0BAT\Diagbox" gd 0c
echo         2) %NO%
"%~dp0BAT\Diagbox" gd 0e
echo         3) %YES% (Manually choose the partition where you want to install your .VCDs)
echo         4) %YES% (Install .VCD as partition for HDD-OSD)
echo\
"%~dp0BAT\Diagbox" gd 07
CHOICE /C 1234 /M "Select Option:"

IF ERRORLEVEL 4 (goto TransferPS1GamesHDDOSD)
IF ERRORLEVEL 1 set @pfs_pop=yes & set "choice=" & set popspartinstall=__.POPS
IF ERRORLEVEL 2 (goto mainmenu)
IF ERRORLEVEL 3 set @pfs_popmanually=yes

IF !@pfs_popmanually!==yes (
echo.
echo Choose the partition on which you want to install your .VCDs
echo By default it will be the partition __.POPS
echo.
echo 0.  __.POPS0
echo 1.  __.POPS1
echo 2.  __.POPS2
echo 3.  __.POPS3
echo 4.  __.POPS4
echo 5.  __.POPS5
echo 6.  __.POPS6
echo 7.  __.POPS7
echo 8.  __.POPS8
echo 9.  __.POPS9
echo 10. __.POPS
echo.

set choice=
set /p choice="Select Option:"
IF "!choice!"=="" (goto TransferPS1Games)

IF "!choice!"=="!choice!" set popspartinstall=__.POPS!choice!
IF "!choice!"=="10" set @pfs_pop=yes & set "choice=" & set popspartinstall=__.POPS

)

"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo Detecting POPS Partition:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 07
echo device !@hdl_path! > "%~dp0TMP\pfs-prt.txt"
echo ls -l >> "%~dp0TMP\pfs-prt.txt"
echo exit >> "%~dp0TMP\pfs-prt.txt"
type "%~dp0TMP\pfs-prt.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-prt.log"
"%~dp0BAT\busybox" cat "%~dp0TMP\pfs-prt.log" | "%~dp0BAT\busybox" grep -w "%popspartinstall%" | "%~dp0BAT\busybox" sed "s/.*%popspartinstall%/%popspartinstall%/" | "%~dp0BAT\busybox" tr -d " " | "%~dp0BAT\busybox" head -1 | "%~dp0BAT\busybox" sed -e "s/@/\//g" > "%~dp0TMP\hdd-prt.txt"
set /P @hdd_avl=<"%~dp0TMP\hdd-prt.txt"
REM del "%~dp0TMP\pfs-prt.txt" "%~dp0TMP\pfs-prt.log" >nul 2>&1 "%~dp0TMP\hdd-prt.txt"

IF "!@hdd_avl!"=="%popspartinstall%/" (
"%~dp0BAT\Diagbox" gd 0a
	echo          __.POPS!choice! - Partition Detected
	"%~dp0BAT\Diagbox" gd 07
	) else (
	"%~dp0BAT\Diagbox" gd 0c
	echo           __.POPS!choice! - Partition NOT Detected
	echo        Partition Must Be Formatted Or Created
	echo\
	echo\
	"%~dp0BAT\Diagbox" gd 07
	rmdir /Q/S "%~dp0TMP" >nul 2>&1
	del info.sys >nul 2>&1
	pause & (goto mainmenu)
	)

echo\
echo\
pause
cls
"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo Installing VCD:
echo ----------------------------------------------------
echo\
setlocal DisableDelayedExpansion

"%~dp0BAT\Diagbox" gd 07
IF /I EXIST "%~dp0POPS\*.VCD" (

	cd "%~dp0POPS" & rename "*.vcd" "*.VCD"
	echo         Creating Que
	echo device %@hdl_path% > "%~dp0TMP\pfs-pops.txt"
	echo mount %popspartinstall% >> "%~dp0TMP\pfs-pops.txt"
	for %%f in (*.VCD) do (echo put "%%f") >> "%~dp0TMP\pfs-pops.txt"
	echo umount >> "%~dp0TMP\pfs-pops.txt"
	echo exit >> "%~dp0TMP\pfs-pops.txt"
	
	echo         %INSTALLING% Que
	type "%~dp0TMP\pfs-pops.txt" | "%~dp0BAT\pfsshell" >nul 2>&1
	del "%~dp0TMP\pfs-pops.txt" >nul 2>&1

	echo         %CREAT_LOG%
	echo device %@hdl_path% > "%~dp0TMP\pfs-log.txt"
	echo mount %popspartinstall% >> "%~dp0TMP\pfs-log.txt"
	echo ls -l >> "%~dp0TMP\pfs-log.txt"
	echo umount >> "%~dp0TMP\pfs-log.txt"
	echo exit >> "%~dp0TMP\pfs-log.txt"
	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
	mkdir "%~dp0LOG" >nul 2>&1
	"%~dp0BAT\busybox" grep -i -e ".*\.VCD$" "%~dp0TMP\pfs-tmp.log" > "%~dp0LOG\PFS-POPS%choice%.log"
	del "%~dp0TMP\pfs-log.txt" "%~dp0TMP\pfs-tmp.log" >nul 2>&1
	echo         POPS %COMPLETED%	
	cd "%~dp0"
	) else ( echo         .VCD - %IS_EMPTY% )

endlocal
rmdir /Q/S "%~dp0TMP" >nul 2>&1
del info.sys >nul 2>&1
"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo Installation Completed...
echo\
echo\
"%~dp0BAT\Diagbox" gd 07

pause & (goto mainmenu)

REM ########################################################################################################################################################################
:BackupARTCFGCHTVMC

cd "%~dp0"
cls

rmdir /Q/S "%~dp0TMP" >nul 2>&1
MD "%~dp0TMP" >nul 2>&1

"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo Scanning for Playstation 2 HDDs:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD"
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD" | "%~dp0BAT\busybox" cut -c2-6 > "%~dp0TMP\hdl-hdd.txt"
"%~dp0BAT\busybox" sed -i "s/hdd/\\\\.\\\PhysicalDrive/g; s/://g" "%~dp0TMP\hdl-hdd.txt"

set /P @hdl_path=<"%~dp0TMP\hdl-hdd.txt"
del "%~dp0TMP\hdl-hdd.txt" >nul 2>&1
IF "!@hdl_path!"=="" ( 
"%~dp0BAT\Diagbox" gd 0c
		echo         Playstation 2 HDD Not Detected
		echo         Drive Must Be Formatted First
		echo\
		echo\
"%~dp0BAT\Diagbox" gd 07
		rmdir /Q/S "%~dp0TMP" >nul 2>&1
		del info.sys >nul 2>&1
		pause & (goto mainmenu)
	)
"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo Extract Artwork:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) %YES%
"%~dp0BAT\Diagbox" gd 0c
echo         2) %NO%
"%~dp0BAT\Diagbox" gd 07
echo\
CHOICE /C 12 /M "Select Option:"

IF ERRORLEVEL 1 set @pfs_art=yes
IF ERRORLEVEL 2 set @pfs_art=no

echo\
echo\
echo Extract Configs:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) %YES%
"%~dp0BAT\Diagbox" gd 0c
echo         2) %NO%
"%~dp0BAT\Diagbox" gd 07
echo\
CHOICE /C 12 /M "Select Option:"

IF ERRORLEVEL 1 set @pfs_cfg=yes
IF ERRORLEVEL 2 set @pfs_cfg=no

echo\
echo\
echo Extract Cheats:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) %YES%
"%~dp0BAT\Diagbox" gd 0c
echo         2) %NO%
"%~dp0BAT\Diagbox" gd 07
echo\
CHOICE /C 12 /M "Select Option:"

IF ERRORLEVEL 1 set @pfs_cht=yes
IF ERRORLEVEL 2 set @pfs_cht=no

echo\
echo\
echo Extract OPL VMCs:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) %YES%
"%~dp0BAT\Diagbox" gd 0c
echo         2) %NO%
"%~dp0BAT\Diagbox" gd 07
echo\
CHOICE /C 12 /M "Select Option:"

IF ERRORLEVEL 1 set @pfs_vmc=yes
IF ERRORLEVEL 2 set @pfs_vmc=no

echo\
echo\
echo Extract POPS VMCs:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) Yes
"%~dp0BAT\Diagbox" gd 0c
echo         2) No
echo\
"%~dp0BAT\Diagbox" gd 07
CHOICE /C 12 /M "Select Option:"

IF ERRORLEVEL 1 set @pfs_popvmc=yes
IF ERRORLEVEL 2 set @pfs_popvmc=no

"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo Detecting %OPLPART% Partition:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 07

	echo device !@hdl_path! > "%~dp0TMP\pfs-prt.txt"
	echo ls -l >> "%~dp0TMP\pfs-prt.txt"
	echo exit >> "%~dp0TMP\pfs-prt.txt"
	type "%~dp0TMP\pfs-prt.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-prt.log"
	"%~dp0BAT\busybox" cat "%~dp0TMP\pfs-prt.log" | "%~dp0BAT\busybox" grep "+OPL" | "%~dp0BAT\busybox" sed "s/.*+OPL/+OPL/" | "%~dp0BAT\busybox" tr -d " " | "%~dp0BAT\busybox" head -1 | "%~dp0BAT\busybox" sed -e "s/@/\//g" > "%~dp0TMP\hdd-prt.txt"
	set /P @hdd_avl=<"%~dp0TMP\hdd-prt.txt"
	del "%~dp0TMP\pfs-prt.txt" "%~dp0TMP\pfs-prt.log" >nul 2>&1 "%~dp0TMP\hdd-prt.txt"

	IF "!@hdd_avl!"=="+OPL/" (
	"%~dp0BAT\Diagbox" gd 0a
		echo         %OPLPART% - Partition Detected
		"%~dp0BAT\Diagbox" gd 07
		) else (
		"%~dp0BAT\Diagbox" gd 0c
		echo         %OPLPART% - Partition NOT Detected
		echo         Partition Must Be Formatted Or Created
		echo\
		echo\
		"%~dp0BAT\Diagbox" gd 07
		rmdir /Q/S "%~dp0TMP" >nul 2>&1
		del info.sys >nul 2>&1
		pause & (goto mainmenu)
		)

echo\
echo\
pause
cls
setlocal DisableDelayedExpansion
IF %@pfs_art%==yes (

echo\
echo\
echo Extraction Artwork:
echo ----------------------------------------------------
echo\

    IF NOT EXIST "%~dp0ART" MD "%~dp0ART"
	cd "%~dp0ART"
    echo         Files scan...
	echo device %@hdl_path% > "%~dp0TMP\pfs-log.txt"
	echo mount %OPLPART% >> "%~dp0TMP\pfs-log.txt"
	echo cd ART >> "%~dp0TMP\pfs-log.txt"
	echo ls -l >> "%~dp0TMP\pfs-log.txt"
    echo umount >> "%~dp0TMP\pfs-log.txt"
	echo exit >> "%~dp0TMP\pfs-log.txt"
	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
	mkdir "%~dp0LOG" >nul 2>&1 
	"%~dp0BAT\busybox" grep -i -e ".png" -e ".jpg"  "%~dp0TMP\pfs-tmp.log" > "%~dp0LOG\PFS-ART.log"
	
    "%~dp0BAT\busybox" cut -c42-100 "%~dp0LOG\PFS-ART.log" > "%~dp0TMP\pfs-art-new.txt"
	"%~dp0BAT\busybox" sed -i -e "s/^/get /" "%~dp0TMP\pfs-art-new.txt"
	
	echo         Extraction...
	echo device %@hdl_path% > "%~dp0TMP\pfs-art.txt"
	echo mount %OPLPART% >> "%~dp0TMP\pfs-art.txt"
	echo cd ART >> "%~dp0TMP\pfs-art.txt"
	type "%~dp0TMP\pfs-art-new.txt" >> "%~dp0TMP\pfs-art.txt"
	echo umount >> "%~dp0TMP\pfs-art.txt"
	echo exit >> "%~dp0TMP\pfs-art.txt"
	type "%~dp0TMP\pfs-art.txt" | "%~dp0BAT\pfsshell" >nul 2>&1
	echo         Completed...
	)

IF %@pfs_cfg%==yes (

echo\
echo\
echo Extraction Configs Files:
echo ----------------------------------------------------
echo\

    IF NOT EXIST "%~dp0CFG" MD "%~dp0CFG"
	cd "%~dp0CFG"
    echo         Files scan...
	echo device %@hdl_path% > "%~dp0TMP\pfs-log.txt"
	echo mount %OPLPART% >> "%~dp0TMP\pfs-log.txt"
	echo cd CFG >> "%~dp0TMP\pfs-log.txt"
	echo ls -l >> "%~dp0TMP\pfs-log.txt"
    echo umount >> "%~dp0TMP\pfs-log.txt"
	echo exit >> "%~dp0TMP\pfs-log.txt"
	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
	mkdir "%~dp0LOG" >nul 2>&1 
	"%~dp0BAT\busybox" grep -i -e ".*\.cfg$" "%~dp0TMP\pfs-tmp.log" > "%~dp0LOG\PFS-CFG.log"
    
    "%~dp0BAT\busybox" cut -c42-100 "%~dp0LOG\PFS-CFG.log" > "%~dp0TMP\pfs-cfg-new.txt"
	"%~dp0BAT\busybox" sed -i -e "s/^/get /" "%~dp0TMP\pfs-cfg-new.txt"
	
	echo         Extraction...
	echo device %@hdl_path% > "%~dp0TMP\pfs-cfg.txt"
	echo mount %OPLPART% >> "%~dp0TMP\pfs-cfg.txt"
	echo cd CFG >> "%~dp0TMP\pfs-cfg.txt"
	type "%~dp0TMP\pfs-cfg-new.txt" >> "%~dp0TMP\pfs-cfg.txt"
	echo umount >> "%~dp0TMP\pfs-cfg.txt"
	echo exit >> "%~dp0TMP\pfs-cfg.txt"
	type "%~dp0TMP\pfs-cfg.txt" | "%~dp0BAT\pfsshell" >nul 2>&1
	echo         Completed...
	)

IF %@pfs_cht%==yes (

echo\
echo\
echo Extraction Cheat Files:
echo ----------------------------------------------------
echo\
    
	IF NOT EXIST "%~dp0CHT" MD "%~dp0CHT"
	cd "%~dp0CHT"
    echo         Files scan...
	echo device %@hdl_path% > "%~dp0TMP\pfs-log.txt"
	echo mount %OPLPART% >> "%~dp0TMP\pfs-log.txt"
	echo cd CHT >> "%~dp0TMP\pfs-log.txt"
	echo ls -l >> "%~dp0TMP\pfs-log.txt"
    echo umount >> "%~dp0TMP\pfs-log.txt"
	echo exit >> "%~dp0TMP\pfs-log.txt"
	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
	mkdir "%~dp0LOG" >nul 2>&1 
	"%~dp0BAT\busybox" grep -i -e ".*\.cht$" "%~dp0TMP\pfs-tmp.log" > "%~dp0LOG\PFS-CHT.log"
	
    "%~dp0BAT\busybox" cut -c42-100 "%~dp0LOG\PFS-CHT.log" > "%~dp0TMP\pfs-cht-new.txt"
	"%~dp0BAT\busybox" sed -i -e "s/^/get /" "%~dp0TMP\pfs-CHT-new.txt"
	
	echo         Extraction...
	echo device %@hdl_path% > "%~dp0TMP\pfs-cht.txt"
	echo mount %OPLPART% >> "%~dp0TMP\pfs-cht.txt"
	echo cd CHT >> "%~dp0TMP\pfs-cht.txt"
	type "%~dp0TMP\pfs-cht-new.txt" >> "%~dp0TMP\pfs-cht.txt"
	echo umount >> "%~dp0TMP\pfs-cht.txt"
	echo exit >> "%~dp0TMP\pfs-cht.txt"
	type "%~dp0TMP\pfs-cht.txt" | "%~dp0BAT\pfsshell" >nul 2>&1
	echo         Completed...
	)

IF %@pfs_vmc%==yes (

echo\
echo\
echo Extraction OPL VirtualMC Files:
echo ----------------------------------------------------
echo\

    IF NOT EXIST "%~dp0VMC" MD "%~dp0VMC"
	cd "%~dp0VMC"
    echo         Files scan...
	echo device %@hdl_path% > "%~dp0TMP\pfs-log.txt"
	echo mount %OPLPART% >> "%~dp0TMP\pfs-log.txt"
	echo cd VMC >> "%~dp0TMP\pfs-log.txt"
	echo ls -l >> "%~dp0TMP\pfs-log.txt"
	echo umount >> "%~dp0TMP\pfs-log.txt"
	echo exit >> "%~dp0TMP\pfs-log.txt"
	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
	mkdir "%~dp0LOG" >nul 2>&1 
	"%~dp0BAT\busybox" grep -i -e ".bin" "%~dp0TMP\pfs-tmp.log" > "%~dp0LOG\PFS-VMC.log"
    
    "%~dp0BAT\busybox" cut -c42-100 "%~dp0LOG\PFS-VMC.log" > "%~dp0TMP\pfs-vmc-new.txt"
	"%~dp0BAT\busybox" sed -i -e "s/^/get /" "%~dp0TMP\pfs-VMC-new.txt"
	
	echo         Extraction...
	echo device %@hdl_path% > "%~dp0TMP\pfs-vmc.txt"
	echo mount %OPLPART% >> "%~dp0TMP\pfs-vmc.txt"
	echo cd VMC >> "%~dp0TMP\pfs-vmc.txt"
	type "%~dp0TMP\pfs-vmc-new.txt" >> "%~dp0TMP\pfs-vmc.txt"
	echo umount >> "%~dp0TMP\pfs-vmc.txt"
	echo exit >> "%~dp0TMP\pfs-vmc.txt"
	type "%~dp0TMP\pfs-vmc.txt" | "%~dp0BAT\pfsshell" >nul 2>&1
	echo         Completed...
	cd "%~dp0"
	)

IF %@pfs_popvmc%==yes (

echo\
echo\
echo Extraction POPS VirtualMC Files:
echo ----------------------------------------------------
echo\

    IF NOT EXIST "%~dp0POPS\VMC" MD "%~dp0POPS\VMC"
	
	cd "%~dp0POPS\VMC"
	echo         Files scan...
	echo device %@hdl_path% > "%~dp0TMP\pfs-popsvmc.txt"
	echo mount __common >> "%~dp0TMP\pfs-popsvmc.txt"
	echo cd POPS >> "%~dp0TMP\pfs-popsvmc.txt"
	echo ls -l >> "%~dp0TMP\pfs-popsvmc.txt"
	echo umount >> "%~dp0TMP\pfs-popsvmc.txt"
	echo exit >> "%~dp0TMP\pfs-popsvmc.txt"
	type "%~dp0TMP\pfs-popsvmc.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"

	REM Scan POPS Folder
	"%~dp0BAT\busybox" grep -i -e "drwx" "%~dp0TMP\pfs-tmp.log" | "%~dp0BAT\busybox" sed -e "1,2d" > "%~dp0TMP\pfs-tmp2.log"
    "%~dp0BAT\busybox" cut -c42-500 "%~dp0TMP\pfs-tmp2.log" > "%~dp0TMP\pfs-tmp3.log"
	"%~dp0BAT\busybox" sed -i -e "s/^/\"/g; s/\r*$/\"/" "%~dp0TMP\pfs-tmp3.log"
	
	REM Create Folder
	copy "%~dp0TMP\pfs-tmp3.log" "%~dp0POPS\VMC\pfs-tmp3.bat" >nul 2>&1
	"%~dp0BAT\busybox" sed -i -e "s/^/md /" "%~dp0POPS\VMC\pfs-tmp3.bat"
	call pfs-tmp3.bat
	
    echo         Extraction...
    echo device %@hdl_path% > "%~dp0TMP\pfs-popsvmc.txt"
    echo mount __common >> "%~dp0TMP\pfs-popsvmc.txt"
    echo cd POPS >> "%~dp0TMP\pfs-popsvmc.txt"
	"%~dp0BAT\busybox" sed -i -e "s/^/lcd /" "%~dp0TMP\pfs-tmp3.log"
	"%~dp0BAT\busybox" cut -c42-500 "%~dp0TMP\pfs-tmp2.log" > "%~dp0TMP\pfs-tmpVMC.log"
	"%~dp0BAT\busybox" sed -i -e "s/^/\"/g; s/\r*$/\"/" "%~dp0TMP\pfs-tmpVMC.log"
	"%~dp0BAT\busybox" sed -i -e "s/^/cd /" "%~dp0TMP\pfs-tmpVMC.log"
	"%~dp0BAT\busybox" paste -d "\n" "%~dp0TMP\pfs-tmpVMC.log" "%~dp0TMP\pfs-tmp3.log" > "%~dp0TMP\pfs-tmp4.log"
	"%~dp0BAT\busybox" sed -i "/lcd /a get SLOT0.VMC" "%~dp0TMP\pfs-tmp4.log"
	"%~dp0BAT\busybox" sed -i "/lcd /a get SLOT1.VMC" "%~dp0TMP\pfs-tmp4.log"
	"%~dp0BAT\busybox" sed -i "/lcd /a get PATCH_1.BIN" "%~dp0TMP\pfs-tmp4.log"
	"%~dp0BAT\busybox" sed -i "/lcd /a get PATCH_2.BIN" "%~dp0TMP\pfs-tmp4.log"
	"%~dp0BAT\busybox" sed -i "/lcd /a get PATCH_3.BIN" "%~dp0TMP\pfs-tmp4.log"
	"%~dp0BAT\busybox" sed -i "/lcd /a get PATCH_4.BIN" "%~dp0TMP\pfs-tmp4.log"
	"%~dp0BAT\busybox" sed -i "/lcd /a get PATCH_5.BIN" "%~dp0TMP\pfs-tmp4.log"
	"%~dp0BAT\busybox" sed -i "/lcd /a get PATCH_6.BIN" "%~dp0TMP\pfs-tmp4.log"
	"%~dp0BAT\busybox" sed -i "/lcd /a get PATCH_7.BIN" "%~dp0TMP\pfs-tmp4.log"
	"%~dp0BAT\busybox" sed -i "/lcd /a get CHEATS.TXT" "%~dp0TMP\pfs-tmp4.log"
	"%~dp0BAT\busybox" sed -i "/lcd /a get DISCS.TXT" "%~dp0TMP\pfs-tmp4.log"
	"%~dp0BAT\busybox" sed -i "/lcd /a get VMCDIR.TXT" "%~dp0TMP\pfs-tmp4.log"
	"%~dp0BAT\busybox" sed -i "/lcd /a rename CHEATS.txt CHEATS.TXT" "%~dp0TMP\pfs-tmp4.log"
	"%~dp0BAT\busybox" sed -i "/lcd /a rename VMCDIR.txt VMCDIR.TXT" "%~dp0TMP\pfs-tmp4.log"
	"%~dp0BAT\busybox" sed -i "/lcd /a rename DISCS.txt DISCS.TXT" "%~dp0TMP\pfs-tmp4.log"
	"%~dp0BAT\busybox" sed -i "/lcd /a rename cheats.txt CHEATS.TXT" "%~dp0TMP\pfs-tmp4.log"
	"%~dp0BAT\busybox" sed -i "/lcd /a rename vmcdir.txt VMCDIR.TXT" "%~dp0TMP\pfs-tmp4.log"
	"%~dp0BAT\busybox" sed -i "/lcd /a rename discs.txt DISCS.TXT" "%~dp0TMP\pfs-tmp4.log"
	"%~dp0BAT\busybox" sed -i "/lcd /a rename cheats.TXT CHEATS.TXT" "%~dp0TMP\pfs-tmp4.log"
	"%~dp0BAT\busybox" sed -i "/lcd /a rename vmcdir.TXT VMCDIR.TXT" "%~dp0TMP\pfs-tmp4.log"
	"%~dp0BAT\busybox" sed -i "/lcd /a rename discs.TXT DISCS.TXT" "%~dp0TMP\pfs-tmp4.log"
	"%~dp0BAT\busybox" sed -i "/SLOT0/a lcd .." "%~dp0TMP\pfs-tmp4.log"
	"%~dp0BAT\busybox" sed -i "/SLOT0/a cd .." "%~dp0TMP\pfs-tmp4.log"
	"%~dp0BAT\busybox" sed -i -e "s/\///g" "%~dp0TMP\pfs-tmp4.log"
    type "%~dp0TMP\pfs-tmp4.log" >> "%~dp0TMP\pfs-popsvmc.txt"
    echo umount >> "%~dp0TMP\pfs-popsvmc.txt"
    echo exit >> "%~dp0TMP\pfs-popsvmc.txt"
	
    type "%~dp0TMP\pfs-popsvmc.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
	echo         Completed...
    cd "%~dp0"
	)

rmdir /Q/S "%~dp0TMP" >nul 2>&1
del info.sys >nul 2>&1
del "%~dp0POPS\VMC\pfs-tmp3.bat" >nul 2>&1

"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo Extraction Completed...
echo\
echo\
"%~dp0BAT\Diagbox" gd 07

endlocal
pause & (goto mainmenu)

REM ########################################################################################################################################################################
:BackupPS1Games

cd "%~dp0"
cls

mkdir "%~dp0TMP" >nul 2>&1

"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo Scanning for Playstation 2 HDDs:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD"
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD" | "%~dp0BAT\busybox" cut -c2-6 > "%~dp0TMP\hdl-hdd.txt"
"%~dp0BAT\busybox" sed -i "s/hdd/\\\\.\\\PhysicalDrive/g; s/://g" "%~dp0TMP\hdl-hdd.txt"

set /P @hdl_path=<"%~dp0TMP\hdl-hdd.txt"
del "%~dp0TMP\hdl-hdd.txt" >nul 2>&1
IF "!@hdl_path!"=="" ( 
"%~dp0BAT\Diagbox" gd 0c
		echo         Playstation 2 HDD Not Detected
		echo         Drive Must Be Formatted First
		echo\
		echo\
"%~dp0BAT\Diagbox" gd 07
		rmdir /Q/S "%~dp0TMP" >nul 2>&1
		del info.sys >nul 2>&1	
		pause & (goto mainmenu)
	)

"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo Extract All .VCD:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) %YES%
"%~dp0BAT\Diagbox" gd 0c
echo         2) %NO%
"%~dp0BAT\Diagbox" gd 0e
echo         3) %YES% (Manually Choose the partition where your .VCDs to extract are located.)
"%~dp0BAT\Diagbox" gd 0e
echo         4) %YES% (Manually Choose your .VCD)
echo\
"%~dp0BAT\Diagbox" gd 07
CHOICE /C 1234 /M "Select Option:"

IF ERRORLEVEL 4 set @pfs_pop=yesmanually 
IF ERRORLEVEL 4 (goto extractpartpopsVCD)
IF ERRORLEVEL 1 set @pfs_pop=yes
IF ERRORLEVEL 2 set @pfs_pop=no
IF ERRORLEVEL 3 set @pfs_pop=yesmanually
IF ERRORLEVEL 3 (goto extractpartpopsname)

:popspartextractdefault
"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo Detecting POPS Partition:
echo ----------------------------------------------------
    
    echo device !@hdl_path! > "%~dp0TMP\pfs-prt.txt"
    echo ls -l >> "%~dp0TMP\pfs-prt.txt"
    echo exit >> "%~dp0TMP\pfs-prt.txt"
    type "%~dp0TMP\pfs-prt.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-prt.log"
    "%~dp0BAT\busybox" cat "%~dp0TMP\pfs-prt.log" | "%~dp0BAT\busybox" grep -w "__.POPS" | "%~dp0BAT\busybox" sed "s/.*__.POPS/__.POPS/" | "%~dp0BAT\busybox" tr -d " " | "%~dp0BAT\busybox" head -1 | "%~dp0BAT\busybox" sed -e "s/@/\//g" > "%~dp0TMP\hdd-prt.txt"
    set /P @hdd_avl=<"%~dp0TMP\hdd-prt.txt"
	
    REM del "%~dp0TMP\pfs-prt.txt" "%~dp0TMP\pfs-prt.log" >nul 2>&1 "%~dp0TMP\hdd-prt.txt"

    IF "!@hdd_avl!"=="__.POPS/" (
    "%~dp0BAT\Diagbox" gd 0a
	echo         POPS - Partition Detected
	"%~dp0BAT\Diagbox" gd 07
	) else (
	"%~dp0BAT\Diagbox" gd 0c
	echo         POPS - Partition NOT Detected
	echo         Partition Must Be Formatted Or Created
	echo\
	echo\
	"%~dp0BAT\Diagbox" gd 07
	rmdir /Q/S "%~dp0TMP" >nul 2>&1
	del info.sys >nul 2>&1
	pause & (goto mainmenu)
	)

echo\
echo\
pause
cls
IF %@pfs_pop%==yes (
echo\
echo\
echo Extraction VCD:
echo ----------------------------------------------------
echo\

    cd "%~dp0POPS"
    echo         Files scan...
	echo device !@hdl_path! > "%~dp0TMP\pfs-log.txt"
	echo mount __.POPS >> "%~dp0TMP\pfs-log.txt"
	echo ls -l >> "%~dp0TMP\pfs-log.txt"
	echo umount >> "%~dp0TMP\pfs-log.txt"
	echo exit >> "%~dp0TMP\pfs-log.txt"
	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
	mkdir "%~dp0LOG" >nul 2>&1 
	"%~dp0BAT\busybox" grep -i -e ".*\.VCD$" "%~dp0TMP\pfs-tmp.log" > "%~dp0TMP\PFS-POPS.log"

	"%~dp0BAT\busybox" cut -c42-254 "%~dp0TMP\PFS-POPS.log" > "%~dp0TMP\PFS-POPS-NEW.txt"
	"%~dp0BAT\busybox" sed -i -e "s/^/\"/g; s/\r*$/\"/" "%~dp0TMP\PFS-POPS-NEW.txt"
	"%~dp0BAT\busybox" sed -i -e "s/^/get /" "%~dp0TMP\PFS-POPS-NEW.txt"

	echo         Extraction...
	echo device !@hdl_path! > "%~dp0TMP\pfs-pops.txt"
	echo mount __.POPS >> "%~dp0TMP\pfs-pops.txt"
	type "%~dp0TMP\PFS-POPS-NEW.txt" >> "%~dp0TMP\pfs-pops.txt"
	echo umount >> "%~dp0TMP\pfs-pops.txt"
	echo exit >> "%~dp0TMP\pfs-pops.txt"
	type "%~dp0TMP\pfs-pops.txt" | "%~dp0BAT\pfsshell" >nul 2>&1
	echo         Completed...
	cd "%~dp0"

	) else ( echo          Canceled... )

rmdir /Q/S "%~dp0TMP" >nul 2>&1
del info.sys >nul 2>&1

echo\
echo\
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo Extraction Completed...
echo\
echo\
"%~dp0BAT\Diagbox" gd 07

pause & (goto mainmenu)

:extractpartpopsname
IF %@pfs_pop%==yesmanually (
echo.
echo Choose the partition where your .VCDs to extract are located.
echo By default it will be the partition __.POPS 
echo.
echo 0.  __.POPS0
echo 1.  __.POPS1
echo 2.  __.POPS2
echo 3.  __.POPS3
echo 4.  __.POPS4
echo 5.  __.POPS5
echo 6.  __.POPS6
echo 7.  __.POPS7
echo 8.  __.POPS8
echo 9.  __.POPS9
echo 10. __.POPS
echo.

set choice=
set /p choice="Select Option:"
IF "!choice!"=="" (goto BackupPS1Games)

IF "!choice!"=="!choice!" set popspartextract=__.POPS!choice!
IF "!choice!"=="10" set @pfs_pop=yes & (goto popspartextractdefault)

)

"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo Detecting POPS Partition:
echo ----------------------------------------------------
    "%~dp0BAT\Diagbox" gd 07
    echo device !@hdl_path! > "%~dp0TMP\pfs-prt.txt"
    echo ls -l >> "%~dp0TMP\pfs-prt.txt"
    echo exit >> "%~dp0TMP\pfs-prt.txt"
    type "%~dp0TMP\pfs-prt.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-prt.log"
    "%~dp0BAT\busybox" cat "%~dp0TMP\pfs-prt.log" | "%~dp0BAT\busybox" grep -w "%popspartextract%" | "%~dp0BAT\busybox" sed "s/.*%popspartextract%/%popspartextract%/" | "%~dp0BAT\busybox" tr -d " " | "%~dp0BAT\busybox" head -1 | "%~dp0BAT\busybox" sed -e "s/@/\//g" > "%~dp0TMP\hdd-prt.txt"
    set /P @hdd_avl=<"%~dp0TMP\hdd-prt.txt"
    REM del "%~dp0TMP\pfs-prt.txt" "%~dp0TMP\pfs-prt.log" >nul 2>&1 "%~dp0TMP\hdd-prt.txt"

IF "!@hdd_avl!"=="%popspartextract%/" (
"%~dp0BAT\Diagbox" gd 0a
	echo       __.POPS!choice! - Partition Detected
	"%~dp0BAT\Diagbox" gd 07
	) else (
	"%~dp0BAT\Diagbox" gd 0c
	echo       __.POPS!choice! - Partition NOT Detected
	echo        Partition Must Be Formatted Or Created
	echo\
	echo\
	"%~dp0BAT\Diagbox" gd 07
	rmdir /Q/S "%~dp0TMP" >nul 2>&1
	del info.sys >nul 2>&1
	pause & (goto mainmenu)
	)

echo\
echo\
pause
cls
echo\
echo\
echo Extraction VCD:
echo ----------------------------------------------------
echo\

    cd "%~dp0POPS"
    echo         Files scan...
	echo device !@hdl_path! > "%~dp0TMP\pfs-log.txt"
	echo mount %popspartextract% >> "%~dp0TMP\pfs-log.txt"
	echo ls -l >> "%~dp0TMP\pfs-log.txt"
	echo umount >> "%~dp0TMP\pfs-log.txt"
	echo exit >> "%~dp0TMP\pfs-log.txt"
	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
	mkdir "%~dp0LOG" >nul 2>&1 
	"%~dp0BAT\busybox" grep -i -e ".*\.VCD$" "%~dp0TMP\pfs-tmp.log" > "%~dp0TMP\PFS-POPS.log"

    "%~dp0BAT\busybox" cut -c42-254 "%~dp0TMP\PFS-POPS.log" > "%~dp0TMP\PFS-POPS-NEW.txt"
	"%~dp0BAT\busybox" sed -i -e "s/^/\"/g; s/\r*$/\"/" "%~dp0TMP\PFS-POPS-NEW.txt"
	"%~dp0BAT\busybox" sed -i -e "s/^/get /" "%~dp0TMP\PFS-POPS-NEW.txt"

	cd "%~dp0POPS"
	echo         Extraction...
	echo device !@hdl_path! > "%~dp0TMP\pfs-pops.txt"
	echo mount %popspartextract% >> "%~dp0TMP\pfs-pops.txt"
	type "%~dp0TMP\PFS-POPS-NEW.txt" >> "%~dp0TMP\pfs-pops.txt"
	echo umount >> "%~dp0TMP\pfs-pops.txt"
	echo exit >> "%~dp0TMP\pfs-pops.txt"
	type "%~dp0TMP\pfs-pops.txt" | "%~dp0BAT\pfsshell" >nul 2>&1
    echo         Completed...
	cd "%~dp0"

rmdir /Q/S "%~dp0TMP" >nul 2>&1
del info.sys >nul 2>&1

echo\
echo\
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo Extraction Completed...
echo\
echo\
"%~dp0BAT\Diagbox" gd 07

pause & (goto mainmenu)

:extractpartpopsVCD
IF %@pfs_pop%==yesmanually (
echo.
echo Choose the partition where your .VCDs to extract are located.
echo By default it will be the partition __.POPS 
echo.
echo 0.  __.POPS0
echo 1.  __.POPS1
echo 2.  __.POPS2
echo 3.  __.POPS3
echo 4.  __.POPS4
echo 5.  __.POPS5
echo 6.  __.POPS6
echo 7.  __.POPS7
echo 8.  __.POPS8
echo 9.  __.POPS9
echo 10. __.POPS
echo.

set choice=
set /p choice="Select Option:"
IF "!choice!"=="" (goto BackupPS1Games)

IF "!choice!"=="0" set POPSPART=__.POPS0
IF "!choice!"=="1" set POPSPART=__.POPS1
IF "!choice!"=="2" set POPSPART=__.POPS2
IF "!choice!"=="3" set POPSPART=__.POPS3
IF "!choice!"=="4" set POPSPART=__.POPS4
IF "!choice!"=="5" set POPSPART=__.POPS5
IF "!choice!"=="6" set POPSPART=__.POPS6
IF "!choice!"=="7" set POPSPART=__.POPS7
IF "!choice!"=="8" set POPSPART=__.POPS8
IF "!choice!"=="9" set POPSPART=__.POPS9
IF "!choice!"=="10" set POPSPART=__.POPS

)

"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo Detecting POPS Partition:
echo ----------------------------------------------------
    "%~dp0BAT\Diagbox" gd 07
    echo device !@hdl_path! > "%~dp0TMP\pfs-prt.txt"
    echo ls -l >> "%~dp0TMP\pfs-prt.txt"
    echo exit >> "%~dp0TMP\pfs-prt.txt"
    type "%~dp0TMP\pfs-prt.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-prt.log"
    "%~dp0BAT\busybox" cat "%~dp0TMP\pfs-prt.log" | "%~dp0BAT\busybox" grep -w "%POPSPART%" | "%~dp0BAT\busybox" sed "s/.*%POPSPART%/%POPSPART%/" | "%~dp0BAT\busybox" tr -d " " | "%~dp0BAT\busybox" head -1 | "%~dp0BAT\busybox" sed -e "s/@/\//g" > "%~dp0TMP\hdd-prt.txt"
    set /P @hdd_avl=<"%~dp0TMP\hdd-prt.txt"
    REM del "%~dp0TMP\pfs-prt.txt" "%~dp0TMP\pfs-prt.log" >nul 2>&1 "%~dp0TMP\hdd-prt.txt"

IF "!@hdd_avl!"=="%POPSPART%/" (
"%~dp0BAT\Diagbox" gd 0a
	echo        %POPSPART% - Partition Detected
	"%~dp0BAT\Diagbox" gd 07
	) else (
	"%~dp0BAT\Diagbox" gd 0c
	echo        %POPSPART% - Partition NOT Detected
	echo        Partition Must Be Formatted Or Created
	echo\
	echo\
	"%~dp0BAT\Diagbox" gd 07
	rmdir /Q/S "%~dp0TMP" >nul 2>&1
	del info.sys >nul 2>&1
	pause & (goto mainmenu)
	)

echo\
echo\
pause
cls

"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo Scanning Games List in %POPSPART%:
echo ----------------------------------------------------
echo\
"%~dp0BAT\Diagbox" gd 07

    echo device !@hdl_path! > "%~dp0TMP\pfs-prt.txt"
	echo mount %POPSPART% >> "%~dp0TMP\pfs-prt.txt"
    echo ls -l >> "%~dp0TMP\pfs-prt.txt"
    echo exit >> "%~dp0TMP\pfs-prt.txt"
    type "%~dp0TMP\pfs-prt.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-prt.log"
	"%~dp0BAT\busybox" grep -i -e ".*\.VCD$" "%~dp0TMP\pfs-prt.log" | "%~dp0BAT\busybox" cut -c42-500 > "%~dp0TMP\%POPSPART%.txt"
	type "%~dp0TMP\%POPSPART%.txt"

echo\
set /p NameVCD=Enter The Game Name.VCD:

"%~dp0BAT\Diagbox" gd 07
echo\
echo\
echo Extraction VCD:
echo ----------------------------------------------------
echo\
setlocal DisableDelayedExpansion

	cd "%~dp0POPS"
	echo         Extraction "%NameVCD%"...
	echo device %@hdl_path% > "%~dp0TMP\pfs-pops.txt"
	echo mount %POPSPART% >> "%~dp0TMP\pfs-pops.txt"
	echo get "%NameVCD%"  >> "%~dp0TMP\pfs-pops.txt"
	echo umount >> "%~dp0TMP\pfs-pops.txt"
	echo exit >> "%~dp0TMP\pfs-pops.txt"
	type "%~dp0TMP\pfs-pops.txt" | "%~dp0BAT\pfsshell" >nul 2>&1
    echo         Completed...
	cd "%~dp0"

endlocal
rmdir /Q/S "%~dp0TMP" >nul 2>&1
del info.sys >nul 2>&1

echo\
echo\
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo Extraction Completed...
echo\
echo\
"%~dp0BAT\Diagbox" gd 07

pause & (goto mainmenu)

REM ########################################################################################################################################################################
:TransferPOPSBinaries

cd "%~dp0"
cls

mkdir "%~dp0TMP" >nul 2>&1
"%~dp0BAT\Diagbox" gd 0e

echo\
echo\
echo Scanning for Playstation 2 HDDs:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD"
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD" | "%~dp0BAT\busybox" cut -c2-6 > "%~dp0TMP\hdl-hdd.txt"
"%~dp0BAT\busybox" sed -i "s/hdd/\\\\.\\\PhysicalDrive/g; s/://g" "%~dp0TMP\hdl-hdd.txt"

set /P @hdl_path=<"%~dp0TMP\hdl-hdd.txt"
del "%~dp0TMP\hdl-hdd.txt" >nul 2>&1
IF "!@hdl_path!"=="" ( 
"%~dp0BAT\Diagbox" gd 0c
		echo         Playstation 2 HDD Not Detected
		echo         Drive Must Be Formatted First
		echo\
		echo\
"%~dp0BAT\Diagbox" gd 07
		rmdir /Q/S "%~dp0TMP" >nul 2>&1
		del info.sys >nul 2>&1	
		pause & (goto mainmenu)
	)
	
"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo Transfer POPS Binaries:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) Yes
"%~dp0BAT\Diagbox" gd 0c
echo         2) No
"%~dp0BAT\Diagbox" gd 07
echo\
CHOICE /C 12 /M "Select Option:"

IF ERRORLEVEL 1 set @pfs_pops=yes
IF ERRORLEVEL 2 set @pfs_pops=no
IF ERRORLEVEL 2 (goto mainmenu)
"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo\
echo POPS Binaries MD5 CHECKING:
echo ----------------------------------------------------
set file=%~dp0POPS-Binaries\POPS.ELF
if not exist "%file%" (goto notfound)
call "%~dp0BAT\md5.bat" "%file%" md5 !md5!

if %md5% equ 355a892a8ce4e4a105469d4ef6f39a42 (
  "%~dp0BAT\Diagbox" gd 0a
   echo POPS.ELF     - MD5 Match : !md5!
  goto checkIOP
) else (
"%~dp0BAT\Diagbox" gd 0c
  echo POPS.ELF     - MD5 Does not match : !md5!
  goto checkIOP
  )
  
:check2POPS
set file=%~dp0POPS-Binaries\POPS.ELF
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ 355a892a8ce4e4a105469d4ef6f39a42 (
  echo\ 
  goto matchALL
) else (
  goto notfound)
  
:checkIOP
set file=%~dp0POPS-Binaries\IOPRP252.IMG
if not exist "%file%" (goto notfound)
call "%~dp0BAT\md5.bat" "%file%" md5 !md5!

if %md5% equ 1db9c6020a2cd445a7bb176a1a3dd418 (
  "%~dp0BAT\Diagbox" gd 0a
   echo IOPRP252.IMG - MD5 Match : !md5!
  goto check2POPS
) else (
"%~dp0BAT\Diagbox" gd 0c
echo IOPRP252.IMG - MD5 Does not match : !md5!
"%~dp0BAT\Diagbox" gd 0f
  goto notfound)

pause & (goto mainmenu)

:notfound
"%~dp0BAT\Diagbox" gd 0c
echo\
echo BINARIES POPS NOT DETECTED IN POPS-Binaries FOLDER
echo\
echo YOU NEED TO FIND THESE FILES FOR POPSTARTER WORKS!
echo\
"%~dp0BAT\Diagbox" gd 07
echo POPS.ELF     - MD5 : 355a892a8ce4e4a105469d4ef6f39a42
echo IOPRP252.IMG - MD5 : 1db9c6020a2cd445a7bb176a1a3dd418
echo\

pause & (goto mainmenu)

:matchALL
"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo Detecting __common Partition:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 07

    echo device !@hdl_path! > "%~dp0TMP\pfs-prt.txt"
    echo ls >> "%~dp0TMP\pfs-prt.txt"
    echo exit >> "%~dp0TMP\pfs-prt.txt"
    type "%~dp0TMP\pfs-prt.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-prt.log"
    "%~dp0BAT\busybox" cat "%~dp0TMP\pfs-prt.log" | "%~dp0BAT\busybox" grep "__common" | "%~dp0BAT\busybox" sed "s/.*__common/__common/" | "%~dp0BAT\busybox" tr -d " " | "%~dp0BAT\busybox" head -1 | "%~dp0BAT\busybox" sed -e "s/@/\//g" > "%~dp0TMP\hdd-prt.txt"
    set /P @hdd_avl=<"%~dp0TMP\hdd-prt.txt"
    REM del "%~dp0TMP\pfs-prt.txt" "%~dp0TMP\pfs-prt.log" >nul 2>&1 "%~dp0TMP\hdd-prt.txt"
    IF "!@hdd_avl!"=="__common/" (
    "%~dp0BAT\Diagbox" gd 0a
	echo         __common - Partition Detected
	"%~dp0BAT\Diagbox" gd 07
	) else (
	"%~dp0BAT\Diagbox" gd 0c
	echo         __common - Partition NOT Detected
	echo         Partition Must Be Formatted Or Created
	echo\
	echo\
	"%~dp0BAT\Diagbox" gd 07
	rmdir /Q/S "%~dp0TMP" >nul 2>&1
	del info.sys >nul 2>&1
	
	pause & (goto mainmenu)
	
	)

echo\
echo\
pause
cls
"%~dp0BAT\Diagbox" gd 0f
IF %@pfs_pops%==yes (
echo\
echo\
echo Installing POPS Binaries:
echo ----------------------------------------------------
echo\
REM POPS BINARIES
"%~dp0BAT\Diagbox" gd 07

IF /I EXIST "%~dp0POPS-Binaries\*" (

	cd "%~dp0POPS-Binaries"
	echo         Creating Que
	echo device !@hdl_path! > "%~dp0TMP\pfs-pops-binaries.txt"
	echo mount __common >> "%~dp0TMP\pfs-pops-binaries.txt"
	echo mkdir POPS >> "%~dp0TMP\pfs-pops-binaries.txt"
	echo cd POPS >> "%~dp0TMP\pfs-pops-binaries.txt"
	for %%f in (POPS.ELF IOPRP252.IMG POPSTARTER.ELF TROJAN_7.BIN BIOS.BIN OSD.BIN *.TM2) do (echo put "%%f") >> "%~dp0TMP\pfs-pops-binaries.txt"
	echo umount >> "%~dp0TMP\pfs-pops-binaries.txt"
	echo exit >> "%~dp0TMP\pfs-pops-binaries.txt"
	
	echo         Installing Que
	type "%~dp0TMP\pfs-pops-binaries.txt" | "%~dp0BAT\pfsshell" >nul 2>&1
	del "%~dp0TMP\pfs-pops-binaries.txt" >nul 2>&1
	
	echo         Creating Log
	echo device !@hdl_path! > "%~dp0TMP\pfs-log.txt"
	echo mount __common >> "%~dp0TMP\pfs-log.txt"
	echo cd POPS >> "%~dp0TMP\pfs-log.txt"
	echo ls -l >> "%~dp0TMP\pfs-log.txt"
	echo umount >> "%~dp0TMP\pfs-log.txt"
	echo exit >> "%~dp0TMP\pfs-log.txt"
	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
	mkdir "%~dp0LOG" >nul 2>&1
	"%~dp0BAT\busybox" grep -i -e ".ELF" -e ".IMG" -e ".BIN" -e ".TM2" "%~dp0TMP\pfs-tmp.log" > "%~dp0LOG\PFS-POPS-Binaries.log"
	echo         POPS Binaries Completed...	
	cd "%~dp0"


REM POPS FOR OPL APPS
REM	echo         Creating Que
    cd "%~dp0POPS-Binaries"
	echo device !@hdl_path! > "%~dp0TMP\pfs-pops-binaries.txt"
	echo mount +OPL >> "%~dp0TMP\pfs-pops-binaries.txt"
	echo mkdir POPS >> "%~dp0TMP\pfs-pops-binaries.txt"
	echo cd POPS >> "%~dp0TMP\pfs-pops-binaries.txt"
	for %%g in (POPSTARTER.ELF) do (echo put "%%g") >> "%~dp0TMP\pfs-pops-binaries.txt"
	echo umount >> "%~dp0TMP\pfs-pops-binaries.txt"
	echo exit >> "%~dp0TMP\pfs-pops-binaries.txt"
REM	echo         Installing Que
	type "%~dp0TMP\pfs-pops-binaries.txt" | "%~dp0BAT\pfsshell" >nul 2>&1
	cd "%~dp0"
	) else ( echo         POPS Binaries - Source Not Detected... )
)

rmdir /Q/S "%~dp0TMP" >nul 2>&1
del info.sys >nul 2>&1

"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo ----------------------------------------------------
 "%~dp0BAT\Diagbox" gd 0a
echo Installation Completed...
echo\
echo\
"%~dp0BAT\Diagbox" gd 07

pause & (goto mainmenu)

REM ########################################################################################################################################################################
:BackupPS2Games

mkdir "%~dp0CD-DVD" >nul 2>&1
mkdir "%~dp0TMP" >nul 2>&1

copy "%~dp0BAT\hdl_dump.exe" "%~dp0CD-DVD\hdl_dump.exe" >nul 2>&1


cd /d "%~dp0CD-DVD"
cls
"%~dp0BAT\Diagbox" gd 0e

echo\
echo\
echo Scanning for Playstation 2 HDDs:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD"
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD" | "%~dp0BAT\busybox" cut -c2-6 > "%~dp0TMP\hdl-hdd.txt"

set /P @hdl_path=<"%~dp0TMP\hdl-hdd.txt"
del "%~dp0TMP\hdl-hdd.txt" >nul 2>&1
IF "!@hdl_path!"=="" ( 
"%~dp0BAT\Diagbox" gd 0c
		echo         Playstation 2 HDD Not Detected
		echo         Drive Must Be Formatted First
		echo\
		echo\
"%~dp0BAT\Diagbox" gd 07
		rmdir /Q/S "%~dp0TMP" >nul 2>&1
		del info.sys >nul 2>&1	
		pause & (goto mainmenu)
	)

echo\
echo\
"%~dp0BAT\Diagbox" gd 0f
echo Extract All .ISO ?
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) Yes
"%~dp0BAT\Diagbox" gd 0c
echo         2) No
"%~dp0BAT\Diagbox" gd 0e
echo         3) Yes (Manually choose the game)
echo\
"%~dp0BAT\Diagbox" gd 07
echo\
CHOICE /C 123 /M "Select Option:"

IF ERRORLEVEL 3 (goto BackupPS2GamesManually)
IF ERRORLEVEL 2 (goto Mainmenu)

"%~dp0BAT\Diagbox" gd 0e
cls
echo\
echo\
echo Extraction iso...
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
setlocal DisableDelayedExpansion

hdl_dump hdl_toc %@hdl_path% > PARTITION_GAMES.txt

"%~dp0BAT\busybox" sed -i "1d" PARTITION_GAMES.txt
"%~dp0BAT\busybox" sed -i -e "$ d" PARTITION_GAMES.txt
"%~dp0BAT\busybox" cut -c35-500 PARTITION_GAMES.txt > PARTITION_GAMES_NEW.txt

type PARTITION_GAMES_NEW.txt
"%~dp0BAT\Diagbox" gd 0e
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03

For %%Z in (PARTITION_GAMES.txt) do (
 (for /f "tokens=2,5*" %%A in (%%Z) do echo hdl_dump.exe extract %@hdl_path% "%%C" %%B.iso) > PARTITION_GAMES_NEW2.bat)

echo on & call PARTITION_GAMES_NEW2.bat
@echo off

"%~dp0BAT\busybox" sed -i "s/\"//g" "%~dp0CD-DVD\PARTITION_GAMES_NEW.txt"

For %%Z in (PARTITION_GAMES.txt) do (
 (for /f "tokens=2,5*" %%A in (%%Z) do echo ren %%B.iso "%%C.iso") > RenameISO.bat)
 
"%~dp0BAT\busybox" sed -i "s/:/-/g; s/?//g; s/\\//g; s/\///g; s/\*//g; s/>//g; s/<//g" "%~dp0CD-DVD\RenameISO.bat"
"%~dp0BAT\busybox" sed -i "s/|//g" "%~dp0CD-DVD\RenameISO.bat"

ren *. *.iso >nul 2>&1
call RenameISO.bat

endlocal
del gameid.txt >nul 2>&1
del hdl_dump.exe >nul 2>&1
del "%~dp0\hdl_svr_093.elf" >nul 2>&1
del PARTITION_GAMES.txt >nul 2>&1
del PARTITION_GAMES_NEW.txt >nul 2>&1
del PARTITION_GAMES_NEW2.txt >nul 2>&1
del PARTITION_GAMES_NEW2.bat >nul 2>&1
del Rename.txt >nul 2>&1
del RenameISO.bat >nul 2>&1
rmdir /Q/S "%~dp0TMP" >nul 2>&1

echo\
echo\
"%~dp0BAT\Diagbox" gd 0f
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo Extraction Completed...
echo\
echo\
"%~dp0BAT\Diagbox" gd 07

pause & (goto mainmenu)

:BackupPS2GamesManually
"%~dp0BAT\Diagbox" gd 0e
cls
echo\
echo\
echo Game List
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
setlocal DisableDelayedExpansion

hdl_dump hdl_toc %@hdl_path% > PARTITION_GAMES.txt

"%~dp0BAT\busybox" sed -i "1d" PARTITION_GAMES.txt
"%~dp0BAT\busybox" sed -i -e "$ d" PARTITION_GAMES.txt
"%~dp0BAT\busybox" cut -c35-500 PARTITION_GAMES.txt > PARTITION_GAMES_NEW.txt

type PARTITION_GAMES_NEW.txt"
"%~dp0BAT\Diagbox" gd 0e
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
echo\
set /p gamename=Enter the Game Name:

"%~dp0BAT\busybox" grep "%gamename%" PARTITION_GAMES.txt > PARTITION_GAMES_NEW2.txt
"%~dp0BAT\busybox" sed -i "2,20d" PARTITION_GAMES_NEW2.txt

For %%Z in (PARTITION_GAMES_NEW2.txt) do (
 (for /f "tokens=2,5*" %%A in (%%Z) do echo hdl_dump.exe extract %@hdl_path% "%gamename%" %%B.iso) > PARTITION_GAMES_NEW2.bat)

echo\ 
echo Extract.. "\CD-DVD\%gamename%"
call PARTITION_GAMES_NEW2.bat

"%~dp0BAT\busybox" sed -i "s/\"//g" "%~dp0CD-DVD\PARTITION_GAMES_NEW.txt"

For %%Z in (PARTITION_GAMES_NEW2.txt) do (
 (for /f "tokens=2,5*" %%A in (%%Z) do echo ren %%B.iso "%%C.iso") > RenameISO.bat)
 
"%~dp0BAT\busybox" sed -i "s/:/-/g; s/?//g; s/\\//g; s/\///g; s/\*//g; s/>//g; s/<//g" "%~dp0CD-DVD\RenameISO.bat"
"%~dp0BAT\busybox" sed -i "s/|//g" "%~dp0CD-DVD\RenameISO.bat"

ren *. *.iso >nul 2>&1
call RenameISO.bat

endlocal
del gameid.txt >nul 2>&1
del hdl_dump.exe >nul 2>&1
del "%~dp0\hdl_svr_093.elf" >nul 2>&1
del PARTITION_GAMES.txt >nul 2>&1
del PARTITION_GAMES_NEW.txt >nul 2>&1
del PARTITION_GAMES_NEW2.txt >nul 2>&1
del PARTITION_GAMES_NEW2.bat >nul 2>&1
del Rename.txt >nul 2>&1
del RenameISO.bat >nul 2>&1
rmdir /Q/S "%~dp0TMP" >nul 2>&1

echo\
echo\
"%~dp0BAT\Diagbox" gd 0f
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo Extraction Completed...
echo\
echo\
"%~dp0BAT\Diagbox" gd 07

pause & (goto mainmenu)

REM Old 
REM setlocal enabledelayedexpansion
REM 
REM set "FileName=Rename.txt"
REM set "OutFile=RenameISO.bat"
REM (
REM for /f "usebackq delims=*" %%a IN ("%FileName%") DO (
REM  set "line=%%a"
REM  set "line=!line::=-!"
REM  set "line=!line:?=-!"
REM  set "line=!line:/=-!"
REM  set "line=!line:\=-!"
REM  set "line=!line:>=-!"
REM  set "line=!line:<=-!"
REM  echo !line!
REM )
REM )>"%OutFile%"

REM  For HDL_DUMP_093
REM For %%Z in (PARTITION_GAMES_NEW.txt") do (
REM  (for /f "tokens=2-4*" %%A in (%%Z) do echo hdl_dump.exe extract "%%D" %%C.iso) > "PARTITION_GAMES_NEW.bat")
REM 
REM For %%Z in (PARTITION_GAMES_NEW.txt") do (
REM  (for /f "tokens=2-4*" %%A in (%%Z) do echo ren %%C.iso "%%D.iso") > "Rename.txt")

REM ####################################################################################################################################################
:CreatePART

mkdir "%~dp0TMP" >nul 2>&1
"%~dp0BAT\Diagbox" gd 0e
cls
echo\
echo\
echo Scanning for Playstation 2 HDDs:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD"
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD" | "%~dp0BAT\busybox" cut -c2-6 > "%~dp0TMP\hdl-hdd.txt"
"%~dp0BAT\busybox" sed -i "s/hdd/\\\\.\\\PhysicalDrive/g; s/://g" "%~dp0TMP\hdl-hdd.txt"

set /P @hdl_path=<"%~dp0TMP\hdl-hdd.txt"
del "%~dp0TMP\hdl-hdd.txt" >nul 2>&1
IF "!@hdl_path!"=="" ( 
"%~dp0BAT\Diagbox" gd 0c
		echo         Playstation 2 HDD Not Detected
		echo         Drive Must Be Formatted First
		echo\
		echo\
"%~dp0BAT\Diagbox" gd 07
		rmdir /Q/S "%~dp0TMP" >nul 2>&1
		del info.sys >nul 2>&1
        pause & (goto HDDManagementMenu)
	)

"%~dp0BAT\Diagbox" gd 0f
echo\
echo\

echo Create Partition:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) %YES%
"%~dp0BAT\Diagbox" gd 0c
echo         2) %NO%
"%~dp0BAT\Diagbox" gd 07
echo\
CHOICE /C 12 /M "Select Option:"

IF ERRORLEVEL 1 set @pfs_part=yes
IF ERRORLEVEL 2 set @pfs_part=no

IF %@pfs_part%==yes (
echo.
"%~dp0BAT\Diagbox" gd 06
echo I recommend that you create the partition directly on uLaunchELF If you have a problem
"%~dp0BAT\Diagbox" gd 07
echo Example: +OPL
echo.
set /p "partname=Enter partition Name:" 
IF "!partname!"=="" (goto HDDManagementMenu)
echo.
echo.
echo The size must be multiplied by 128
echo Example: 128 x 5 = 640MB
echo Max size per partition 128GB
echo.
echo Example size:
echo 128mb = 128M
echo 256mb = 256M
echo 384mb = 384M
echo 512mb = 512M
echo 640mb = 640M
echo 768mb = 768M
echo 896mb = 896M
echo   1GB =   1G
echo 128GB = 128G
echo\
echo Example: 
echo If you want a 10GB partition Type: 10G
echo If you want a 512MB partition Type: 512M
echo If you want a 1.5GB partition 1024 + 512 = 1536 Type: 1536M
echo\
echo\
set /p "partsize=Enter partition size:"
IF "!partsize!"=="" (goto HDDManagementMenu)
)

IF %@pfs_part%==yes (
cls
echo\
echo\
echo Creating !partname! Partition:
echo ----------------------------------------------------
echo\

    echo        Creating partitions...
  	echo device %@hdl_path% > "%~dp0TMP\pfs-log.txt"
	echo mkpart !partname! %partsize% >> "%~dp0TMP\pfs-log.txt"
  	echo exit >> "%~dp0TMP\pfs-log.txt"
	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
	echo        partition !partname! completed...
	
	) else ( cls & echo          Canceled... )

rmdir /Q/S "%~dp0TMP" >nul 2>&1
del info.sys >nul 2>&1

echo\
echo\
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo Partition Completed...
echo\
echo\
"%~dp0BAT\Diagbox" gd 07

pause & (goto HDDManagementMenu)


REM ####################################################################################################################################################
:DeletePART

cls
mkdir "%~dp0TMP" >nul 2>&1
"%~dp0BAT\Diagbox" gd 0e

echo\
echo\
echo Scanning for Playstation 2 HDDs:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD"
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD" | "%~dp0BAT\busybox" cut -c2-6 > "%~dp0TMP\hdl-hdd.txt"
"%~dp0BAT\busybox" sed -i "s/hdd/\\\\.\\\PhysicalDrive/g; s/://g" "%~dp0TMP\hdl-hdd.txt"

set /P @hdl_path=<"%~dp0TMP\hdl-hdd.txt"
del "%~dp0TMP\hdl-hdd.txt" >nul 2>&1
IF "!@hdl_path!"=="" ( 
"%~dp0BAT\Diagbox" gd 0c
		echo         Playstation 2 HDD Not Detected
		echo         Drive Must Be Formatted First
		echo\
		echo\
"%~dp0BAT\Diagbox" gd 07
		rmdir /Q/S "%~dp0TMP" >nul 2>&1
		del info.sys >nul 2>&1
	    pause & (goto HDDManagementMenu)
	)
	
"%~dp0BAT\Diagbox" gd 0f
echo\
echo\

echo Scan Partition:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) %YES%
"%~dp0BAT\Diagbox" gd 0c
echo         2) %NO%
"%~dp0BAT\Diagbox" gd 07
echo\
CHOICE /C 12 /M "Select Option:"

IF ERRORLEVEL 1 set @pfs_partdel=yes
IF ERRORLEVEL 2 set @pfs_partdel=no

IF %@pfs_partdel%==yes (
echo\
echo\
echo Partition List:
echo ----------------------------------------------------
    echo device %@hdl_path% > "%~dp0TMP\pfs-prt.txt"
    echo ls -l >> "%~dp0TMP\pfs-prt.txt"
    echo exit >> "%~dp0TMP\pfs-prt.txt"
    type "%~dp0TMP\pfs-prt.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-prt.log"
    "%~dp0BAT\busybox" cat "%~dp0TMP\pfs-prt.log" | "%~dp0BAT\busybox" grep -e "0x0100" -e "0x0001" | "%~dp0BAT\busybox" sed -e "s/\///g" > "%~dp0TMP\hdd-prt.txt"
	
	type "%~dp0TMP\hdd-prt.txt"
echo ----------------------------------------------------
	echo\
	echo\
	echo Don't put the @ to delete the partition it's just to see the extra size of the partition
	echo\
    set /p "partnamedel=Enter the partition name you want to delete:" 
    IF "!partnamedel!"=="" (goto HDDManagementMenu)

cls
echo\
echo\
echo Deleting !partnamedel! Partition:
echo ----------------------------------------------------
echo\

    echo        Deleting partitions...
  	echo device %@hdl_path% > "%~dp0TMP\pfs-log.txt"
	echo rmpart !partnamedel! >> "%~dp0TMP\pfs-log.txt"
  	echo exit >> "%~dp0TMP\pfs-log.txt"
	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
	echo        Partition !partnamedel! Deleted...	
	
   ) else ( cls & echo          Canceled... )
   
rmdir /Q/S "%~dp0TMP" >nul 2>&1
del info.sys >nul 2>&1

echo\
echo\
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo Partition Completed...
echo\
echo\
"%~dp0BAT\Diagbox" gd 07

pause & (goto HDDManagementMenu)

REM #######################################################################################################################################################################################
:partitionSystemList

cls
mkdir "%~dp0TMP" >nul 2>&1
"%~dp0BAT\Diagbox" gd 0e

echo\
echo\
echo Scanning for Playstation 2 HDDs:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD"
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD" | "%~dp0BAT\busybox" cut -c2-6 > "%~dp0TMP\hdl-hdd.txt"
"%~dp0BAT\busybox" sed -i "s/hdd/\\\\.\\\PhysicalDrive/g; s/://g" "%~dp0TMP\hdl-hdd.txt"

set /P @hdl_path=<"%~dp0TMP\hdl-hdd.txt"
REM del "%~dp0TMP\hdl-hdd.txt" >nul 2>&1
IF "!@hdl_path!"=="" ( 
"%~dp0BAT\Diagbox" gd 0c
		echo         Playstation 2 HDD Not Detected
		echo         Drive Must Be Formatted First
		echo\
		echo\
"%~dp0BAT\Diagbox" gd 07
		rmdir /Q/S "%~dp0TMP" >nul 2>&1
		del info.sys >nul 2>&1
        pause & (goto ShowPartitionInfos)
	)
	
"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo Partition System List:
echo ----------------------------------------------------
    echo device %@hdl_path% > "%~dp0TMP\pfs-prt.txt"
    echo ls -l >> "%~dp0TMP\pfs-prt.txt"
    echo exit >> "%~dp0TMP\pfs-prt.txt"
    type "%~dp0TMP\pfs-prt.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-prt.log"
    "%~dp0BAT\busybox" cat "%~dp0TMP\pfs-prt.log" | "%~dp0BAT\busybox" grep -e "0x0100" -e "0x0001" | "%~dp0BAT\busybox" sed "/.POPS./d" > "%~dp0TMP\hdd-prt.txt"
	type "%~dp0TMP\hdd-prt.txt"
echo ----------------------------------------------------
	
rmdir /Q/S "%~dp0TMP" >nul 2>&1
del info.sys >nul 2>&1

echo.
pause & (goto ShowPartitionInfos) 

REM #######################################################################################################################################
:partitionGameList

cls
mkdir "%~dp0TMP" >nul 2>&1
mkdir "%~dp0LOG" >nul 2>&1
"%~dp0BAT\Diagbox" gd 0e

echo\
echo\
echo Scanning for Playstation 2 HDDs:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD"
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD" | "%~dp0BAT\busybox" cut -c2-6 > "%~dp0TMP\hdl-hdd.txt"

set /P @hdl_path=<"%~dp0TMP\hdl-hdd.txt"
::del "%~dp0TMP\hdl-hdd.txt" >nul 2>&1
IF "!@hdl_path!"=="" ( 
"%~dp0BAT\Diagbox" gd 0c
		echo         Playstation 2 HDD Not Detected
		echo         Drive Must Be Formatted First
		echo\
		echo\
"%~dp0BAT\Diagbox" gd 07
		rmdir /Q/S "%~dp0TMP" >nul 2>&1
		del info.sys >nul 2>&1     
		pause & (goto ShowPartitionInfos)
	)
	
"%~dp0BAT\Diagbox" gd 0f
echo\
echo\

if defined ShowPS1GameList (

echo Partition PS1 Games List:
echo ----------------------------------------------------

"%~dp0BAT\busybox" sed -i "s/hdd/\\\\.\\\PhysicalDrive/g; s/://g" "%~dp0TMP\hdl-hdd.txt"
set /P @hdl_path2=<"%~dp0TMP\hdl-hdd.txt"

    echo device !@hdl_path2! > "%~dp0TMP\pfs-prt.txt"
    echo ls -l >> "%~dp0TMP\pfs-prt.txt"
    echo exit >> "%~dp0TMP\pfs-prt.txt"
    type "%~dp0TMP\pfs-prt.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-prt.log"
    "%~dp0BAT\busybox" cat "%~dp0TMP\pfs-prt.log" | "%~dp0BAT\busybox" grep -e ".POPS." > "%~dp0TMP\hdd-prt.txt"
	type "%~dp0TMP\hdd-prt.txt"

echo ----------------------------------------------------
)

if defined ShowPS2GameList (

echo Partition PS2 Games List:
echo ----------------------------------------------------

    "%~dp0BAT\hdl_dump" toc %@hdl_path% > "%~dp0TMP\PARTITION_GAMES.txt"
	"%~dp0BAT\busybox" cat "%~dp0TMP\PARTITION_GAMES.txt" | "%~dp0BAT\busybox" grep -e "0x1337" > "%~dp0LOG\PARTITION_GAMES.log"
	type "%~dp0LOG\PARTITION_GAMES.log"
	
echo ----------------------------------------------------
)

rmdir /Q/S "%~dp0TMP" >nul 2>&1
del info.sys >nul 2>&1

echo.
pause & (goto ShowPartitionInfos) 

REM #######################################################################################################################################
:DIAGPARTERROR

cls
mkdir "%~dp0TMP" >nul 2>&1
mkdir "%~dp0LOG" >nul 2>&1
"%~dp0BAT\Diagbox" gd 0e

echo\
echo\
echo Scanning for Playstation 2 HDDs:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD"
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD" | "%~dp0BAT\busybox" cut -c2-6 > "%~dp0TMP\hdl-hdd.txt"

set /P @hdl_path=<"%~dp0TMP\hdl-hdd.txt"
::del "%~dp0TMP\hdl-hdd.txt" >nul 2>&1
IF "!@hdl_path!"=="" ( 
"%~dp0BAT\Diagbox" gd 0c
		echo         Playstation 2 HDD Not Detected
		echo         Drive Must Be Formatted First
		echo\
		echo\
"%~dp0BAT\Diagbox" gd 07
		rmdir /Q/S "%~dp0TMP" >nul 2>&1
		del info.sys >nul 2>&1    
		pause & (goto HDDManagementMenu)
	)
	
"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo Scanning Partition Errors:
"%~dp0BAT\Diagbox" gd 06
echo.
echo NOTE: If nothing appears there is no error in the partitions
echo.
"%~dp0BAT\Diagbox" gd 0f
echo ----------------------------------------------------

    "%~dp0BAT\hdl_dump" diag %@hdl_path% > "%~dp0LOG\PARTITION_SCAN_ERROR.log"
	type "%~dp0LOG\PARTITION_SCAN_ERROR.log"
	
rmdir /Q/S "%~dp0TMP" >nul 2>&1
del info.sys >nul 2>&1

echo.

pause & (goto HDDManagementMenu) 

REM ###########################################################################################################################################################################################
:formatHDDtoPS2

mkdir "%~dp0TMP" >nul 2>&1

cls
"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo Scanning HDDs:
echo ----------------------------------------------------
    "%~dp0BAT\Diagbox" gd 03
	"%~dp0BAT\hdl_dump" query | findstr hdd[1-9]
	"%~dp0BAT\Diagbox" gd 07
    echo.
    echo ----------------------------------------------------
	"%~dp0BAT\Diagbox" gd 0c
	echo WARNING: MAKE SURE YOU CHOOSE THE RIGHT HARD DRIVE YOU WANT TO FORMAT
	"%~dp0BAT\Diagbox" gd 06
	echo.
	echo NOTE: If no PS2 HDDs are found, quit and retry after disconnecting
	echo all disk drives EXCEPT for your PC boot drive and the PS2 HDDs.
	echo.
	"%~dp0BAT\Diagbox" gd 0c
	echo Disclaimer: I can in no way be held responsible for improper use.
	"%~dp0BAT\Diagbox" gd 06
	echo\
	echo If you cannot choose your hard drive from the list, choose option 7.
	"%~dp0BAT\Diagbox" gd 07
	echo. 
	echo PLAYSTATION 2 HDD Extraction
	echo 	1. hdd1:
	echo 	2. hdd2:
	echo 	3. hdd3:
	echo 	4. hdd4:
	echo 	5. hdd5:
	echo 	6. hdd6:
	echo 	7. hdd#: Manual search (More HDD)
	echo 	9. Back to main menu
	echo\
	choice /c 123456789 /m "Select Option:"
	
	if errorlevel 1 set hdlhdd=hdd1:
	if errorlevel 2 set hdlhdd=hdd2:
	if errorlevel 3 set hdlhdd=hdd3:
	if errorlevel 4 set hdlhdd=hdd4:
	if errorlevel 5 set hdlhdd=hdd5:
	if errorlevel 6 set hdlhdd=hdd6:
	if errorlevel 7 set hdlhddm=yes
	if errorlevel 9 (goto HDDManagementMenu)
  
    IF "!hdlhddm!"=="yes" (
    
	echo\
    echo What is the number of my hard drive? / The one next to the hdd#: in the scanned HDDs
    echo Example If you want to format hdd7: type 7
    echo\
	
    set choice=
    set /p choice=Enter the number of the hard drive you want to format:
    echo\
    IF "!choice!"=="" set "hdlhddm=" & set "hdlhdd=" & set "@hdl_path=" & set "@hdl_pathinfo=" & (goto formatHDDtoPS2)
    IF "!choice!"=="!choice!" set hdlhdd=hdd!choice!:
    IF "!choice!"=="Q" (goto  HDDManagementMenu)
   
   )

"%~dp0BAT\Diagbox" gd 00
echo\
echo\
echo Prepare HDD for formatting:
echo ----------------------------------------------------
"%~dp0BAT\hdl_dump" query | findstr "%hdlhdd%"
"%~dp0BAT\hdl_dump" query | findstr "%hdlhdd%" | "%~dp0BAT\busybox" cut -c2-6 > "%~dp0TMP\hdl-hdd.txt"
"%~dp0BAT\busybox" sed -i "s/hdd/\\\\.\\\PhysicalDrive/g; s/://g" "%~dp0TMP\hdl-hdd.txt"
set /P @hdl_path=<"%~dp0TMP\hdl-hdd.txt"

copy "%~dp0TMP\hdl-hdd.txt" "%~dp0TMP\hdl-hddinfo.txt" >nul 2>&1
"%~dp0BAT\busybox" sed -i "s/\\\\.\\\PhysicalDrive/PHYSICALDRIVE/g; s/://g" "%~dp0TMP\hdl-hddinfo.txt"
set /P @hdl_pathinfo=<"%~dp0TMP\hdl-hddinfo.txt"

REM del "%~dp0TMP\hdl-hdd.txt" >nul 2>&1
cls
"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo HDD Selected:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
"%~dp0BAT\hdl_dump" query | findstr "%hdlhdd%"
"%~dp0BAT\Diagbox" gd 0f
echo.

    wmic diskdrive get name,model,status > "%~dp0TMP\hdl-hddinfolog.txt"
    type "%~dp0TMP\hdl-hddinfolog.txt" | findstr "Model %@hdl_pathinfo%" > "%~dp0TMP\hdl-hddinfotmp.txt"
	"%~dp0BAT\busybox" sed -i "3,100d" "%~dp0TMP\hdl-hddinfotmp.txt"
	"%~dp0BAT\busybox" cat "%~dp0TMP\hdl-hddinfotmp.txt"
	
"%~dp0BAT\Diagbox" gd 0c	
echo\
echo\
echo Are you sure you want to format this hard drive to PS2 format ?:
"%~dp0BAT\Diagbox" gd 0f
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) %YES%
"%~dp0BAT\Diagbox" gd 0c
echo         2) %NO%
"%~dp0BAT\Diagbox" gd 07
echo\
CHOICE /C 12 /M "Select Option:"

IF ERRORLEVEL 1 set @pfs_formathdd=yes
IF ERRORLEVEL 2 set @pfs_formathdd=no & set "hdlhddm=" & set "hdlhdd=" & set "@hdl_path=" & set "@hdl_pathinfo=" & (goto formatHDDtoPS2)

echo.

CHOICE /C YN /m "Confirm"
IF ERRORLEVEL 2 set "hdlhdd=" & set "hdlhddm=" & set "@hdl_path=" & set "@hdl_pathinfo=" & (goto formatHDDtoPS2)

cls
IF %@pfs_formathdd%==yes (
echo\
echo\
echo Formatting HDD:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
"%~dp0BAT\hdl_dump" query | findstr "%hdlhdd%"
"%~dp0BAT\Diagbox" gd 0f
echo\

    echo         Formatting in Progress...
	echo device %@hdl_path% > "%~dp0TMP\pfs-log.txt"
    echo initialize yes >> "%~dp0TMP\pfs-log.txt"
  	echo exit >> "%~dp0TMP\pfs-log.txt"
	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
	
	echo %@hdl_path% > "%~dp0TMP\disk-log.txt"
	"%~dp0BAT\busybox" sed -i "s/\\\\.\\\PhysicalDrive/select disk /g" "%~dp0TMP\disk-log.txt"
	echo offline disk >> "%~dp0TMP\disk-log.txt"
	type "%~dp0TMP\disk-log.txt" | "diskpart" >nul 2>&1
	
	echo %@hdl_path% > "%~dp0TMP\disk-log.txt"
	"%~dp0BAT\busybox" sed -i "s/\\\\.\\\PhysicalDrive/select disk /g" "%~dp0TMP\disk-log.txt"
	echo online disk >> "%~dp0TMP\disk-log.txt"
	type "%~dp0TMP\disk-log.txt" | "diskpart" >nul 2>&1
	
	REM echo         Generating PFS filesystem for system partitions...
	echo         Formatting HDD completed...
	
	) else ( echo          HDD - Not Detected... )

rmdir /Q/S "%~dp0TMP" >nul 2>&1
del info.sys >nul 2>&1

echo\
echo\
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo Formatting Completed...
echo\
echo\
"%~dp0BAT\Diagbox" gd 07

pause & (goto HDDManagementMenu)

REM ####################################################################################################################################################
:hackHDDtoPS2

cd /d "%~dp0"
mkdir "%~dp0TMP" >nul 2>&1

cls
"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo Scanning HDDs:
echo ----------------------------------------------------
    "%~dp0BAT\Diagbox" gd 03
	"%~dp0BAT\hdl_dump" query | findstr hdd[1-9]
	"%~dp0BAT\Diagbox" gd 07
    echo.
    echo ----------------------------------------------------
	"%~dp0BAT\Diagbox" gd 0c
	echo WARNING: MAKE SURE YOU CHOOSE THE RIGHT HARD DRIVE YOU WANT TO HACK
	"%~dp0BAT\Diagbox" gd 06
	echo.
	echo NOTE: If no PS2 HDDs are found, quit and retry after disconnecting
	echo all disk drives EXCEPT for your PC boot drive and the PS2 HDDs.
	echo.
	"%~dp0BAT\Diagbox" gd 0c
	echo Disclaimer: I can in no way be held responsible for improper use.
	"%~dp0BAT\Diagbox" gd 06
	echo\
	echo If you cannot choose your hard drive from the list, choose option 7.
	"%~dp0BAT\Diagbox" gd 07
	echo. 
	echo PLAYSTATION 2 HDD Extraction
	echo 	1. hdd1:
	echo 	2. hdd2:
	echo 	3. hdd3:
	echo 	4. hdd4:
	echo 	5. hdd5:
	echo 	6. hdd6:
	echo 	7. hdd#: Manual search (More HDD)
	echo 	9. Back to main menu
	echo\
	choice /c 123456789 /m "Select Option:"
	
	if errorlevel 1 set hdlhdd=hdd1:
	if errorlevel 2 set hdlhdd=hdd2:
	if errorlevel 3 set hdlhdd=hdd3:
	if errorlevel 4 set hdlhdd=hdd4:
	if errorlevel 5 set hdlhdd=hdd5:
	if errorlevel 6 set hdlhdd=hdd6:
	if errorlevel 7 set hdlhddm=yes
	if errorlevel 9 (goto HDDManagementMenu)
  
    IF "!hdlhddm!"=="yes" (
    
	echo\
    echo What is the number of my hard drive? / The one next to the hdd#: in the scanned HDDs
    echo Example If you want to hack hdd7: type 7
    echo\
	
    set choice=
    set /p choice=Enter the number of the hard drive you want to Hack:
    echo\
    IF "!choice!"=="" set "hdlhddm=" & set "hdlhdd=" & set "@hdl_path=" & set "@hdl_pathinfo=" & (goto hackHDDtoPS2)
    IF "!choice!"=="!choice!" set hdlhdd=hdd!choice!:
    IF "!choice!"=="Q" (goto  HDDManagementMenu)
   
   )

mkdir "%~dp0TMP" >nul 2>&1
"%~dp0BAT\Diagbox" gd 00
echo\
echo\
echo Prepare HDD for formatting: >nul 2>&1
echo ---------------------------------------------------- >nul 2>&1
"%~dp0BAT\hdl_dump" query | findstr "%hdlhdd%"
"%~dp0BAT\hdl_dump" query | findstr "%hdlhdd%" | "%~dp0BAT\busybox" cut -c2-6 > "%~dp0TMP\hdl-hdd.txt"
"%~dp0BAT\busybox" sed -i "s/hdd/\\\\.\\\PhysicalDrive/g; s/://g" "%~dp0TMP\hdl-hdd.txt"
set /P @hdl_path=<"%~dp0TMP\hdl-hdd.txt"

copy "%~dp0TMP\hdl-hdd.txt" "%~dp0TMP\hdl-hddinfo.txt" >nul 2>&1
"%~dp0BAT\busybox" sed -i "s/\\\\.\\\PhysicalDrive/PHYSICALDRIVE/g; s/://g" "%~dp0TMP\hdl-hddinfo.txt"
set /P @hdl_pathinfo=<"%~dp0TMP\hdl-hddinfo.txt"

REM del "%~dp0TMP\hdl-hdd.txt" >nul 2>&1
cls
"%~dp0BAT\Diagbox" gd 0e
echo\
echo HDD Selected:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
"%~dp0BAT\hdl_dump" query | findstr "%hdlhdd%"
"%~dp0BAT\Diagbox" gd 0f
echo.

    wmic diskdrive get name,model,status > "%~dp0TMP\hdl-hddinfolog.txt"
    type "%~dp0TMP\hdl-hddinfolog.txt" | findstr "Model %@hdl_pathinfo%" > "%~dp0TMP\hdl-hddinfotmp.txt"
	"%~dp0BAT\busybox" sed -i "3,100d" "%~dp0TMP\hdl-hddinfotmp.txt"
	"%~dp0BAT\busybox" cat "%~dp0TMP\hdl-hddinfotmp.txt"

rmdir /Q/S "%~dp0\^!COPY_TO_USB_ROOT" >nul 2>&1
md "%~dp0\^!COPY_TO_USB_ROOT" >nul 2>&1
"%~dp0BAT\7z" x -bso0 "%~dp0BAT\^!COPY_TO_USB_ROOT.7z" -o"%~dp0\^!COPY_TO_USB_ROOT" >nul 2>&1
REM xcopy "%~dp0BAT\^!COPY_TO_USB_ROOT" "%~dp0\^!COPY_TO_USB_ROOT" /e >nul 2>&1

"%~dp0BAT\Diagbox" gd 0c 
echo\
echo ARE YOU SURE you want to HACK this hard drive ? this is irreversible:
echo.
echo If you have already installed FreeHDBoot (From HDD), you don't need to do this
echo.
echo (1) After the hacking put your HDD in your PS2 and format your hard drive with wLaunchELF
echo In wLaunchELF FileBrowser ^> MISC ^> HDDManager ^> Press R1 ^> Format and confirm.
echo.
echo (2) Copy the contents of the ^!COPY_TO_USB_ROOT folder to the root of your USB drive 
echo.
echo (3) Install FreeMcBoot (From Memory Card) or FreeHDBoot (From HDD) or both.
echo In wLaunchELF FileBrowser ^> Mass ^> APPS ^> FreeMcBoot ^> FMCBInstaller.elf Press Circle for Launch ^> Press R1 ^> Install FHDB (From HDD)
echo.
echo (4) Your hard drive will be properly formatted and hacked after that
echo.
echo (5) Have Fun
echo.
"%~dp0BAT\Diagbox" gd 0f
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) %YES%
"%~dp0BAT\Diagbox" gd 0c
echo         2) %NO%
"%~dp0BAT\Diagbox" gd 07
echo\
CHOICE /C 12 /M "Select Option:"

IF ERRORLEVEL 1 set @pfs_hackhdd=yes
IF ERRORLEVEL 2 rmdir /Q/S "%~dp0\^!COPY_TO_USB_ROOT" >nul 2>&1 & set "hdlhddm=" & set "hdlhdd=" & set "@hdl_path=" & set "@hdl_pathinfo=" & (goto hackHDDtoPS2)
IF ERRORLEVEL 2 set @pfs_hackhdd=no

echo.

CHOICE /C YN /m "Confirm"
IF ERRORLEVEL 2 rmdir /Q/S "%~dp0\^!COPY_TO_USB_ROOT" >nul 2>&1 & set "hdlhddm=" & set "hdlhdd=" & set "@hdl_path=" & set "@hdl_pathinfo=" & (goto hackHDDtoPS2) 


cls
IF %@pfs_hackhdd%==yes (
echo\
echo\
echo Install HACK PS2 HDD:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
"%~dp0BAT\hdl_dump" query | findstr "%hdlhdd%"
"%~dp0BAT\Diagbox" gd 0f
echo\

    echo         Hacking in progress...
	echo "%~dp0BAT\rawcopy" "%~dp0BAT\mbr.img" %@hdl_path% > "%~dp0TMP\disk-log.bat"
	call "%~dp0TMP\disk-log.bat"
	
	echo %@hdl_path% > "%~dp0TMP\disk-log.txt"
	"%~dp0BAT\busybox" sed -i "s/\\\\.\\\PhysicalDrive/select disk /g" "%~dp0TMP\disk-log.txt"
	echo offline disk >> "%~dp0TMP\disk-log.txt"
	type "%~dp0TMP\disk-log.txt" | "diskpart" >nul 2>&1
	
	echo %@hdl_path% > "%~dp0TMP\disk-log.txt"
	"%~dp0BAT\busybox" sed -i "s/\\\\.\\\PhysicalDrive/select disk /g" "%~dp0TMP\disk-log.txt"
	echo online disk >> "%~dp0TMP\disk-log.txt"
	type "%~dp0TMP\disk-log.txt" | "diskpart" >nul 2>&1
	echo         Hacking completed...
	
	) else ( echo        Hack HDD - Canceled... )

rmdir /Q/S "%~dp0TMP" >nul 2>&1
del info.sys >nul 2>&1

echo\
echo\
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo Hack Completed...
echo\
echo\
"%~dp0BAT\Diagbox" gd 07

"%~dp0\^!COPY_TO_USB_ROOT\README.txt"

pause & (goto HDDManagementMenu)

REM ##############################################################################################################################################################
:InstallHDDOSD

cd "%~dp0"

cls
echo\
echo\
echo Checking Files For HDDOSD-1.10U...
echo ----------------------------------------------------
timeout 1 >nul

REM __system\osd100\FNTOSD
if not exist "%~dp0HDD-OSD\__system\osd100\FNTOSD" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__system\osd100\FNTOSD"
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__system\osd100\FNTOSD
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ 17c8ec6119192ca01e949e05f6f246e4 (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__system\osd100\FNTOSD"
"%~dp0BAT\Diagbox" gd 0a                    
echo %md5% Confirmed 
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__system\osd100\FNTOSD"
echo MD5 not Match Your file is probably corrupted
echo\
pause & (goto  HDDOSDMenu)
echo\
 )

REM __system\osd100\hosdsys.elf
if not exist "%~dp0HDD-OSD\__system\osd100\hosdsys.elf" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__system\osd100\hosdsys.elf"
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__system\osd100\hosdsys.elf
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ ca9ab553e8b51259ccf1ca4ea2d1bc00 (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__system\osd100\hosdsys.elf"
"%~dp0BAT\Diagbox" gd 0a                   
echo %md5% Confirmed 
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__system\osd100\hosdsys.elf"
echo MD5 not Match Your file is probably corrupted
echo\
pause & (goto  HDDOSDMenu)
 )
 
REM __system\osd100\ICOIMAGE
if not exist "%~dp0HDD-OSD\__system\osd100\ICOIMAGE" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__system\osd100\ICOIMAGE"
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__system\osd100\ICOIMAGE
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ 33a3a304d2ec3892e24d7a5aab9dbc03 (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__system\osd100\ICOIMAGE"
"%~dp0BAT\Diagbox" gd 0a                     
echo %md5% Confirmed 
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__system\osd100\ICOIMAGE" 
echo MD5 not Match Your file is probably corrupted
echo\
pause & (goto  HDDOSDMenu)
 )
 
 
REM __system\osd100\JISUCS
if not exist "%~dp0HDD-OSD\__system\osd100\JISUCS" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__system\osd100\JISUCS"
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__system\osd100\JISUCS
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ 221c517ede8f1caf4ccf9bfddba1524c (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__system\osd100\JISUCS"
"%~dp0BAT\Diagbox" gd 0a                     
echo %md5% Confirmed 
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__system\osd100\JISUCS" 
echo MD5 not Match Your file is probably corrupted
echo\
pause & (goto  HDDOSDMenu)
 )
 
REM __system\osd100\SKBIMAGE
if not exist "%~dp0HDD-OSD\__system\osd100\SKBIMAGE" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__system\osd100\SKBIMAGE"
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__system\osd100\SKBIMAGE
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ 99220367a205fc45e743895759e79281 (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__system\osd100\SKBIMAGE"
"%~dp0BAT\Diagbox" gd 0a                     
echo %md5% Confirmed 
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__system\osd100\SKBIMAGE" 
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )
 
REM __system\osd100\SNDIMAGE
if not exist "%~dp0HDD-OSD\__system\osd100\SNDIMAGE" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__system\osd100\SNDIMAGE"
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__system\osd100\SNDIMAGE
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ 784bd4bb1e8327ef2907dfc8c574cda4 (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__system\osd100\SNDIMAGE"
"%~dp0BAT\Diagbox" gd 0a                     
echo %md5% Confirmed 
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__system\osd100\SNDIMAGE"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )
 
REM __system\osd100\TEXIMAGE
if not exist "%~dp0HDD-OSD\__system\osd100\TEXIMAGE" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__system\osd100\TEXIMAGE"
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__system\osd100\TEXIMAGE
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ 08e42817da1d2480e883851e5d88f0e5 (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__system\osd100\TEXIMAGE"
"%~dp0BAT\Diagbox" gd 0a                    
echo %md5% Confirmed 
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__system\osd100\TEXIMAGE"
echo MD5 not Match Your file is probably corrupted
echo\
pause & (goto  HDDOSDMenu)
 )
 
REM __system\fsck100\FSCK_A.XLF
if not exist "%~dp0HDD-OSD\__system\fsck100\FSCK_A.XLF" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__system\osd100\FSCK_A.XLF"
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__system\fsck100\FSCK_A.XLF
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ 3618ec7d45413f12a13a63ceada96620 (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__system\fsck100\FSCK_A.XLF"
"%~dp0BAT\Diagbox" gd 0a                   
echo %md5% Confirmed 
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__system\fsck100\FSCK_A.XLF"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )
 
REM __system\fsck100\files\FILES_A.PAK
if not exist "%~dp0HDD-OSD\__system\fsck100\files\FILES_A.PAK" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__system\osd100\FSCK_A.XLF"
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__system\fsck100\files\FILES_A.PAK
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ c7b28caaee8c91e17ee663bdca179108 (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__system\fsck100\files\FILES_A.PAK"
"%~dp0BAT\Diagbox" gd 0a          
echo %md5% Confirmed 
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__system\fsck100\files\FILES_A.PAK"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )
 
REM __sysconf\CONF\FILETYPE.INI
if not exist "%~dp0HDD-OSD\__sysconf\CONF\FILETYPE.INI" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\CONF\FILETYPE.INI"
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__sysconf\CONF\FILETYPE.INI
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ 3b0c10c058f0f630973dd07db2ea8860 (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__sysconf\CONF\FILETYPE.INI"
"%~dp0BAT\Diagbox" gd 0a         
echo %md5% Confirmed 
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\CONF\FILETYPE.INI"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )
 
REM __sysconf\CONF\SYSTEM.INI
if not exist "%~dp0HDD-OSD\__sysconf\CONF\SYSTEM.INI" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\CONF\SYSTEM.INI" 
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__sysconf\CONF\SYSTEM.INI
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ 895fad012365b59e47a3f563daadbb86 (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__sysconf\CONF\SYSTEM.INI"
"%~dp0BAT\Diagbox" gd 0a         
echo %md5% Confirmed 
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\CONF\SYSTEM.INI"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )
 
REM __sysconf\CONF\SYSTEM101.INI
if not exist "%~dp0HDD-OSD\__sysconf\CONF\SYSTEM101.INI" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\CONF\SYSTEM101.INI" 
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__sysconf\CONF\SYSTEM101.INI
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ 184207759080a81779b8e124ee340075 (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__sysconf\CONF\SYSTEM101.INI"
"%~dp0BAT\Diagbox" gd 0a         
echo %md5% Confirmed 
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\CONF\SYSTEM101.INI"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )
 
REM __sysconf\CONF\SYSTEMDUT.INI
if not exist "%~dp0HDD-OSD\__sysconf\CONF\SYSTEMDUT.INI" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\CONF\SYSTEMDUT.INI" 
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__sysconf\CONF\SYSTEMDUT.INI
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ 7fbbd9c08962866504d633e1e219872e (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__sysconf\CONF\SYSTEMDUT.INI"
"%~dp0BAT\Diagbox" gd 0a         
echo %md5% Confirmed 
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\CONF\SYSTEMDUT.INI"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )
 
REM __sysconf\CONF\SYSTEMEUK.INI
if not exist "%~dp0HDD-OSD\__sysconf\CONF\SYSTEMEUK.INI" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\CONF\SYSTEMEUK.INI" 
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__sysconf\CONF\SYSTEMEUK.INI
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ fe9a4764c855dc6fa0284efe36463680 (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__sysconf\CONF\SYSTEMEUK.INI"
"%~dp0BAT\Diagbox" gd 0a          
echo %md5% Confirmed 
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\CONF\SYSTEMEUK.INI"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )
 
REM __sysconf\CONF\SYSTEMFCA.INI
if not exist "%~dp0HDD-OSD\__sysconf\CONF\SYSTEMFCA.INI" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\CONF\SYSTEMFCA.INI" 
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__sysconf\CONF\SYSTEMFCA.INI
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ 1d1a89b210b1620c7530451ca3211cac (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__sysconf\CONF\SYSTEMFCA.INI"
"%~dp0BAT\Diagbox" gd 0a           
echo %md5% Confirmed 
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\CONF\SYSTEMFCA.INI"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )
 
REM __sysconf\CONF\SYSTEMFRE.INI
if not exist "%~dp0HDD-OSD\__sysconf\CONF\SYSTEMFRE.INI" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\CONF\SYSTEMFRE.INI" 
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__sysconf\CONF\SYSTEMFRE.INI
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ 74db7d226eba87daca9036c79928c787 (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__sysconf\CONF\SYSTEMFRE.INI"   
"%~dp0BAT\Diagbox" gd 0a          
echo %md5% Confirmed 
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\CONF\SYSTEMFRE.INI"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )
 
REM __sysconf\CONF\SYSTEMGER.INI
if not exist "%~dp0HDD-OSD\__sysconf\CONF\SYSTEMGER.INI" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\CONF\SYSTEMGER.INI" 
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__sysconf\CONF\SYSTEMGER.INI
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ a7eb2f27f3e8f5a3351fba38709e6384 (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__sysconf\CONF\SYSTEMGER.INI"
"%~dp0BAT\Diagbox" gd 0a          
echo %md5% Confirmed 
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\CONF\SYSTEMGER.INI"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )


REM __sysconf\CONF\SYSTEMITA.INI
if not exist "%~dp0HDD-OSD\__sysconf\CONF\SYSTEMITA.INI" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\CONF\SYSTEMITA.INI" 
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__sysconf\CONF\SYSTEMITA.INI
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ b0ad0dbc751369e5f4b200a62b5acbd0 (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__sysconf\CONF\SYSTEMITA.INI"
"%~dp0BAT\Diagbox" gd 0a           
echo %md5% Confirmed 
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\CONF\SYSTEMITA.INI"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )
 
REM __sysconf\CONF\SYSTEMPOR.INI
if not exist "%~dp0HDD-OSD\__sysconf\CONF\SYSTEMPOR.INI" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\CONF\SYSTEMPOR.INI" 
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__sysconf\CONF\SYSTEMPOR.INI
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ 215627b9bc74418a6982b9ea8e4ce786 (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__sysconf\CONF\SYSTEMPOR.INI"
"%~dp0BAT\Diagbox" gd 0a          
echo %md5% Confirmed 
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\CONF\SYSTEMPOR.INI"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )

REM __sysconf\CONF\SYSTEMSPA.INI
if not exist "%~dp0HDD-OSD\__sysconf\CONF\SYSTEMSPA.INI" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\CONF\SYSTEMSPA.INI" 
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__sysconf\CONF\SYSTEMSPA.INI
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ d950838548cdbe10a08a9daf3d109da8 (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__sysconf\CONF\SYSTEMSPA.INI"    
"%~dp0BAT\Diagbox" gd 0a         
echo %md5% Confirmed 
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\CONF\SYSTEMSPA.INI"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )
 
REM __sysconf\FONT\S22I646.GF
if not exist "%~dp0HDD-OSD\__sysconf\FONT\S22I646.GF" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\FONT\S22I646.GF" 
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__sysconf\FONT\S22I646.GF
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ e4eb6119e6c6aaa6e948769b1a11c825 (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__sysconf\FONT\S22I646.GF"
"%~dp0BAT\Diagbox" gd 0a          
echo %md5% Confirmed 
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\FONT\S22I646.GF"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )
 
REM __sysconf\FONT\S22J201.GF
if not exist "%~dp0HDD-OSD\__sysconf\FONT\S22J201.GF" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\FONT\S22I646.GF" 
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__sysconf\FONT\S22J201.GF
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ 13d29bcb4c7c9b1d56a415003fae0da8 (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__sysconf\FONT\S22J201.GF"      
"%~dp0BAT\Diagbox" gd 0a      
echo %md5% Confirmed 
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\FONT\S22J201.GF"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )

REM __sysconf\FONT\S22J213.GF
if not exist "%~dp0HDD-OSD\__sysconf\FONT\S22J213.GF" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\FONT\S22J213.GF" 
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__sysconf\FONT\S22J213.GF
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ 0dd5bbcc387db16eb4c954be89888fcf (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__sysconf\FONT\S22J213.GF"      
"%~dp0BAT\Diagbox" gd 0a      
echo %md5% Confirmed 
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\FONT\S22J213.GF"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )
 
REM __sysconf\FONT\S22ULST.GF
if not exist "%~dp0HDD-OSD\__sysconf\FONT\S22ULST.GF" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\FONT\S22ULST.GF" 
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__sysconf\FONT\S22ULST.GF
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ e489297f6100819b0b9b68bc1b5181aa (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__sysconf\FONT\S22ULST.GF"      
"%~dp0BAT\Diagbox" gd 0a      
echo %md5% Confirmed 
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\FONT\S22ULST.GF"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )

REM __sysconf\FONT\S26I646.GF
if not exist "%~dp0HDD-OSD\__sysconf\FONT\S26I646.GF" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\FONT\S26I646.GF" 
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__sysconf\FONT\S26I646.GF
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ 26edc62c3c9cbbc0227dba1135d2bffb (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__sysconf\FONT\S26I646.GF"      
"%~dp0BAT\Diagbox" gd 0a      
echo %md5% Confirmed 
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\FONT\S26I646.GF"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )

REM __sysconf\FONT\S26J201.GF
if not exist "%~dp0HDD-OSD\__sysconf\FONT\S26J201.GF" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\FONT\S26J201.GF" 
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__sysconf\FONT\S26J201.GF
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ 17a03c0088d2cc48d95c40d445b2afe6 (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__sysconf\FONT\S26J201.GF"      
"%~dp0BAT\Diagbox" gd 0a      
echo %md5% Confirmed
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\FONT\S26J201.GF"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )
 
REM __sysconf\FONT\S26J213.GF
if not exist "%~dp0HDD-OSD\__sysconf\FONT\S26J213.GF" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\FONT\S26J213.GF" 
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__sysconf\FONT\S26J213.GF
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ 7ccb142ed25afb8f483202a9c713636c (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__sysconf\FONT\S26J213.GF"      
"%~dp0BAT\Diagbox" gd 0a      
echo %md5% Confirmed
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\FONT\S26J213.GF"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )

REM __sysconf\FONT\S26ULST.GF
if not exist "%~dp0HDD-OSD\__sysconf\FONT\S26ULST.GF" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\FONT\S26ULST.GF" 
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__sysconf\FONT\S26ULST.GF
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ 3ae70fdd7db7cda669b6dbfbdf8a6368 (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__sysconf\FONT\S26ULST.GF"      
"%~dp0BAT\Diagbox" gd 0a      
echo %md5% Confirmed
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\FONT\S26ULST.GF"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )
 
REM __sysconf\FONT\SCE20I22.GF
if not exist "%~dp0HDD-OSD\__sysconf\FONT\SCE20I22.GF" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\FONT\SCE20I22.GF" 
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__sysconf\FONT\SCE20I22.GF
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ b7be6961ba83a8f8b411b18fe30a02cc (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__sysconf\FONT\SCE20I22.GF"      
"%~dp0BAT\Diagbox" gd 0a      
echo %md5% Confirmed
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\FONT\SCE20I22.GF"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )

REM __sysconf\FONT\SCE24I26.GF
if not exist "%~dp0HDD-OSD\__sysconf\FONT\SCE24I26.GF" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\FONT\SCE24I26.GF" 
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__sysconf\FONT\SCE24I26.GF
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ 941335d6e6f3befe4aa7b58ef228b831 (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__sysconf\FONT\SCE24I26.GF"      
"%~dp0BAT\Diagbox" gd 0a      
echo %md5% Confirmed
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\FONT\SCE24I26.GF"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )
 
REM __sysconf\ICON\ICON.SYS
if not exist "%~dp0HDD-OSD\__sysconf\ICON\ICON.SYS" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\ICON\ICON.SYS" 
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__sysconf\ICON\ICON.SYS
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ b2d4de12ed4c2c80a3594b2fb3655edb (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__sysconf\ICON\ICON.SYS"      
"%~dp0BAT\Diagbox" gd 0a      
echo %md5% Confirmed
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\ICON\ICON.SYS"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )
 
REM __sysconf\ICON\OTHERS.ICO
if not exist "%~dp0HDD-OSD\__sysconf\ICON\OTHERS.ICO" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\ICON\OTHERS.ICO" 
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__sysconf\ICON\OTHERS.ICO
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ 737c0a56b22f3d116ab6420885754335 (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__sysconf\ICON\OTHERS.ICO"      
"%~dp0BAT\Diagbox" gd 0a      
echo %md5% Confirmed
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\ICON\OTHERS.ICO"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )
 
REM __sysconf\ICON\AUDIO\AUDIO.ICO
if not exist "%~dp0HDD-OSD\__sysconf\ICON\AUDIO\AUDIO.ICO" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\ICON\AUDIO\AUDIO.ICO" 
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__sysconf\ICON\AUDIO\AUDIO.ICO
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ 8c0452693ae78eaa6d8f59c364b0e338 (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__sysconf\ICON\AUDIO\AUDIO.ICO"      
"%~dp0BAT\Diagbox" gd 0a      
echo %md5% Confirmed
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\ICON\AUDIO\AUDIO.ICO"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )

REM __sysconf\ICON\AUDIO\ICON.SYS
if not exist "%~dp0HDD-OSD\__sysconf\ICON\AUDIO\ICON.SYS" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\ICON\AUDIO\ICON.SYS" 
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__sysconf\ICON\AUDIO\ICON.SYS
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ ef7e169fb0d3f620b80399de9437f9b5 (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__sysconf\ICON\AUDIO\ICON.SYS"      
"%~dp0BAT\Diagbox" gd 0a      
echo %md5% Confirmed
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\ICON\AUDIO\ICON.SYS"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 ) 


REM __sysconf\ICON\HTML\HTML.ICO
if not exist "%~dp0HDD-OSD\__sysconf\ICON\HTML\HTML.ICO" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\ICON\HTML\HTML.ICO" 
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__sysconf\ICON\HTML\HTML.ICO
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ 3cb7f0536457667b87c98dfc3a9c615f (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__sysconf\ICON\HTML\HTML.ICO"      
"%~dp0BAT\Diagbox" gd 0a      
echo %md5% Confirmed
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\ICON\HTML\HTML.ICO"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )

REM __sysconf\ICON\HTML\ICON.SYS
if not exist "%~dp0HDD-OSD\__sysconf\ICON\HTML\ICON.SYS" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\ICON\HTML\ICON.SYS" 
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__sysconf\ICON\HTML\ICON.SYS
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ b8759abc47cf4c46f7d4c3891a44faec (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__sysconf\ICON\HTML\ICON.SYS"      
"%~dp0BAT\Diagbox" gd 0a      
echo %md5% Confirmed
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\ICON\HTML\ICON.SYS"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )

REM __sysconf\ICON\IMAGE\IMAGE.ICO
if not exist "%~dp0HDD-OSD\__sysconf\ICON\IMAGE\IMAGE.ICO" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\ICON\IMAGE\IMAGE.ICO" 
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__sysconf\ICON\IMAGE\IMAGE.ICO
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ f0e2c7768b367b96ff37752a39ce9cf5 (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__sysconf\ICON\IMAGE\IMAGE.ICO"      
"%~dp0BAT\Diagbox" gd 0a      
echo %md5% Confirmed
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\ICON\IMAGE\IMAGE.ICO"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )

REM __sysconf\ICON\IMAGE\ICON.SYS
if not exist "%~dp0HDD-OSD\__sysconf\ICON\IMAGE\ICON.SYS" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\ICON\IMAGE\ICON.SYS" 
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__sysconf\ICON\IMAGE\ICON.SYS
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ 35a674261d885a875db976900b945181 (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__sysconf\ICON\IMAGE\ICON.SYS"      
"%~dp0BAT\Diagbox" gd 0a      
echo %md5% Confirmed
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\ICON\IMAGE\ICON.SYS"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )
 
REM __sysconf\ICON\TEXT\TEXT.ICO
if not exist "%~dp0HDD-OSD\__sysconf\ICON\TEXT\TEXT.ICO" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\ICON\TEXT\TEXT.ICO" 
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__sysconf\ICON\TEXT\TEXT.ICO
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ 555b113797ad185d4187e17e27df9c9e (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__sysconf\ICON\TEXT\TEXT.ICO"      
"%~dp0BAT\Diagbox" gd 0a      
echo %md5% Confirmed
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\ICON\TEXT\TEXT.ICO"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )

REM __sysconf\ICON\TEXT\ICON.SYS
if not exist "%~dp0HDD-OSD\__sysconf\ICON\TEXT\ICON.SYS" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\ICON\TEXT\ICON.SYS" 
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__sysconf\ICON\TEXT\ICON.SYS
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ 6bbe982a18e25d7d7863a741f56e0e2a (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__sysconf\ICON\TEXT\ICON.SYS"      
"%~dp0BAT\Diagbox" gd 0a      
echo %md5% Confirmed
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\ICON\TEXT\ICON.SYS"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )
 
REM __sysconf\ICON\VIDEO\VIDEO.ICO
if not exist "%~dp0HDD-OSD\__sysconf\ICON\VIDEO\VIDEO.ICO" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\ICON\VIDEO\VIDEO.ICO" 
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__sysconf\ICON\VIDEO\VIDEO.ICO
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ 1bb1f10cb944212ce602eb317a85cef0 (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__sysconf\ICON\VIDEO\VIDEO.ICO"      
"%~dp0BAT\Diagbox" gd 0a      
echo %md5% Confirmed
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\ICON\VIDEO\VIDEO.ICO"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )
 
REM __sysconf\ICON\VIDEO\ICON.SYS
if not exist "%~dp0HDD-OSD\__sysconf\ICON\VIDEO\ICON.SYS" (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\ICON\VIDEO\ICON.SYS" 
echo Missing
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
)

set file=%~dp0HDD-OSD\__sysconf\ICON\VIDEO\ICON.SYS
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%

if %md5% equ e99de68551b255f180ade8e64d812d2b (
"%~dp0BAT\Diagbox" gd 0e
echo Files "__sysconf\ICON\VIDEO\ICON.SYS"      
"%~dp0BAT\Diagbox" gd 0a      
echo %md5% Confirmed
echo\
   ) else (
"%~dp0BAT\Diagbox" gd 0c
echo Files "__sysconf\ICON\VIDEO\ICON.SYS"
echo MD5 not Match Your file is probably corrupted
echo\
"%~dp0BAT\Diagbox" gd 0f
pause & (goto  HDDOSDMenu)
 )

"%~dp0BAT\Diagbox" gd 0f
pause
cls
mkdir "%~dp0TMP" >nul 2>&1
"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo Scanning for Playstation 2 HDDs:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD"
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD" | "%~dp0BAT\busybox" cut -c2-6 > "%~dp0TMP\hdl-hdd.txt"
"%~dp0BAT\busybox" sed -i "s/hdd/\\\\.\\\PhysicalDrive/g; s/://g" "%~dp0TMP\hdl-hdd.txt" >nul 2>&1

set /P @hdl_path=<"%~dp0TMP\hdl-hdd.txt"
del "%~dp0TMP\hdl-hdd.txt" >nul 2>&1
IF "!@hdl_path!"=="" ( 
"%~dp0BAT\Diagbox" gd 0c
		echo         Playstation 2 HDD Not Detected
		echo         Drive Must Be Formatted First
		echo\
		echo\
"%~dp0BAT\Diagbox" gd 07
		rmdir /Q/S "%~dp0TMP" >nul 2>&1
		del info.sys >nul 2>&1
        pause & (goto HDDOSDMenu)
	)
"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo Install HDD-OSD:
"%~dp0BAT\Diagbox" gd 0c 
echo\
echo MAKE SURE You have Installed FreeHDBoot (From HDD) 
"%~dp0BAT\Diagbox" gd 0f
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) Yes
"%~dp0BAT\Diagbox" gd 0c
echo         2) No
"%~dp0BAT\Diagbox" gd 0f
echo\
CHOICE /C 12 /M "Select Option:"

IF ERRORLEVEL 1 set @pfs_installhddosd=yes
IF ERRORLEVEL 2 set @pfs_installhddosd=no

"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo Detecting __sysconf Partition:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0f

	echo device !@hdl_path! > "%~dp0TMP\pfs-prt.txt"
	echo ls -l >> "%~dp0TMP\pfs-prt.txt"
	echo exit >> "%~dp0TMP\pfs-prt.txt"
	type "%~dp0TMP\pfs-prt.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-prt.log"
	"%~dp0BAT\busybox" cat "%~dp0TMP\pfs-prt.log" | "%~dp0BAT\busybox" grep "__sysconf" | "%~dp0BAT\busybox" sed "s/.*__sysconf/__sysconf/" | "%~dp0BAT\busybox" tr -d " " | "%~dp0BAT\busybox" head -1 | "%~dp0BAT\busybox" sed -e "s/@/\//g" > "%~dp0TMP\hdd-prt.txt"
	set /P @hdd_avl=<"%~dp0TMP\hdd-prt.txt"
	del "%~dp0TMP\pfs-prt.txt" "%~dp0TMP\pfs-prt.log" >nul 2>&1 "%~dp0TMP\hdd-prt.txt"

	IF "!@hdd_avl!"=="__sysconf/" (
	"%~dp0BAT\Diagbox" gd 0a
		echo         __sysconf - Partition Detected
		) else (
		"%~dp0BAT\Diagbox" gd 0c
		echo         __sysconf - Partition NOT Detected
		echo         Partition Must Be Formatted Or Created
		echo\
		echo\
		rmdir /Q/S "%~dp0TMP" >nul 2>&1
		del info.sys >nul 2>&1
		pause & (goto HDDOSDMenu)
		)

"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo Detecting __system Partition:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0f

	echo device !@hdl_path! > "%~dp0TMP\pfs-prt.txt"
	echo ls -l >> "%~dp0TMP\pfs-prt.txt"
	echo exit >> "%~dp0TMP\pfs-prt.txt"
	type "%~dp0TMP\pfs-prt.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-prt.log"
	"%~dp0BAT\busybox" cat "%~dp0TMP\pfs-prt.log" | "%~dp0BAT\busybox" grep "__system" | "%~dp0BAT\busybox" sed "s/.*__system/__system/" | "%~dp0BAT\busybox" tr -d " " | "%~dp0BAT\busybox" head -1 | "%~dp0BAT\busybox" sed -e "s/@/\//g" > "%~dp0TMP\hdd-prt.txt"
	set /P @hdd_avl=<"%~dp0TMP\hdd-prt.txt"
	del "%~dp0TMP\pfs-prt.txt" "%~dp0TMP\pfs-prt.log" >nul 2>&1 "%~dp0TMP\hdd-prt.txt"

	IF "!@hdd_avl!"=="__system/" (
	"%~dp0BAT\Diagbox" gd 0a
		echo         __system - Partition Detected
		"%~dp0BAT\Diagbox" gd 0c
		) else (
		echo         __system - Partition NOT Detected
		echo         Partition Must Be Formatted Or Created
		echo\
		echo\
		rmdir /Q/S "%~dp0TMP" >nul 2>&1
		del info.sys >nul 2>&1
	    pause & (goto HDDOSDMenu)
		)

"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo Detecting +OPL Partition:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0f

	echo device !@hdl_path! > "%~dp0TMP\pfs-prt.txt"
	echo ls -l >> "%~dp0TMP\pfs-prt.txt"
	echo exit >> "%~dp0TMP\pfs-prt.txt"
	type "%~dp0TMP\pfs-prt.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-prt.log"
	"%~dp0BAT\busybox" cat "%~dp0TMP\pfs-prt.log" | "%~dp0BAT\busybox" grep "+OPL" | "%~dp0BAT\busybox" sed "s/.*+OPL/+OPL/" | "%~dp0BAT\busybox" tr -d " " | "%~dp0BAT\busybox" head -1 | "%~dp0BAT\busybox" sed -e "s/@/\//g" > "%~dp0TMP\hdd-prt.txt"
	set /P @hdd_avl=<"%~dp0TMP\hdd-prt.txt"
	del "%~dp0TMP\pfs-prt.txt" "%~dp0TMP\pfs-prt.log" >nul 2>&1 "%~dp0TMP\hdd-prt.txt"

	IF "!@hdd_avl!"=="+OPL/" (
	"%~dp0BAT\Diagbox" gd 0a
		echo         +OPL - Partition Detected
		) else (
		"%~dp0BAT\Diagbox" gd 0c
		echo         +OPL - Partition NOT Detected
		echo         Partition Must Be Formatted Or Created
		echo\
		echo\
		rmdir /Q/S "%~dp0TMP" >nul 2>&1
		del info.sys >nul 2>&1
		pause & (goto HDDOSDMenu)
		)

"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
pause
cls

IF %@pfs_installhddosd%==yes (

echo\
echo\
echo Installing HDD-OSD:
echo ----------------------------------------------------
echo\

REM __sysconf

IF /I EXIST "%~dp0HDD-OSD\__sysconf\*" (
	cd "%~dp0HDD-OSD\__sysconf"

	REM MOUNT __sysconf

	echo device !@hdl_path! > "%~dp0TMP\pfs-hddosd.txt"
	echo mount __sysconf >> "%~dp0TMP\pfs-hddosd.txt"
	
	REM HDD-OSD DIR (__sysconf\files.xxx)
	echo         Installing Que
    for %%0 in (*) do (echo put "%%0") >> "%~dp0TMP\pfs-hddosd.txt"

	REM HDDOSD 1 DIR (__sysconf\SUBDIR)

	for /D %%a in (*) do (
	echo mkdir "%%a" >> "%~dp0TMP\pfs-hddosd.txt"
	echo lcd "%%a" >> "%~dp0TMP\pfs-hddosd.txt"
 	echo cd "%%a" >> "%~dp0TMP\pfs-hddosd.txt"
 	cd "%%a"

	REM HDD-OSD FILES (__sysconf\SUBDIR\files.xxx)

 	for %%1 in (*) do (echo put "%%1") >> "%~dp0TMP\pfs-hddosd.txt"

	REM HDDOSD 2 SUBDIR (__sysconf\SUBDIR\SUBDIR)

	for /D %%b in (*) do (
	echo mkdir "%%b" >> "%~dp0TMP\pfs-hddosd.txt"
	echo lcd "%%b" >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd "%%b" >> "%~dp0TMP\pfs-hddosd.txt"
	cd "%%b"

	REM HDDOSD SUBDIR FILES (__sysconf\SUBDIR\SUBDIR\files.xxx)

	for %%2 in (*) do (echo put "%%2") >> "%~dp0TMP\pfs-hddosd.txt"
	
	REM HDDOSD 3 SUBDIR (__sysconf\SUBDIR\SUBDIR\SUBDIR)

	for /D %%c in (*) do (
	echo mkdir "%%c" >> "%~dp0TMP\pfs-hddosd.txt"
	echo lcd "%%c" >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd "%%c" >> "%~dp0TMP\pfs-hddosd.txt"
	cd "%%c"
	
	REM HDDOSD SUBDIR FILES (__sysconf\SUBDIR\SUBDIR\SUBDIR\files.xxx)
	
	for %%3 in (*) do (echo put "%%3") >> "%~dp0TMP\pfs-hddosd.txt"
	
    REM HDDOSD 4 SUBDIR (__sysconf\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR)

	for /D %%e in (*) do (
	echo mkdir "%%e" >> "%~dp0TMP\pfs-hddosd.txt"
	echo lcd "%%e" >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd "%%e" >> "%~dp0TMP\pfs-hddosd.txt"
	cd "%%e"
	
	REM HDDOSD SUBDIR FILES (__sysconf\SUBDIR\SUBDIR\SUBDIR\SUBDIR\files.xxx)
	
	for %%4 in (*) do (echo put "%%4") >> "%~dp0TMP\pfs-hddosd.txt"
	
	REM HDDOSD 5 SUBDIR (__sysconf\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\)

	for /D %%f in (*) do (
	echo mkdir "%%f" >> "%~dp0TMP\pfs-hddosd.txt"
	echo lcd "%%f" >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd "%%f" >> "%~dp0TMP\pfs-hddosd.txt"
	cd "%%f"
	
	REM HDDOSD SUBDIR FILES (__sysconf\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\files.xxx)
	
	for %%5 in (*) do (echo put "%%5") >> "%~dp0TMP\pfs-hddosd.txt"
	
	REM HDDOSD 6 SUBDIR (__sysconf\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\)

	for /D %%g in (*) do (
	echo mkdir "%%g" >> "%~dp0TMP\pfs-hddosd.txt"
	echo lcd "%%g" >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd "%%g" >> "%~dp0TMP\pfs-hddosd.txt"
	cd "%%g"
	
	REM HDDOSD SUBDIR FILES (__sysconf\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\files.xxx)
	
	for %%6 in (*) do (echo put "%%6") >> "%~dp0TMP\pfs-hddosd.txt"
	
	REM HDDOSD 7 SUBDIR (__sysconf\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\)

	for /D %%h in (*) do (
	echo mkdir "%%h" >> "%~dp0TMP\pfs-hddosd.txt"
	echo lcd "%%h" >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd "%%h" >> "%~dp0TMP\pfs-hddosd.txt"
	cd "%%h"
	
	REM HDDOSD SUBDIR FILES (__sysconf\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\files.xxx)
	
	for %%7 in (*) do (echo put "%%7") >> "%~dp0TMP\pfs-hddosd.txt"
	
	REM HDDOSD 8 SUBDIR (__sysconf\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\)

	for /D %%i in (*) do (
	echo mkdir "%%i" >> "%~dp0TMP\pfs-hddosd.txt"
	echo lcd "%%i" >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd "%%i" >> "%~dp0TMP\pfs-hddosd.txt"
	cd "%%i"
	
	REM HDDOSD SUBDIR FILES (__sysconf\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\files.xxx)
	
	for %%8 in (*) do (echo put "%%8") >> "%~dp0TMP\pfs-hddosd.txt"
	
	REM HDDOSD 9 SUBDIR (__sysconf\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\)

	for /D %%j in (*) do (
	echo mkdir "%%j" >> "%~dp0TMP\pfs-hddosd.txt"
	echo lcd "%%j" >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd "%%j" >> "%~dp0TMP\pfs-hddosd.txt"
	cd "%%j"
	
	REM HDDOSD SUBDIR FILES (__sysconf\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\files.xxx)
	
	for %%9 in (*) do (echo put "%%9") >> "%~dp0TMP\pfs-hddosd.txt"

	REM EXIT SUBDIR

	echo lcd .. >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd .. >> "%~dp0TMP\pfs-hddosd.txt"
	cd ..

	)
	
	echo lcd .. >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd .. >> "%~dp0TMP\pfs-hddosd.txt"
 	cd ..
	
	)
	
	echo lcd .. >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd .. >> "%~dp0TMP\pfs-hddosd.txt"
 	cd ..
	
	)
	
	echo lcd .. >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd .. >> "%~dp0TMP\pfs-hddosd.txt"
 	cd ..

    )
	
	echo lcd .. >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd .. >> "%~dp0TMP\pfs-hddosd.txt"
 	cd ..
	
	)
	
	echo lcd .. >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd .. >> "%~dp0TMP\pfs-hddosd.txt"
 	cd ..
	
	)
	
	echo lcd .. >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd .. >> "%~dp0TMP\pfs-hddosd.txt"
 	cd ..
	
	)
	
	echo lcd .. >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd .. >> "%~dp0TMP\pfs-hddosd.txt"
 	cd ..
	
	)
	
	echo lcd .. >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd .. >> "%~dp0TMP\pfs-hddosd.txt"
 	cd ..
	
    )
	
	REM UNMOUNT __sysconf
	echo umount >> "%~dp0TMP\pfs-hddosd.txt"
	echo exit >> "%~dp0TMP\pfs-hddosd.txt"
	type "%~dp0TMP\pfs-hddosd.txt" | "%~dp0BAT\pfsshell" >nul 2>&1
	del "%~dp0TMP\pfs-hddosd.txt" >nul 2>&1
	del "%~dp0TMP\pfs-log.txt" "%~dp0TMP\pfs-tmp.log" >nul 2>&1
	echo         Partition __sysconf Completed...	
	cd "%~dp0"
    )


REM __SYSTEM 

	IF /I EXIST "%~dp0HDD-OSD\__system\*" (
	cd "%~dp0"HDD-OSD\__system"

	REM MOUNT __SYSTEM

	echo device !@hdl_path! > "%~dp0TMP\pfs-hddosd.txt"
	echo mount __system >> "%~dp0TMP\pfs-hddosd.txt"
	
	echo         Installing Que
    for %%0 in (*) do (echo put "%%0") >> "%~dp0TMP\pfs-hddosd.txt"

	REM HDDOSD 1 DIR (__system\SUBDIR)

	for /D %%a in (*) do (
	echo mkdir "%%a" >> "%~dp0TMP\pfs-hddosd.txt"
	echo lcd "%%a" >> "%~dp0TMP\pfs-hddosd.txt"
 	echo cd "%%a" >> "%~dp0TMP\pfs-hddosd.txt"
 	cd "%%a"

	REM HDDOSD FILES (__system\SUBDIR\files.xxx)

 	for %%1 in (*) do (echo put "%%1") >> "%~dp0TMP\pfs-hddosd.txt"

	REM HDDOSD 2 SUBDIR (__system\SUBDIR\SUBDIR)

	for /D %%b in (*) do (
	echo mkdir "%%b" >> "%~dp0TMP\pfs-hddosd.txt"
	echo lcd "%%b" >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd "%%b" >> "%~dp0TMP\pfs-hddosd.txt"
	cd "%%b"

	REM HDDOSD SUBDIR FILES (__system\SUBDIR\SUBDIR\files.xxx)

	for %%2 in (*) do (echo put "%%2") >> "%~dp0TMP\pfs-hddosd.txt"
	
	REM HDDOSD 3 SUBDIR (__system\SUBDIR\SUBDIR\SUBDIR)

	for /D %%c in (*) do (
	echo mkdir "%%c" >> "%~dp0TMP\pfs-hddosd.txt"
	echo lcd "%%c" >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd "%%c" >> "%~dp0TMP\pfs-hddosd.txt"
	cd "%%c"
	
	REM HDDOSD SUBDIR FILES (__system\SUBDIR\SUBDIR\SUBDIR\files.xxx)
	
	for %%3 in (*) do (echo put "%%3") >> "%~dp0TMP\pfs-hddosd.txt"
	
    REM HDDOSD 4 SUBDIR (__system\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR)

	for /D %%e in (*) do (
	echo mkdir "%%e" >> "%~dp0TMP\pfs-hddosd.txt"
	echo lcd "%%e" >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd "%%e" >> "%~dp0TMP\pfs-hddosd.txt"
	cd "%%e"
	
	REM HDDOSD SUBDIR FILES (__system\SUBDIR\SUBDIR\SUBDIR\SUBDIR\files.xxx)
	
	for %%4 in (*) do (echo put "%%4") >> "%~dp0TMP\pfs-hddosd.txt"
	
	REM HDDOSD 5 SUBDIR (__system\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\)

	for /D %%f in (*) do (
	echo mkdir "%%f" >> "%~dp0TMP\pfs-hddosd.txt"
	echo lcd "%%f" >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd "%%f" >> "%~dp0TMP\pfs-hddosd.txt"
	cd "%%f"
	
	REM HDDOSD SUBDIR FILES (__system\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\files.xxx)
	
	for %%5 in (*) do (echo put "%%5") >> "%~dp0TMP\pfs-hddosd.txt"
	
	REM HDDOSD 6 SUBDIR (__system\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\)

	for /D %%g in (*) do (
	echo mkdir "%%g" >> "%~dp0TMP\pfs-hddosd.txt"
	echo lcd "%%g" >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd "%%g" >> "%~dp0TMP\pfs-hddosd.txt"
	cd "%%g"
	
	REM HDDOSD SUBDIR FILES (__system\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\files.xxx)
	
	for %%6 in (*) do (echo put "%%6") >> "%~dp0TMP\pfs-hddosd.txt"
	
	REM HDDOSD 7 SUBDIR (__system\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\)

	for /D %%h in (*) do (
	echo mkdir "%%h" >> "%~dp0TMP\pfs-hddosd.txt"
	echo lcd "%%h" >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd "%%h" >> "%~dp0TMP\pfs-hddosd.txt"
	cd "%%h"
	
	REM HDDOSD SUBDIR FILES (__system\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\files.xxx)
	
	for %%7 in (*) do (echo put "%%7") >> "%~dp0TMP\pfs-hddosd.txt"
	
	REM HDDOSD 8 SUBDIR (__system\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\)

	for /D %%i in (*) do (
	echo mkdir "%%i" >> "%~dp0TMP\pfs-hddosd.txt"
	echo lcd "%%i" >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd "%%i" >> "%~dp0TMP\pfs-hddosd.txt"
	cd "%%i"
	
	REM HDDOSD SUBDIR FILES (__system\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\files.xxx)
	
	for %%8 in (*) do (echo put "%%8") >> "%~dp0TMP\pfs-hddosd.txt"
	
	REM HDDOSD 9 SUBDIR (__system\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\)

	for /D %%j in (*) do (
	echo mkdir "%%j" >> "%~dp0TMP\pfs-hddosd.txt"
	echo lcd "%%j" >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd "%%j" >> "%~dp0TMP\pfs-hddosd.txt"
	cd "%%j"
	
	REM HDDOSD SUBDIR FILES (__system\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\SUBDIR\files.xxx)
	
	for %%9 in (*) do (echo put "%%9") >> "%~dp0TMP\pfs-hddosd.txt"

	REM EXIT SUBDIR

    echo lcd .. >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd .. >> "%~dp0TMP\pfs-hddosd.txt"
	cd ..

	)
	
	echo lcd .. >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd .. >> "%~dp0TMP\pfs-hddosd.txt"
 	cd ..
	
	)
	
	echo lcd .. >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd .. >> "%~dp0TMP\pfs-hddosd.txt"
 	cd ..
	
	)
	
	echo lcd .. >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd .. >> "%~dp0TMP\pfs-hddosd.txt"
 	cd ..

    )
	
	echo lcd .. >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd .. >> "%~dp0TMP\pfs-hddosd.txt"
 	cd ..
	
	)
	
	echo lcd .. >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd .. >> "%~dp0TMP\pfs-hddosd.txt"
 	cd ..
	
	)
	
	echo lcd .. >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd .. >> "%~dp0TMP\pfs-hddosd.txt"
 	cd ..
	
	)
	
	echo lcd .. >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd .. >> "%~dp0TMP\pfs-hddosd.txt"
 	cd ..
	
	)
	
	echo lcd .. >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd .. >> "%~dp0TMP\pfs-hddosd.txt"
 	cd ..

	REM UNMOUNT __system

	)
	echo umount >> "%~dp0TMP\pfs-hddosd.txt"
	echo exit >> "%~dp0TMP\pfs-hddosd.txt"
	type "%~dp0TMP\pfs-hddosd.txt" | "%~dp0BAT\pfsshell" >nul 2>&1
	del "%~dp0TMP\pfs-hddosd.txt" >nul 2>&1
	del "%~dp0TMP\pfs-log.txt" "%~dp0TMP\pfs-tmp.log" >nul 2>&1
	echo         Partition __system Completed...
	cd "%~dp0"
   
REM Copy OPL Files For Launch Games From HDD-OSD
cd "%~dp0HDD-OSD\__common\OPL"
    echo device !@hdl_path! > "%~dp0TMP\pfs-hddosd.txt"
	echo mount __common >> "%~dp0TMP\pfs-hddosd.txt"
	echo mkdir OPL >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd OPL >> "%~dp0TMP\pfs-hddosd.txt"
 	echo put conf_hdd.cfg >> "%~dp0TMP\pfs-hddosd.txt"
    echo umount >> "%~dp0TMP\pfs-hddosd.txt"
	echo exit >> "%~dp0TMP\pfs-hddosd.txt"
	type "%~dp0TMP\pfs-hddosd.txt" | "%~dp0BAT\pfsshell" >nul 2>&1
	cd "%~dp0"

cd "%~dp0"HDD-OSD\"
    echo device !@hdl_path! > "%~dp0TMP\pfs-hddosd.txt"
	echo mount %OPLPART% >> "%~dp0TMP\pfs-hddosd.txt"
 	echo put OPNPS2LD.ELF >> "%~dp0TMP\pfs-hddosd.txt"
    echo umount >> "%~dp0TMP\pfs-hddosd.txt"
	echo exit >> "%~dp0TMP\pfs-hddosd.txt"
	type "%~dp0TMP\pfs-hddosd.txt" | "%~dp0BAT\pfsshell" >nul 2>&1
	cd "%~dp0"
	echo         HDD-OSD Completed...
	)
 ) else ( echo         HDDOSD - Installation Canceled... )

rmdir /Q/S "%~dp0TMP" >nul 2>&1
del info.sys >nul 2>&1

echo\
echo\
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo Installation Completed...
echo\
echo\
"%~dp0BAT\Diagbox" gd 07

pause & (goto HDDOSDMenu)
REM ####################################################################################################################################################
:UnInstallHDDOSD

cd "%~dp0"

IF NOT EXIST HDD-OSD\ MD HDD-OSD

cls
mkdir "%~dp0TMP" >nul 2>&1
"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo Scanning for Playstation 2 HDDs:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD"
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD" | "%~dp0BAT\busybox" cut -c2-6 > "%~dp0TMP\hdl-hdd.txt"
"%~dp0BAT\busybox" sed -i "s/hdd/\\\\.\\\PhysicalDrive/g; s/://g" "%~dp0TMP\hdl-hdd.txt" >nul 2>&1

set /P @hdl_path=<"%~dp0TMP\hdl-hdd.txt"
del "%~dp0TMP\hdl-hdd.txt" >nul 2>&1
IF "!@hdl_path!"=="" ( 
"%~dp0BAT\Diagbox" gd 0c
		echo         Playstation 2 HDD Not Detected
		echo         Drive Must Be Formatted First
		echo\
		echo\
"%~dp0BAT\Diagbox" gd 07
		rmdir /Q/S "%~dp0TMP" >nul 2>&1
		del info.sys >nul 2>&1
        pause & (goto HDDOSDMenu)
	)
"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo Uninstall HDD-OSD:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) Yes
"%~dp0BAT\Diagbox" gd 0c
echo         2) No
"%~dp0BAT\Diagbox" gd 0f
echo\
CHOICE /C 12 /M "Select Option:"

IF ERRORLEVEL 1 set @pfs_uninhddosd=yes
IF ERRORLEVEL 2 set @pfs_uninhddosd=no

"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo Detecting __sysconf Partition:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0f

	echo device !@hdl_path! > "%~dp0TMP\pfs-prt.txt"
	echo ls -l >> "%~dp0TMP\pfs-prt.txt"
	echo exit >> "%~dp0TMP\pfs-prt.txt"
	type "%~dp0TMP\pfs-prt.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-prt.log"
	"%~dp0BAT\busybox" cat "%~dp0TMP\pfs-prt.log" | "%~dp0BAT\busybox" grep "__sysconf" | "%~dp0BAT\busybox" sed "s/.*__sysconf/__sysconf/" | "%~dp0BAT\busybox" tr -d " " | "%~dp0BAT\busybox" head -1 | "%~dp0BAT\busybox" sed -e "s/@/\//g" > "%~dp0TMP\hdd-prt.txt"
	set /P @hdd_avl=<"%~dp0TMP\hdd-prt.txt"
	del "%~dp0TMP\pfs-prt.txt" "%~dp0TMP\pfs-prt.log" >nul 2>&1 "%~dp0TMP\hdd-prt.txt"

	IF "!@hdd_avl!"=="__sysconf/" (
	"%~dp0BAT\Diagbox" gd 0a
		echo         __system - Partition Detected
		) else (
		"%~dp0BAT\Diagbox" gd 0c
		echo         __sysconf - Partition NOT Detected
		echo         Partition Must Be Formatted Or Created
		echo\
		echo\
		rmdir /Q/S "%~dp0TMP" >nul 2>&1
		del info.sys >nul 2>&1	
		pause & (goto HDDOSDMenu)
		)

echo\
echo\
"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo Detecting __system Partition:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0f

	echo device !@hdl_path! > "%~dp0TMP\pfs-prt.txt"
	echo ls -l >> "%~dp0TMP\pfs-prt.txt"
	echo exit >> "%~dp0TMP\pfs-prt.txt"
	type "%~dp0TMP\pfs-prt.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-prt.log"
	"%~dp0BAT\busybox" cat "%~dp0TMP\pfs-prt.log" | "%~dp0BAT\busybox" grep "__system" | "%~dp0BAT\busybox" sed "s/.*__system/__system/" | "%~dp0BAT\busybox" tr -d " " | "%~dp0BAT\busybox" head -1 | "%~dp0BAT\busybox" sed -e "s/@/\//g" > "%~dp0TMP\hdd-prt.txt"
	set /P @hdd_avl=<"%~dp0TMP\hdd-prt.txt"
	del "%~dp0TMP\pfs-prt.txt" "%~dp0TMP\pfs-prt.log" >nul 2>&1 "%~dp0TMP\hdd-prt.txt"

	IF "!@hdd_avl!"=="__system/" (
	"%~dp0BAT\Diagbox" gd 0a
		echo         __system - Partition Detected
		"%~dp0BAT\Diagbox" gd 0c
		) else (
		echo         __system - Partition NOT Detected
		echo         Partition Must Be Formatted Or Created
		echo\
		echo\
		rmdir /Q/S "%~dp0TMP" >nul 2>&1
		del info.sys >nul 2>&1
		pause & (goto HDDOSDMenu)
		)

"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
pause
cls

IF %@pfs_uninhddosd%==yes (

echo\
echo\
echo Uninstall HDD-OSD:
echo ----------------------------------------------------
echo\

REM __sysconf	
    echo        Uninstall HDD-OSD...
  	echo device %@hdl_path% > "%~dp0TMP\pfs-hddosd.txt"
	echo mount __sysconf >> "%~dp0TMP\pfs-hddosd.txt"
	
	REM FOLDER CONF
	echo cd CONF >> "%~dp0TMP\pfs-hddosd.txt"
	echo rm FILETYPE.INI >> "%~dp0TMP\pfs-hddosd.txt"
    echo rm SYSTEM.INI >> "%~dp0TMP\pfs-hddosd.txt"
    echo rm SYSTEM101.INI >> "%~dp0TMP\pfs-hddosd.txt"
    echo rm SYSTEMDUT.INI >> "%~dp0TMP\pfs-hddosd.txt"
    echo rm SYSTEMEUK.INI >> "%~dp0TMP\pfs-hddosd.txt"
    echo rm SYSTEMFCA.INI >> "%~dp0TMP\pfs-hddosd.txt"
    echo rm SYSTEMFRE.INI >> "%~dp0TMP\pfs-hddosd.txt"
    echo rm SYSTEMGER.INI >> "%~dp0TMP\pfs-hddosd.txt"
    echo rm SYSTEMITA.INI >> "%~dp0TMP\pfs-hddosd.txt"
    echo rm SYSTEMPOR.INI >> "%~dp0TMP\pfs-hddosd.txt"
    echo rm SYSTEMSPA.INI >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd .. >> "%~dp0TMP\pfs-hddosd.txt"
	echo rmdir CONF >> "%~dp0TMP\pfs-hddosd.txt"

    REM FOLDER FONT
	echo cd FONT >> "%~dp0TMP\pfs-hddosd.txt"
    echo rm S22I646.GF >> "%~dp0TMP\pfs-hddosd.txt"
    echo rm S22J201.GF >> "%~dp0TMP\pfs-hddosd.txt"
    echo rm S22J213.GF >> "%~dp0TMP\pfs-hddosd.txt"
    echo rm S22ULST.GF >> "%~dp0TMP\pfs-hddosd.txt"
    echo rm S26I646.GF >> "%~dp0TMP\pfs-hddosd.txt"
    echo rm S26J201.GF >> "%~dp0TMP\pfs-hddosd.txt"
    echo rm S26J213.GF >> "%~dp0TMP\pfs-hddosd.txt"
    echo rm S26ULST.GF >> "%~dp0TMP\pfs-hddosd.txt"
    echo rm SCE20I22.GF >> "%~dp0TMP\pfs-hddosd.txt"
    echo rm SCE24I26.GF >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd .. >> "%~dp0TMP\pfs-hddosd.txt"
	echo rmdir FONT >> "%~dp0TMP\pfs-hddosd.txt"
	
	REM FOLDER ICON
	echo cd ICON >> "%~dp0TMP\pfs-hddosd.txt"
	echo rm ICON.SYS >> "%~dp0TMP\pfs-hddosd.txt"
    echo rm OTHERS.ICO >> "%~dp0TMP\pfs-hddosd.txt"
	
	REM FOLDER AUDIO
	echo cd ICON >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd AUDIO >> "%~dp0TMP\pfs-hddosd.txt"
    echo rm AUDIO.ICO >> "%~dp0TMP\pfs-hddosd.txt"
	echo rm ICON.SYS >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd .. >> "%~dp0TMP\pfs-hddosd.txt"
	echo rmdir AUDIO >> "%~dp0TMP\pfs-hddosd.txt"
	
    REM FOLDER HTML
	echo cd ICON >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd HTML >> "%~dp0TMP\pfs-hddosd.txt"
    echo rm HTML.ICO >> "%~dp0TMP\pfs-hddosd.txt"
	echo rm ICON.SYS >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd .. >> "%~dp0TMP\pfs-hddosd.txt"
	echo rmdir HTML >> "%~dp0TMP\pfs-hddosd.txt"
	
	REM FOLDER IMAGE
	echo cd ICON >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd IMAGE >> "%~dp0TMP\pfs-hddosd.txt"
	echo rm ICON.SYS >> "%~dp0TMP\pfs-hddosd.txt"
	echo rm IMAGE.ICO >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd .. >> "%~dp0TMP\pfs-hddosd.txt"
	echo rmdir IMAGE >> "%~dp0TMP\pfs-hddosd.txt"
	
	REM FOLDER TEXT
	echo cd ICON >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd TEXT >> "%~dp0TMP\pfs-hddosd.txt"
	echo rm ICON.SYS >> "%~dp0TMP\pfs-hddosd.txt"
	echo rm TEXT.ICO >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd .. >> "%~dp0TMP\pfs-hddosd.txt"
	echo rmdir TEXT >> "%~dp0TMP\pfs-hddosd.txt"
	
	REM FOLDER VIDEO
	echo cd ICON >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd VIDEO >> "%~dp0TMP\pfs-hddosd.txt"
	echo rm ICON.SYS >> "%~dp0TMP\pfs-hddosd.txt"
	echo rm VIDEO.ICO >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd .. >> "%~dp0TMP\pfs-hddosd.txt"
	echo rmdir VIDEO >> "%~dp0TMP\pfs-hddosd.txt"
 
    echo cd .. >> "%~dp0TMP\pfs-hddosd.txt"	
	echo rmdir ICON >> "%~dp0TMP\pfs-hddosd.txt"
	echo umount >> "%~dp0TMP\pfs-hddosd.txt"
	echo exit >> "%~dp0TMP\pfs-hddosd.txt"
	type "%~dp0TMP\pfs-hddosd.txt" | "%~dp0BAT\pfsshell" >nul 2>&1
	cd "%~dp0"

REM __system 
  	echo device %@hdl_path% > "%~dp0TMP\pfs-hddosd.txt"
	echo mount __system  >> "%~dp0TMP\pfs-hddosd.txt"
	
REM FOLDER OSD100
	echo cd osd100 >> "%~dp0TMP\pfs-hddosd.txt"
	echo rm FNTOSD >> "%~dp0TMP\pfs-hddosd.txt"
	echo rm hosdsys.elf >> "%~dp0TMP\pfs-hddosd.txt"
	echo rm ICOIMAGE >> "%~dp0TMP\pfs-hddosd.txt"
	echo rm JISUCS >> "%~dp0TMP\pfs-hddosd.txt"
	echo rm SKBIMAGE >> "%~dp0TMP\pfs-hddosd.txt"
	echo rm SNDIMAGE >> "%~dp0TMP\pfs-hddosd.txt"
	echo rm TEXIMAGE >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd .. >> "%~dp0TMP\pfs-hddosd.txt"
	echo rmdir osd100 >> "%~dp0TMP\pfs-hddosd.txt"

REM FOLDER FSCK100	
	echo cd fsck100 >> "%~dp0TMP\pfs-hddosd.txt"
	echo rm FSCK_A.XLF >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd files >> "%~dp0TMP\pfs-hddosd.txt"
	echo rm FILES_A.PAK >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd .. >> "%~dp0TMP\pfs-hddosd.txt"
	echo rmdir files >> "%~dp0TMP\pfs-hddosd.txt"
	echo cd .. >> "%~dp0TMP\pfs-hddosd.txt"
	echo rmdir fsck100 >> "%~dp0TMP\pfs-hddosd.txt"
	
	echo umount >> "%~dp0TMP\pfs-hddosd.txt"
	echo exit >> "%~dp0TMP\pfs-hddosd.txt"
	type "%~dp0TMP\pfs-hddosd.txt" | "%~dp0BAT\pfsshell" >nul 2>&1
	echo        Uninstall Completed...	
	cd "%~dp0"
 
REM Delete OPNPS2LD.ELF
    echo device !@hdl_path! > "%~dp0TMP\pfs-hddosd.txt"
	echo mount %OPLPART% >> "%~dp0TMP\pfs-hddosd.txt"
 	echo rm OPNPS2LD.ELF >> "%~dp0TMP\pfs-hddosd.txt"
    echo umount >> "%~dp0TMP\pfs-hddosd.txt"
	echo exit >> "%~dp0TMP\pfs-hddosd.txt"
	type "%~dp0TMP\pfs-hddosd.txt" | "%~dp0BAT\pfsshell" >nul 2>&1
	cd "%~dp0"
	) else ( echo         HDDOSD - Uninstall Canceled... )

rmdir /Q/S "%~dp0TMP" >nul 2>&1
del info.sys >nul 2>&1

echo\
echo\
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo Uninstall Completed...
echo\
echo\
"%~dp0BAT\Diagbox" gd 07

pause & (goto HDDOSDMenu)

REM ####################################################################################################################################################
:InjectOPL-Launcher

cls
mkdir "%~dp0TMP" >nul 2>&1
mkdir "%~dp0CD-DVD" >nul 2>&1
cd /d "%~dp0TMP"

copy "%~dp0BAT\boot.kelf" "%~dp0TMP" >nul 2>&1
copy "%~dp0BAT\hdl_dump.exe" "%~dp0TMP" >nul 2>&1

cls
mkdir "%~dp0TMP" >nul 2>&1
"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo Scanning for Playstation 2 HDDs:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD"
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD" | "%~dp0BAT\busybox" cut -c2-6 > "%~dp0TMP\hdl-hdd.txt"

set /P @hdl_path=<"%~dp0TMP\hdl-hdd.txt"
del "%~dp0TMP\hdl-hdd.txt" >nul 2>&1
IF "!@hdl_path!"=="" (
"%~dp0BAT\Diagbox" gd 0c
		echo         Playstation 2 HDD Not Detected
		echo         Drive Must Be Formatted First
		echo\
		echo\
"%~dp0BAT\Diagbox" gd 07
		rmdir /Q/S "%~dp0TMP" >nul 2>&1
		del info.sys >nul 2>&1
        pause & (goto HDDOSDPartManagement)
	)

echo\
echo\
"%~dp0BAT\Diagbox" gd 0f
echo Inject OPL-Launcher (boot.kelf) ?
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) %YES% (For every installed game) 
"%~dp0BAT\Diagbox" gd 0c
echo         2) %NO%
"%~dp0BAT\Diagbox" gd 0e
echo         3) Yes (Manually)
"%~dp0BAT\Diagbox" gd 07
echo\
CHOICE /C 123 /M "Select Option:"

IF ERRORLEVEL 3 set @pfs_ppinjectkelf=yes
IF ERRORLEVEL 3 (goto InjectOPL-Launchermanually)
IF ERRORLEVEL 2 (goto HDDOSDPartManagement)

cls
"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo Partition List:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03

    "%~dp0BAT\hdl_dump" toc %@hdl_path% > "%~dp0TMP\HDL_PART_GAMES.log"
	"%~dp0BAT\busybox" cat "%~dp0TMP\HDL_PART_GAMES.log" | "%~dp0BAT\busybox" grep -e "0x1337" > "%~dp0TMP\HDL_PART_GAMES.txt"
	"%~dp0BAT\busybox" sed -i "s/\s*$//" "%~dp0TMP\HDL_PART_GAMES.txt"
	
    "%~dp0BAT\busybox" cat "%~dp0TMP\HDL_PART_GAMES.log" | "%~dp0BAT\busybox" grep -e "0x1337" | "%~dp0BAT\busybox" cut -c33-42 | "%~dp0BAT\busybox" sed -e "s/.\{8\}/&./" > "%~dp0TMP\HDL_PART_GAMESID.log"
    "%~dp0BAT\busybox" sed -i "s/-/_/g" "%~dp0TMP\HDL_PART_GAMESID.log" 
    "%~dp0BAT\busybox" paste -d " " "%~dp0TMP\HDL_PART_GAMESID.log" "%~dp0TMP\HDL_PART_GAMES.txt" > "%~dp0TMP\HDL_PART_GAMESID.txt"
	
type "%~dp0TMP\HDL_PART_GAMES.txt"

"%~dp0BAT\Diagbox" gd 0e
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03

for /f "tokens=1,6" %%M in (HDL_PART_GAMESID.txt) do (

set "dbtitle="
for /f "tokens=1*" %%A in ( 'findstr %%M "%~dp0BAT\DB\gameidPS2ENG.txt"' ) do (if not defined dbtitle set dbtitle=%%B

"%~dp0BAT\Diagbox" gd 0f
echo\
echo !dbtitle!
echo %%M
"%~dp0BAT\Diagbox" gd 03
hdl_dump modify_header %@hdl_path% "%%N" | findstr "Succesfully failed"
echo\
    )
 )
 
"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo Injection Completed...
echo\
echo\
"%~dp0BAT\Diagbox" gd 07

cd "%~dp0CD-DVD"
move *.bin "%~dp0CD" >nul 2>&1
move *.cue "%~dp0CD" >nul 2>&1
move *.iso "%~dp0DVD" >nul 2>&1

cd "%~dp0"
rmdir /Q/S "%~dp0CD-DVD" >nul 2>&1
rmdir /Q/S "%~dp0TMP" >nul 2>&1

echo.
pause & (goto HDDOSDPartManagement)


:InjectOPL-LauncherManually
IF %@pfs_ppinjectkelf%==yes (
cls
"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo Partition Games List:
"%~dp0BAT\Diagbox" gd 0f
echo ----------------------------------------------------
       "%~dp0BAT\hdl_dump" toc !@hdl_path! | "%~dp0BAT\busybox" grep "0x1337" | "%~dp0BAT\busybox" grep "PP." | "%~dp0BAT\busybox" cut -c30-250 > "%~dp0LOG\PARTITION_GAMES.log"
REM    "%~dp0BAT\hdl_dump" toc !@hdl_path! | "%~dp0BAT\busybox" grep "PP." | "%~dp0BAT\busybox" cut -c30-250 > "%~dp0LOG\PARTITION_GAMES.log"
	type "%~dp0LOG\PARTITION_GAMES.log"
echo ----------------------------------------------------	
"%~dp0BAT\Diagbox" gd 06

echo Copy Name of the partition. Example: PP.SLES-50507..HALF_LIFE
echo.
"%~dp0BAT\Diagbox" gd 0f

set /p "ppinjectkelf=Enter the partition name you want to Launch in HDD-OSD:"
IF "!ppinjectkelf!"=="" (goto HDDOSDPartManagement)

)

IF %@pfs_ppinjectkelf%==yes (
cls
echo\
echo\
echo Inject boot.kelf %ppinjectkelf% Partition:
echo ----------------------------------------------------
echo\

    echo        Inject boot.kelf in partitions...
	echo.
	"%~dp0BAT\hdl_dump" modify_header !@hdl_path! "%ppinjectkelf%" | findstr "Succesfully Failed"
	echo.
	echo        Partition %ppinjectkelf% KELF Injected...
	) else ( echo          Canceled... )	

rmdir /Q/S "%~dp0TMP" >nul 2>&1
del info.sys >nul 2>&1
echo\
echo\
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo Injection Completed...
echo\
echo\
"%~dp0BAT\Diagbox" gd 07

cd "%~dp0CD-DVD"
move *.bin "%~dp0CD" >nul 2>&1
move *.cue "%~dp0CD" >nul 2>&1
move *.iso "%~dp0DVD" >nul 2>&1

cd "%~dp0"
rmdir /Q/S "%~dp0CD-DVD" >nul 2>&1
rmdir /Q/S "%~dp0TMP" >nul 2>&1

echo.
pause & (goto HDDOSDPartManagement)

REM ##################################################################################################################################################
:pphide

cls
mkdir "%~dp0TMP" >nul 2>&1
"%~dp0BAT\Diagbox" gd 0e

echo\
echo\
echo Scanning for Playstation 2 HDDs:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD"
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD" | "%~dp0BAT\busybox" cut -c2-6 > "%~dp0TMP\hdl-hdd.txt"

set /P @hdl_path=<"%~dp0TMP\hdl-hdd.txt"
REM del "%~dp0TMP\hdl-hdd.txt" >nul 2>&1
IF "!@hdl_path!"=="" ( 
"%~dp0BAT\Diagbox" gd 0c
		echo         Playstation 2 HDD Not Detected
		echo         Drive Must Be Formatted First
		echo\
		echo\
"%~dp0BAT\Diagbox" gd 07
		rmdir /Q/S "%~dp0TMP" >nul 2>&1
		del info.sys >nul 2>&1		
        pause & (goto HDDOSDPartManagement)
	)

"%~dp0BAT\Diagbox" gd 0f
echo\
echo\

echo Scan for non-hidden partitions:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) %YES%
"%~dp0BAT\Diagbox" gd 0c
echo         2) %NO%
"%~dp0BAT\Diagbox" gd 07
echo\
CHOICE /C 12 /M "Select Option:"

IF ERRORLEVEL 1 set @pfs_pphide=yes
IF ERRORLEVEL 2 set @pfs_pphide=no

IF %@pfs_pphide%==yes (
echo\
echo\
echo Partition Games List:
echo ----------------------------------------------------
    "%~dp0BAT\hdl_dump" toc %@hdl_path% | "%~dp0BAT\busybox" grep "PP." | "%~dp0BAT\busybox" cut -c30-250 > "%~dp0LOG\PARTITION_GAMES.log"
	type "%~dp0LOG\PARTITION_GAMES.log"
echo ----------------------------------------------------	
"%~dp0BAT\Diagbox" gd 06
echo Copy Name of the partition. Example: PP.SLES-50507..HALF_LIFE
echo.
"%~dp0BAT\Diagbox" gd 07

set /p "pphide=Enter the partition name you want to hide:"
IF "!pphide!"=="" (goto HDDOSDPartManagement)
  
 )
 
IF %@pfs_pphide%==yes (
cls
echo\
echo\
echo Hide %pphide% Partition:
echo ----------------------------------------------------
echo\

    echo        Hide partitions...
	"%~dp0BAT\hdl_dump" modify %@hdl_path% "%pphide%" -hide
	echo        Partition %pphide% Hide...	
	) else ( cls & echo          Canceled... )

rmdir /Q/S "%~dp0TMP" >nul 2>&1
del info.sys >nul 2>&1

echo\
echo\
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo Partition Completed...
echo\
echo\
"%~dp0BAT\Diagbox" gd 07

pause & (goto HDDOSDPartManagement)

REM ##############################################################################################################################################
:ppunhide

cls
mkdir "%~dp0TMP" >nul 2>&1
mkdir "%~dp0LOG" >nul 2>&1
"%~dp0BAT\Diagbox" gd 0e

echo\
echo\
echo Scanning for Playstation 2 HDDs:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD"
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD" | "%~dp0BAT\busybox" cut -c2-6 > "%~dp0TMP\hdl-hdd.txt"

set /P @hdl_path=<"%~dp0TMP\hdl-hdd.txt"
REM del "%~dp0TMP\hdl-hdd.txt" >nul 2>&1
IF "!@hdl_path!"=="" ( 
"%~dp0BAT\Diagbox" gd 0c
		echo         Playstation 2 HDD Not Detected
		echo         Drive Must Be Formatted First
		echo\
		echo\
"%~dp0BAT\Diagbox" gd 07
		rmdir /Q/S "%~dp0TMP" >nul 2>&1
		del info.sys >nul 2>&1
        pause & (goto HDDOSDPartManagement)
	)
	
"%~dp0BAT\Diagbox" gd 0f
echo\
echo\

echo Scan already hidden partitions:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) %YES%
"%~dp0BAT\Diagbox" gd 0c
echo         2) %NO%
"%~dp0BAT\Diagbox" gd 07
echo\
CHOICE /C 12 /M "Select Option:"

IF ERRORLEVEL 1 set @pfs_ppunhide=yes
IF ERRORLEVEL 2 set @pfs_ppunhide=no

IF %@pfs_ppunhide%==yes (
echo\
echo\
echo Partition game list hidden:
echo ----------------------------------------------------
    "%~dp0BAT\hdl_dump" toc %@hdl_path% | "%~dp0BAT\busybox" grep "0x1337" | "%~dp0BAT\busybox" cut -c30-250 | "%~dp0BAT\busybox" sed "/PP./d" > "%~dp0LOG\PARTITION_GAMES_HIDDEN.txt"
	type "%~dp0LOG\PARTITION_GAMES_HIDDEN.txt"
echo ----------------------------------------------------	
"%~dp0BAT\Diagbox" gd 06
echo Copy Name of the partition. Example: __.SLES-50507..HALF_LIFE
echo.

"%~dp0BAT\Diagbox" gd 07
set /p "ppunhide=Enter the partition name you want to Unhide:"
IF "!ppunhide!"=="" (goto HDDOSDPartManagement)

)

IF %@pfs_ppunhide%==yes (
cls
echo\
echo\
echo Unhide %ppunhide% Partition:
echo ----------------------------------------------------
echo\

    echo        Unhide partitions...
	"%~dp0BAT\hdl_dump" modify %@hdl_path% "%ppunhide%" -unhide
	echo        Partition %ppunhide% Unhide...	
	) else ( cls & echo          Canceled... )	

rmdir /Q/S "%~dp0TMP" >nul 2>&1
del info.sys >nul 2>&1

echo\
echo\
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo Partition Unhide Completed...
echo\
echo\
"%~dp0BAT\Diagbox" gd 07

pause & (goto HDDOSDPartManagement)

REM ####################################################################################################################################################
:DownloadARTPS2

mkdir "%~dp0ART" >nul 2>&1
mkdir "%~dp0TMP" >nul 2>&1

cd "%~dp0" & for %%F in ( "%~dp0ART\*" ) do if %%~zF==0 del "%%F"

cls
cd /d "%~dp0TMP"

"%~dp0BAT\Diagbox" gd 0e

echo\
echo\
echo Scanning for Playstation 2 HDDs:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD"
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD" | "%~dp0BAT\busybox" cut -c2-6 > "%~dp0TMP\hdl-hdd.txt"

set /P @hdl_path=<"%~dp0TMP\hdl-hdd.txt"
::del "%~dp0TMP\hdl-hdd.txt" >nul 2>&1
IF "!@hdl_path!"=="" ( 
"%~dp0BAT\Diagbox" gd 0c
		echo         Playstation 2 HDD Not Detected
		echo         Drive Must Be Formatted First
		echo\
		echo\
"%~dp0BAT\Diagbox" gd 07
		rmdir /Q/S "%~dp0TMP" >nul 2>&1
		del info.sys >nul 2>&1 
		pause & (goto DownloadARTMenu)
	)

"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
"%~dp0BAT\Diagbox" gd 0f
echo Download ART For All Game installed ?
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) %YES%
"%~dp0BAT\Diagbox" gd 0c
echo         2) %NO%
"%~dp0BAT\Diagbox" gd 07
echo\
CHOICE /C 12 /M "Select Option:"

IF ERRORLEVEL 2 (goto DownloadARTMenu)

if errorlevel 1 (
    echo.
	echo Checking internet connection...
	"%~dp0BAT\wget" -q --show-progress "https://ia601507.us.archive.org/view_archive.php?archive=/28/items/OPLM_ART_2022_01/OPLM_ART_2022_01.zip&file=PS1%%2FCPCS_007.01%%2FCPCS_007.01_COV.jpg" -O "%~dp0TMP\CPCS_007.01_COV.jpg" >nul 2>&1
	for %%F in ( "CPCS_007.01_COV.jpg" ) do if %%~zF==0 del "%%F"
	
if not exist CPCS_007.01_COV.jpg (
"%~dp0BAT\Diagbox" gd 0c
    echo.
	echo Unable to connect to internet Or Website
	echo.
"%~dp0BAT\Diagbox" gd 0f
	) else (

"%~dp0BAT\Diagbox" gd 0e
cls
echo\
echo\
echo List Games
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
setlocal DisableDelayedExpansion

"%~dp0BAT\hdl_dump" hdl_toc %@hdl_path% > PARTITION_GAMES_NEW.txt

"%~dp0BAT\busybox" sed -i "1d" PARTITION_GAMES_NEW.txt 
"%~dp0BAT\busybox" sed -i -e "$ d" PARTITION_GAMES_NEW.txt
"%~dp0BAT\busybox" cut -c35-500 PARTITION_GAMES_NEW.txt > PARTITION_GAMES_NEW2.txt

type PARTITION_GAMES_NEW2.txt
"%~dp0BAT\Diagbox" gd 0e
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03

echo Download...

For /f "tokens=5*" %%A in (PARTITION_GAMES_NEW.txt) do (
"%~dp0BAT\Diagbox" gd 0f
echo\
echo %%B
echo %%A
"%~dp0BAT\Diagbox" gd 03
REM Cover
if not exist "%~dp0ART\%%A_COV.jpg" "%~dp0BAT\wget" -q --show-progress "https://ia601507.us.archive.org/view_archive.php?archive=/28/items/OPLM_ART_2022_01/OPLM_ART_2022_01.zip&file=PS2%%2F%%A%%2F%%A_COV.jpg" -O "%~dp0ART\%%A_COV.jpg"

cd /d "%~dp0ART" & for %%F in (%%A_COV.jpg) do if %%~zF==0 del "%%F"
if exist %%A_COV.jpg echo Found >nul
"%~dp0BAT\Diagbox" gd 0c
if not exist %%A_COV.jpg echo %%A_COV.jpg   Not found in database 
"%~dp0BAT\Diagbox" gd 03

REM Back Cover
if not exist "%~dp0ART\%%A_COV2.jpg" "%~dp0BAT\wget" -q --show-progress "https://ia601507.us.archive.org/view_archive.php?archive=/28/items/OPLM_ART_2022_01/OPLM_ART_2022_01.zip&file=PS2%%2F%%A%%2F%%A_COV2.jpg" -O "%~dp0ART\%%A_COV2.jpg"

cd /d "%~dp0ART" & for %%F in (%%A_COV2.jpg) do if %%~zF==0 del "%%F"
if exist %%A_COV2.jpg echo Found >nul
"%~dp0BAT\Diagbox" gd 0c
if not exist %%A_COV.jpg echo %%A_COV2.jpg  Not found in database 
"%~dp0BAT\Diagbox" gd 03

REM ICO
if not exist "%~dp0ART\%%A_ICO.png" "%~dp0BAT\wget" -q --show-progress "https://ia601507.us.archive.org/view_archive.php?archive=/28/items/OPLM_ART_2022_01/OPLM_ART_2022_01.zip&file=PS2%%2F%%A%%2F%%A_ICO.png" -O "%~dp0ART\%%A_ICO.png"

cd /d "%~dp0ART" & for %%F in (%%A_ICO.png) do if %%~zF==0 del "%%F"
if exist %%A_ICO.png echo Found >nul
"%~dp0BAT\Diagbox" gd 0c
if not exist %%A_ICO.png echo %%A_ICO.png   Not found in database 
"%~dp0BAT\Diagbox" gd 03

REM LAB
if not exist "%~dp0ART\%%A_LAB.jpg" "%~dp0BAT\wget" -q --show-progress "https://ia601507.us.archive.org/view_archive.php?archive=/28/items/OPLM_ART_2022_01/OPLM_ART_2022_01.zip&file=PS2%%2F%%A%%2F%%A_LAB.jpg" -O "%~dp0ART\%%A_LAB.jpg"

cd /d "%~dp0ART" & for %%F in (%%A_LAB.jpg) do if %%~zF==0 del "%%F"
if exist %%A_LAB.jpg echo Found >nul
"%~dp0BAT\Diagbox" gd 0c
if not exist %%A_COV.jpg echo %%A_LAB.jpg   Not found in database 
"%~dp0BAT\Diagbox" gd 03

REM LOGO
if not exist "%~dp0ART\%%A_LGO.png" "%~dp0BAT\wget" -q --show-progress "https://ia601507.us.archive.org/view_archive.php?archive=/28/items/OPLM_ART_2022_01/OPLM_ART_2022_01.zip&file=PS2%%2F%%A%%2F%%A_LGO.png" -O "%~dp0ART\%%A_LGO.png"

cd /d "%~dp0ART" & for %%F in (%%A_LGO.png) do if %%~zF==0 del "%%F"
if exist %%A_LGO.png echo Found >nul
"%~dp0BAT\Diagbox" gd 0c
if not exist %%A_LGO.png echo %%A_LGO.png   Not found in database 
"%~dp0BAT\Diagbox" gd 03

REM Background
if not exist "%~dp0ART\%%A_BG.jpg" "%~dp0BAT\wget" -q --show-progress "https://ia601507.us.archive.org/view_archive.php?archive=/28/items/OPLM_ART_2022_01/OPLM_ART_2022_01.zip&file=PS2%%2F%%A%%2F%%A_BG_00.jpg" -O "%~dp0ART\%%A_BG.jpg"

cd /d "%~dp0ART" & for %%F in (%%A_BG.jpg) do if %%~zF==0 del "%%F"
if exist %%A_BG.jpg echo Found >nul
"%~dp0BAT\Diagbox" gd 0c
if not exist %%A_BG.jpg echo %%A_BG.jpg    Not found in database 
"%~dp0BAT\Diagbox" gd 03

REM Screenshot 0
if not exist "%~dp0ART\%%A_SCR.jpg" "%~dp0BAT\wget" -q --show-progress "https://ia601507.us.archive.org/view_archive.php?archive=/28/items/OPLM_ART_2022_01/OPLM_ART_2022_01.zip&file=PS2%%2F%%A%%2F%%A_SCR_00.jpg" -O "%~dp0ART\%%A_SCR.jpg"

cd /d "%~dp0ART" & for %%F in (%%A_SCR.jpg) do if %%~zF==0 del "%%F"
if exist %%A_SCR.jpg echo Found >nul
"%~dp0BAT\Diagbox" gd 0c
if not exist %%A_SCR.jpg echo %%A_SCR.jpg   Not found in database 
"%~dp0BAT\Diagbox" gd 03


REM Screenshot 1
if not exist "%~dp0ART\%%A_SCR2.jpg" "%~dp0BAT\wget" -q --show-progress "https://ia601507.us.archive.org/view_archive.php?archive=/28/items/OPLM_ART_2022_01/OPLM_ART_2022_01.zip&file=PS2%%2F%%A%%2F%%A_SCR_01.jpg" -O "%~dp0ART\%%A_SCR2.jpg"

cd /d "%~dp0ART" & for %%F in (%%A_SCR2.jpg) do if %%~zF==0 del "%%F"
if exist %%A_SCR2.jpg echo Found >nul
"%~dp0BAT\Diagbox" gd 0c
if not exist %%A_SCR2.jpg echo %%A_SCR2.jpg  Not found in database 
"%~dp0BAT\Diagbox" gd 03

    )

echo\
"%~dp0BAT\Diagbox" gd 0f
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo Download completed...
echo\
echo\
"%~dp0BAT\Diagbox" gd 07

 )
)

endlocal
rmdir /Q/S "%~dp0TMP" >nul 2>&1
echo.

pause & (goto DownloadARTMenu) 

REM ############################################################
:DownloadARTPS1

mkdir "%~dp0ART" >nul 2>&1
mkdir "%~dp0TMP" >nul 2>&1

cd "%~dp0" & for %%F in ( "%~dp0ART\*" ) do if %%~zF==0 del "%%F"

cls
cd /d "%~dp0TMP"

"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
"%~dp0BAT\Diagbox" gd 0f
echo Download ART For .VCD In the POPS folder ?
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) %YES%
"%~dp0BAT\Diagbox" gd 0c
echo         2) %NO%
"%~dp0BAT\Diagbox" gd 07
echo\
CHOICE /C 12 /M "Select Option:"

IF ERRORLEVEL 2 (goto DownloadARTMenu)

if errorlevel 1 (
    echo.
	echo Checking internet connection...
	"%~dp0BAT\wget" -q --show-progress "https://ia601507.us.archive.org/view_archive.php?archive=/28/items/OPLM_ART_2022_01/OPLM_ART_2022_01.zip&file=PS1%%2FCPCS_007.01%%2FCPCS_007.01_COV.jpg" -O "%~dp0TMP\CPCS_007.01_COV.jpg" >nul 2>&1
	for %%F in ( "CPCS_007.01_COV.jpg" ) do if %%~zF==0 del "%%F"
	
if not exist CPCS_007.01_COV.jpg (
"%~dp0BAT\Diagbox" gd 0c
    echo.
	echo Unable to connect to internet Or Website
	echo.
"%~dp0BAT\Diagbox" gd 0f
	) else (
	
"%~dp0BAT\Diagbox" gd 0e
cls
echo\
echo\
echo List Games
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03

if not exist "%~dp0POPS\*.VCD" (
cls
"%~dp0BAT\Diagbox" gd 06
echo.
echo .VCD NOT DETECTED: Please drop .VCD IN POPS FOLDER.
echo.
"%~dp0BAT\Diagbox" gd 0f

 ) else (

REM Special Thanks To Matias Israelson (AKA:El_isra) for POPS-VCD-ID-Extractor
For %%P in ( "%~dp0POPS\*.VCD" ) do ("%~dp0BAT\POPS-VCD-ID-Extractor" "%%P" >> VCDID.txt) >nul 2>&1

cd /d "%~dp0POPS"
dir >> "%~dp0TMP\tmpfiles.txt"
cd /d "%~dp0TMP"

"%~dp0BAT\busybox" grep -i -e ".*\.VCD$" "%~dp0TMP\tmpfiles.txt" | "%~dp0BAT\busybox" cut -c37-999 > "%~dp0TMP\Name.txt"
"%~dp0BAT\busybox" paste -d " " "%~dp0TMP\VCDID.txt" "%~dp0TMP\Name.txt" > "%~dp0TMP\VCDIDNameTMP.txt"
"%~dp0BAT\busybox" sed "s/.\{12\}/& /" "%~dp0TMP\VCDIDNameTMP.txt" > "%~dp0TMP\VCDIDName.txt"

type "%~dp0TMP\VCDIDName.txt"
"%~dp0BAT\Diagbox" gd 0e
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
echo.
echo Download...

copy "%~dp0BAT\DB\gameidPS1.txt" "%~dp0TMP\gameid.txt" >nul 2>&1

For /f %%P in (VCDIDName.txt) do (

	set "dbtitle="
	for /f "tokens=1*" %%A in ( 'findstr %%P "%~dp0TMP\gameid.txt"' ) do (if not defined dbtitle set dbtitle=%%B
)

"%~dp0BAT\Diagbox" gd 0f
echo\
echo !dbtitle!
echo %%P
"%~dp0BAT\Diagbox" gd 03
REM Cover
if not exist "%~dp0ART\%%P_COV.jpg" "%~dp0BAT\wget" -q --show-progress "https://ia601507.us.archive.org/view_archive.php?archive=/28/items/OPLM_ART_2022_01/OPLM_ART_2022_01.zip&file=PS1%%2F%%P%%2F%%P_COV.jpg" -O "%~dp0ART\%%P_COV.jpg"

cd /d "%~dp0ART" & for %%F in (%%P_COV.jpg) do if %%~zF==0 del "%%F"
if exist %%P_COV.jpg echo Found >nul
"%~dp0BAT\Diagbox" gd 0c
if not exist %%P_COV.jpg echo %%P_COV.jpg   Not found in database 
"%~dp0BAT\Diagbox" gd 03

REM Back Cover
if not exist "%~dp0ART\%%P_COV2.jpg" "%~dp0BAT\wget" -q --show-progress "https://ia601507.us.archive.org/view_archive.php?archive=/28/items/OPLM_ART_2022_01/OPLM_ART_2022_01.zip&file=PS1%%2F%%P%%2F%%P_COV2.jpg" -O "%~dp0ART\%%P_COV2.jpg"

cd /d "%~dp0ART" & for %%F in (%%P_COV2.jpg) do if %%~zF==0 del "%%F"
if exist %%P_COV2.jpg echo Found >nul
"%~dp0BAT\Diagbox" gd 0c
if not exist %%P_COV.jpg echo %%P_COV2.jpg  Not found in database 
"%~dp0BAT\Diagbox" gd 03

REM ICO
if not exist "%~dp0ART\%%P_ICO.png" "%~dp0BAT\wget" -q --show-progress "https://ia601507.us.archive.org/view_archive.php?archive=/28/items/OPLM_ART_2022_01/OPLM_ART_2022_01.zip&file=PS1%%2F%%P%%2F%%P_ICO.png" -O "%~dp0ART\%%P_ICO.png"

cd /d "%~dp0ART" & for %%F in (%%P_ICO.png) do if %%~zF==0 del "%%F"
if exist %%P_ICO.png echo Found >nul
"%~dp0BAT\Diagbox" gd 0c
if not exist %%P_ICO.png echo %%P_ICO.png   Not found in database 
"%~dp0BAT\Diagbox" gd 03

REM LAB
if not exist "%~dp0ART\%%P_LAB.jpg" "%~dp0BAT\wget" -q --show-progress "https://ia601507.us.archive.org/view_archive.php?archive=/28/items/OPLM_ART_2022_01/OPLM_ART_2022_01.zip&file=PS1%%2F%%P%%2F%%P_LAB.jpg" -O "%~dp0ART\%%P_LAB.jpg"

cd /d "%~dp0ART" & for %%F in (%%P_LAB.jpg) do if %%~zF==0 del "%%F"
if exist %%P_LAB.jpg echo Found >nul
"%~dp0BAT\Diagbox" gd 0c
if not exist %%P_COV.jpg echo %%P_LAB.jpg   Not found in database 
"%~dp0BAT\Diagbox" gd 03

REM LOGO
if not exist "%~dp0ART\%%P_LGO.png" "%~dp0BAT\wget" -q --show-progress "https://ia601507.us.archive.org/view_archive.php?archive=/28/items/OPLM_ART_2022_01/OPLM_ART_2022_01.zip&file=PS1%%2F%%P%%2F%%P_LGO.png" -O "%~dp0ART\%%P_LGO.png"

cd /d "%~dp0ART" & for %%F in (%%P_LGO.png) do if %%~zF==0 del "%%F"
if exist %%P_LGO.png echo Found >nul
"%~dp0BAT\Diagbox" gd 0c
if not exist %%P_LGO.png echo %%P_LGO.png   Not found in database 
"%~dp0BAT\Diagbox" gd 03

REM Background
if not exist "%~dp0ART\%%P_BG.jpg" "%~dp0BAT\wget" -q --show-progress "https://ia601507.us.archive.org/view_archive.php?archive=/28/items/OPLM_ART_2022_01/OPLM_ART_2022_01.zip&file=PS1%%2F%%P%%2F%%P_BG_00.jpg" -O "%~dp0ART\%%P_BG.jpg"

cd /d "%~dp0ART" & for %%F in (%%P_BG.jpg) do if %%~zF==0 del "%%F"
if exist %%P_BG.jpg echo Found >nul
"%~dp0BAT\Diagbox" gd 0c
if not exist %%P_BG.jpg echo %%P_BG.jpg    Not found in database 
"%~dp0BAT\Diagbox" gd 03

REM Screenshot 0
if not exist "%~dp0ART\%%P_SCR.jpg" "%~dp0BAT\wget" -q --show-progress "https://ia601507.us.archive.org/view_archive.php?archive=/28/items/OPLM_ART_2022_01/OPLM_ART_2022_01.zip&file=PS1%%2F%%P%%2F%%P_SCR_00.jpg" -O "%~dp0ART\%%P_SCR.jpg"

cd /d "%~dp0ART" & for %%F in (%%P_SCR.jpg) do if %%~zF==0 del "%%F"
if exist %%P_SCR.jpg echo Found >nul
"%~dp0BAT\Diagbox" gd 0c
if not exist %%P_SCR.jpg echo %%P_SCR.jpg   Not found in database 
"%~dp0BAT\Diagbox" gd 03


REM Screenshot 1
if not exist "%~dp0ART\%%P_SCR2.jpg" "%~dp0BAT\wget" -q --show-progress "https://ia601507.us.archive.org/view_archive.php?archive=/28/items/OPLM_ART_2022_01/OPLM_ART_2022_01.zip&file=PS1%%2F%%P%%2F%%P_SCR_01.jpg" -O "%~dp0ART\%%P_SCR2.jpg"

cd /d "%~dp0ART" & for %%F in (%%P_SCR2.jpg) do if %%~zF==0 del "%%F"
if exist %%P_SCR2.jpg echo Found >nul
"%~dp0BAT\Diagbox" gd 0c
if not exist %%P_SCR2.jpg echo %%P_SCR2.jpg  Not found in database 
"%~dp0BAT\Diagbox" gd 03

)

echo\
"%~dp0BAT\Diagbox" gd 0f
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo Download completed...
echo\
echo\
"%~dp0BAT\Diagbox" gd 07

  )
 )
)

rmdir /Q/S "%~dp0TMP" >nul 2>&1
echo.

pause & (goto DownloadARTMenu) 

REM ##########################################################################################################################################################################
:DownloadCFG

@echo off
mkdir "%~dp0CFG" >nul 2>&1
mkdir "%~dp0TMP" >nul 2>&1

cls
cd /d "%~dp0TMP"

"%~dp0BAT\Diagbox" gd 0e

echo\
echo\
echo Scanning for Playstation 2 HDDs:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD"
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD" | "%~dp0BAT\busybox" cut -c2-6 > "%~dp0TMP\hdl-hdd.txt"

set /P @hdl_path=<"%~dp0TMP\hdl-hdd.txt"
::del "%~dp0TMP\hdl-hdd.txt" >nul 2>&1
IF "!@hdl_path!"=="" ( 
"%~dp0BAT\Diagbox" gd 0c
		echo         Playstation 2 HDD Not Detected
		echo         Drive Must Be Formatted First
		echo\
		echo\
"%~dp0BAT\Diagbox" gd 07
		rmdir /Q/S "%~dp0TMP" >nul 2>&1
		del info.sys >nul 2>&1 
		pause & (goto DownloadsMenu)
	)

"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
"%~dp0BAT\Diagbox" gd 0f
echo Download CFG for the Game installed ?
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) %YES%
"%~dp0BAT\Diagbox" gd 0c
echo         2) %NO%
"%~dp0BAT\Diagbox" gd 0e
echo         3) %YES% (Manually choose the game)
echo\
"%~dp0BAT\Diagbox" gd 07
echo\
CHOICE /C 123 /M "Select Option:"

IF ERRORLEVEL 3 set @cfg_manually=yesmanually & (goto DownloadCFGManually) 
IF ERRORLEVEL 2 (goto DownloadsMenu)

echo\
echo\
echo Choose your languages of your CFG
echo 1 English 
echo 2 French
echo\
CHOICE /C 12 /M "Select Option:"
IF ERRORLEVEL 1 set language=CFG_en
IF ERRORLEVEL 2 set language=CFG_fr
 

echo\
echo Download the latest CFGs over internet?
echo NOTE: if you choose No, an offline installation will be performed.
echo Or if you choose Yes, and there is a problem connecting to the website, an offline install will be performed.
echo\
choice /c YN 
echo\

if errorlevel 1 set DownloadDB=yes
if errorlevel 2 set DownloadDB=no


    IF "!DownloadDB!"=="yes" (
    echo Checking internet connection...
	Ping www.github.com -n 1 -w 1000 >nul
	
	if errorlevel 1 (
    "%~dp0BAT\Diagbox" gd 0c
    echo.
	echo Unable to connect to internet Or Website
	echo\
	echo You will switch to offline mode
	echo\
	set DownloadDB=no
	"%~dp0BAT\Diagbox" gd 0f
	pause
	)
)

IF "!DownloadDB!"=="no" (

"%~dp0BAT\Diagbox" gd 0e
cls
echo\
echo\
echo List Games
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03

"%~dp0BAT\hdl_dump" hdl_toc %@hdl_path% > PARTITION_GAMES_NEW.txt

"%~dp0BAT\busybox" sed -i "1d" PARTITION_GAMES_NEW.txt 
"%~dp0BAT\busybox" sed -i -e "$ d" PARTITION_GAMES_NEW.txt
"%~dp0BAT\busybox" cut -c35-500 PARTITION_GAMES_NEW.txt > PARTITION_GAMES_NEW2.txt

type PARTITION_GAMES_NEW2.txt
"%~dp0BAT\Diagbox" gd 0e
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0f

    REM Offline Installation
	
    if %language%==CFG_en copy "%~dp0BAT\DB\gameidPS2ENG.txt" "%~dp0TMP\gameid.txt" >nul 2>&1
    if %language%==CFG_fr copy "%~dp0BAT\DB\gameidPS2FRA.txt" "%~dp0TMP\gameid.txt" >nul 2>&1
	
	for /f "tokens=5*" %%i in (PARTITION_GAMES_NEW.txt) do (
	
	set "dbtitle="
	for /f "tokens=1*" %%A in ( 'findstr %%i gameid.txt' ) do (if not defined dbtitle set dbtitle=%%B
    )
	
    echo\
	"%~dp0BAT\Diagbox" gd 0f
    echo !dbtitle!
	echo %%i.cfg
	"%~dp0BAT\Diagbox" gd 03
    "%~dp0BAT\7z.exe" x -bso0 "%~dp0BAT\PS2-OPL-CFG-Database.7z" -o"%~dp0CFG" PS2-OPL-CFG-Database-master\!language!\%%i.cfg -r -y
	"%~dp0BAT\Diagbox" gd 0f
	
	cd /d "%~dp0CFG\PS2-OPL-CFG-Database-master\%language%" & for %%F in ( %%i.cfg ) do if %%~zF==0 del "%%F"
    if not exist %%i.cfg (
    "%~dp0BAT\Diagbox" gd 0c
    echo Not found in database 
    "%~dp0BAT\Diagbox" gd 0f
    cd /d "%~dp0TMP"
    
    ) else (
    "%~dp0BAT\Diagbox" gd 03
    echo Found
    "%~dp0BAT\Diagbox" gd 0f
    cd /d "%~dp0TMP"
	
	   )
	  )
	
	cd /d "%~dp0CFG" & for %%f in (*.cfg) do ("%~dp0BAT\busybox" grep -s -e "\$" -e "Modes=" %%f > "%~dp0CFG\PS2-OPL-CFG-Database-master\%language%\%%fBACKUP")
	cd /d "%~dp0CFG\PS2-OPL-CFG-Database-master\%language%" & for %%f in (*.cfgBACKUP) do ("%~dp0BAT\busybox" sed -i "/Description=\|Title=/d" %%f)
	for %%f in (*.cfg) do ("%~dp0BAT\busybox" cat %%fBACKUP >> %%f) >nul 2>&1
	move "*.cfg" "%~dp0CFG" >nul 2>&1 & cd "%~dp0" & rmdir /Q/S "%~dp0CFG\PS2-OPL-CFG-Database-master\" >nul 2>&1
	"%~dp0BAT\Diagbox" gd 0f
	
	) else (
	
"%~dp0BAT\Diagbox" gd 0e
cls
echo\
echo\
echo List Games
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03

"%~dp0BAT\hdl_dump" hdl_toc %@hdl_path% > PARTITION_GAMES_NEW.txt

"%~dp0BAT\busybox" sed -i "1d" PARTITION_GAMES_NEW.txt 
"%~dp0BAT\busybox" sed -i -e "$ d" PARTITION_GAMES_NEW.txt
"%~dp0BAT\busybox" cut -c35-500 PARTITION_GAMES_NEW.txt > PARTITION_GAMES_NEW2.txt

type PARTITION_GAMES_NEW2.txt
"%~dp0BAT\Diagbox" gd 0e
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0f

    REM Online Installation
	
    if %language%==CFG_en copy "%~dp0BAT\DB\gameidPS2ENG.txt" "%~dp0TMP\gameid.txt" >nul 2>&1
    if %language%==CFG_fr copy "%~dp0BAT\DB\gameidPS2FRA.txt" "%~dp0TMP\gameid.txt" >nul 2>&1
	
	for /f "tokens=5*" %%i in (PARTITION_GAMES_NEW.txt) do (
	
	set "dbtitle="
	for /f "tokens=1*" %%A in ( 'findstr %%i gameid.txt' ) do (if not defined dbtitle set dbtitle=%%B
    )
	
	if not exist "%~dp0CFG\%language%" md "%~dp0CFG\%language%"
    echo\
	"%~dp0BAT\Diagbox" gd 0f
    echo !dbtitle!
	echo %%i.cfg
    "%~dp0BAT\Diagbox" gd 03
    "%~dp0BAT\wget" -q --show-progress "https://raw.githubusercontent.com/Tom-Bruise/PS2-OPL-CFG-Database/master/%language%/%%i.cfg" -O "%~dp0CFG\%language%\%%i.cfg"
    "%~dp0BAT\Diagbox" gd 0f

    cd /d "%~dp0CFG\!language!" & for %%F in ( %%i.cfg ) do if %%~zF==0 del "%%F"
    if not exist %%i.cfg (
    "%~dp0BAT\Diagbox" gd 0c
    echo Not found in database
    "%~dp0BAT\Diagbox" gd 0f
    cd /d "%~dp0TMP"
    
    ) else (
    "%~dp0BAT\Diagbox" gd 03
    echo Found > nul
    "%~dp0BAT\Diagbox" gd 0f
    cd /d "%~dp0TMP"
	
	   )
	  )
	  
	cd /d "%~dp0CFG" & for %%f in (*.cfg) do ("%~dp0BAT\busybox" grep -s -e "\$" -e "Modes=" %%f > "%~dp0CFG\%language%\%%fBACKUP")
	cd /d "%~dp0CFG\%language%" & for %%f in (*.cfgBACKUP) do ("%~dp0BAT\busybox" sed -i "/Description=\|Title=/d" %%f)
	for %%f in (*.cfg) do ("%~dp0BAT\busybox" cat %%fBACKUP >> %%f) >nul 2>&1
	move "*.cfg" "%~dp0CFG" >nul 2>&1
	  
      )
     )
	
    cd /d "%~dp0TMP"
    if %language%==CFG_en copy "%~dp0BAT\DB\gameidPS2ENG.txt" "%~dp0TMP\gameid.txt" >nul 2>&1
    if %language%==CFG_fr copy "%~dp0BAT\DB\gameidPS2FRA.txt" "%~dp0TMP\gameid.txt" >nul 2>&1
    "%~dp0BAT\busybox" sed -i "s/\&/\\\&/g" "%~dp0TMP\gameid.txt"
    "%~dp0BAT\busybox" sed -i "s/\^!/\!/g" "%~dp0TMP\gameid.txt" >nul 2>&1
	"%~dp0BAT\busybox" sed -i "s.//.\\/\\/.g" "%~dp0TMP\gameid.txt"

    for /f "tokens=5*" %%i in (PARTITION_GAMES_NEW.txt) do (
	set "dbtitle="
	for /f "tokens=1*" %%A in ( 'findstr %%i gameid.txt' ) do (if not defined dbtitle set dbtitle=%%B
	"%~dp0BAT\busybox" sed -i -e "s/\Title=.*/Title=/g; s/Title=/Title=%%B/g" "%~dp0CFG\%%i.cfg" >nul 2>&1
	 )
    )

cd /d "%~dp0"
rmdir /Q/S "%~dp0CFG\%language%" >nul 2>&1
rmdir /Q/S "%~dp0TMP" >nul 2>&1
echo\
echo\

echo\
"%~dp0BAT\Diagbox" gd 0f
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo Download completed...
echo\
echo\
"%~dp0BAT\Diagbox" gd 07

pause & (goto DownloadsMenu) 

:DownloadCFGManually
echo\
echo\
echo Choose your languages of your CFG
echo 1 English 
echo 2 French
echo\
CHOICE /C 12 /M "Select Option:"
IF ERRORLEVEL 1 set language=CFG_en
IF ERRORLEVEL 2 set language=CFG_fr

echo\
echo Download Latest Configs Database?
echo NOTE: if you choose No, an offline installation will be performed.
echo Or if you choose Yes, and there is a problem connecting to the website, an offline install will be performed.
echo\
choice /c YN 
echo\

if errorlevel 1 set DownloadDB=yes
if errorlevel 2 set DownloadDB=no


    IF "!DownloadDB!"=="yes" (
    echo Checking internet connection...
	Ping www.github.com -n 1 -w 1000 >nul
	
	if errorlevel 1 (
    "%~dp0BAT\Diagbox" gd 0c
    echo.
	echo Unable to connect to internet Or Website
	echo\
	echo You will switch to offline mode
	echo\
	set DownloadDB=no
	"%~dp0BAT\Diagbox" gd 0f
	pause
	)
)

IF "!DownloadDB!"=="no" (

"%~dp0BAT\Diagbox" gd 0e
cls
echo\
echo\
echo List Games
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03

"%~dp0BAT\hdl_dump" hdl_toc !@hdl_path! > PARTITION_GAMES_NEW.txt

"%~dp0BAT\busybox" sed -i "1d" PARTITION_GAMES_NEW.txt 
"%~dp0BAT\busybox" sed -i -e "$ d" PARTITION_GAMES_NEW.txt
"%~dp0BAT\busybox" cut -c35-500 PARTITION_GAMES_NEW.txt > PARTITION_GAMES_NEW2.txt

type PARTITION_GAMES_NEW2.txt
"%~dp0BAT\Diagbox" gd 0e
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03

    REM Offline Installation
	
	echo\
    set /p gameid=Enter the GAMEID:
    IF "!GAMEID!"=="" (goto DownloadsMenu)
    echo\
	
	cd /d "%~dp0TMP"
    if !language!==CFG_en copy "%~dp0BAT\DB\gameidPS2ENG.txt" "%~dp0TMP\gameid.txt" >nul 2>&1
    if !language!==CFG_fr copy "%~dp0BAT\DB\gameidPS2FRA.txt" "%~dp0TMP\gameid.txt" >nul 2>&1

	set "dbtitle="
	for /f "tokens=1*" %%A in ( 'findstr !gameid! gameid.txt' ) do (if not defined dbtitle set dbtitle=%%B
	)
	 
    echo Extraction...
	echo\
	"%~dp0BAT\Diagbox" gd 0f
	echo !dbtitle!
	echo !gameid!.cfg
    "%~dp0BAT\7z.exe" x -bso0 "%~dp0BAT\PS2-OPL-CFG-Database.7z" -o"%~dp0CFG" PS2-OPL-CFG-Database-master\!language!\!GAMEID!.cfg -r -y
	
	cd /d "%~dp0CFG\PS2-OPL-CFG-Database-master\!language!\" & for %%F in ( "!gameid!.cfg" ) do if %%~zF==0 del "%%F" >nul 2>&1
	if not exist !gameid!.cfg (
	"%~dp0BAT\Diagbox" gd 0c
	echo Not found in database 
	"%~dp0BAT\Diagbox" gd 0f
	) else (
	
	cd /d "%~dp0CFG" & "%~dp0BAT\busybox" grep -s -e "\$" -e "Modes=" !gameid!.cfg > "%~dp0CFG\PS2-OPL-CFG-Database-master\!language!\!gameid!.cfgBACKUP"
	cd /d "%~dp0CFG\PS2-OPL-CFG-Database-master\!language!" & "%~dp0BAT\busybox" sed -i "/Description=\|Title=/d" !gameid!.cfgBACKUP & "%~dp0BAT\busybox" cat !gameid!.cfgBACKUP >> !gameid!.cfg
    move !gameid!.cfg "%~dp0CFG" >nul 2>&1
	cd /d "%~dp0" & rmdir /Q/S "%~dp0CFG\PS2-OPL-CFG-Database-master" >nul 2>&1
	"%~dp0BAT\Diagbox" gd 0f
	 )
	 
	) else (

"%~dp0BAT\Diagbox" gd 0e
cls
echo\
echo\
echo List Games
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03

"%~dp0BAT\hdl_dump" hdl_toc %@hdl_path% > PARTITION_GAMES_NEW.txt

"%~dp0BAT\busybox" sed -i "1d" PARTITION_GAMES_NEW.txt 
"%~dp0BAT\busybox" sed -i -e "$ d" PARTITION_GAMES_NEW.txt
"%~dp0BAT\busybox" cut -c35-500 PARTITION_GAMES_NEW.txt > PARTITION_GAMES_NEW2.txt

type PARTITION_GAMES_NEW2.txt
"%~dp0BAT\Diagbox" gd 0e
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03

REM Online Installation

    echo\
    set /p gameid=Enter the GAMEID:
    IF "!GAMEID!"=="" (goto DownloadsMenu)
    echo\
  
    cd /d "%~dp0TMP"
    if !language!==CFG_en copy "%~dp0BAT\DB\gameidPS2ENG.txt" "%~dp0TMP\gameid.txt" >nul 2>&1
    if !language!==CFG_fr copy "%~dp0BAT\DB\gameidPS2FRA.txt" "%~dp0TMP\gameid.txt" >nul 2>&1

	set "dbtitle="
	for /f "tokens=1*" %%A in ( 'findstr !gameid! gameid.txt' ) do (if not defined dbtitle set dbtitle=%%B
	)
	
	cd /d "%~dp0CFG" & md !language!
    echo\
	"%~dp0BAT\Diagbox" gd 0f
	echo Download...
	echo\
	echo !dbtitle!
    echo !gameid!.cfg
    "%~dp0BAT\Diagbox" gd 03
    "%~dp0BAT\wget" -q --show-progress "https://raw.githubusercontent.com/Tom-Bruise/PS2-OPL-CFG-Database/master/!language!/!gameid!.cfg" -O "%~dp0CFG\!language!\!gameid!.cfg"
    "%~dp0BAT\Diagbox" gd 0f
	
	cd /d "%~dp0CFG\!language!\" & for %%F in ( "!gameid!.cfg" ) do if %%~zF==0 del "%%F"
	if not exist !gameid!.cfg (
	"%~dp0BAT\Diagbox" gd 0c
	echo Not found in database
	"%~dp0BAT\Diagbox" gd 0f
	
	) else (
	
    cd /d "%~dp0CFG" & "%~dp0BAT\busybox" grep -s -e "\$" -e "Modes=" !gameid!.cfg > "%~dp0CFG\!language!\!gameid!.cfgBACKUP"
	cd /d "%~dp0CFG\!language!" & "%~dp0BAT\busybox" sed -i "/Description=\|Title=/d" !gameid!.cfgBACKUP & "%~dp0BAT\busybox" cat !gameid!.cfgBACKUP >> !gameid!.cfg
	move !gameid!.cfg "%~dp0CFG" >nul 2>&1
	cd /d "%~dp0" & rmdir /Q/S "%~dp0CFG\!language!" >nul 2>&1
	
      )
     )

    cd /d "%~dp0TMP"
    if !language!==CFG_en copy "%~dp0BAT\DB\gameidPS2ENG.txt" "%~dp0TMP\gameid.txt" >nul 2>&1
    if !language!==CFG_fr copy "%~dp0BAT\DB\gameidPS2FRA.txt" "%~dp0TMP\gameid.txt" >nul 2>&1
    "%~dp0BAT\busybox" sed -i "s/\&/\\\&/g" "%~dp0TMP\gameid.txt"
    "%~dp0BAT\busybox" sed -i "s/\^!/\!/g" "%~dp0TMP\gameid.txt" >nul 2>&1
	"%~dp0BAT\busybox" sed -i "s.//.\\/\\/.g" "%~dp0TMP\gameid.txt"

	for /f "tokens=1*" %%A in ( 'findstr !gameid! gameid.txt' ) do (if not defined dbtitle set dbtitle=%%B
	"%~dp0BAT\busybox" sed -i -e "s/\Title=.*/Title=/g; s/Title=/Title=%%B/g" "%~dp0CFG\!gameid!.cfg" >nul 2>&1
	 )

cd /d "%~dp0"
rmdir /Q/S "%~dp0CFG\!language!" >nul 2>&1
rmdir /Q/S "%~dp0TMP" >nul 2>&1

echo\
"%~dp0BAT\Diagbox" gd 0f
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo Download completed...
echo\
echo\
"%~dp0BAT\Diagbox" gd 0f

pause & (goto DownloadsMenu) 

REM ####################################################################################################################################################
:DumpCDDVD
@echo off

mkdir "%~dp0CD-DVD" >nul 2>&1
mkdir "%~dp0TMP" >nul 2>&1

copy "%~dp0BAT\hdl_dump.exe" "%~dp0CD-DVD\hdl_dump.exe" >nul 2>&1

cd /d "%~dp0CD-DVD"
cls

"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo Scanning Optical Drives:
echo ----------------------------------------------------
    "%~dp0BAT\Diagbox" gd 03
	"%~dp0BAT\hdl_dump" query | findstr "cd[0-9]:"
	"%~dp0BAT\Diagbox" gd 07
    echo.
    echo ----------------------------------------------------
    "%~dp0BAT\Diagbox" gd 06
	echo Prepare your DISC for DUMP
	echo.
	echo NOTE: If your optical drive is not visible, rerun this batch after inserting your disc
	"%~dp0BAT\Diagbox" gd 0f
	echo.
	echo    Optical Drives
	echo 	0. CD0:
	echo 	1. CD1:
	echo 	2. CD2:
	echo 	3. CD3: 
	echo 	4. CD4:
	echo 	5. CD5:
	echo 	6. CD6:
	echo 	7. Quit Program
    set choice=
    set /p choice="Choose your optical drives:"
        
		IF "!choice!"=="0" set hdlcddvd=cd!choice!:
		IF "!choice!"=="1" set hdlcddvd=cd!choice!:
		IF "!choice!"=="2" set hdlcddvd=cd!choice!:
		IF "!choice!"=="3" set hdlcddvd=cd!choice!:
		IF "!choice!"=="4" set hdlcddvd=cd!choice!:
		IF "!choice!"=="5" set hdlcddvd=cd!choice!:
		IF "!choice!"=="6" set hdlcddvd=cd!choice!:
		IF "!choice!"=="7" (goto GamesManagement)
cls
"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo Disc Dump:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0f

echo Dump in progress...
echo Please be patient, it may take some time
echo.

hdl_dump dump %hdlcddvd% "game.iso"
hdl_dump cdvd_info2 "game.iso" > "%~dp0CD-DVD\Info_dump.txt"

For %%Z in (Info_dump.txt) do (
 (for /f "tokens=2,3*" %%A in (%%Z) do echo %%C) > "%~dp0TMP\info2.txt" )

"%~dp0BAT\busybox" sed -i "s/\"//g" "%~dp0TMP\info2.txt"
"%~dp0BAT\busybox" sed "s/ //g" "%~dp0TMP\info2.txt" > "%~dp0TMP\info2tmp.txt"
"%~dp0BAT\busybox" sed -i s/$/.iso/ "%~dp0TMP\info2tmp.txt"
set /P dump=<"%~dp0TMP\info2tmp.txt"
ren game.iso %dump%

"%~dp0BAT\Diagbox" gd 0f
echo.
echo.
echo Output ^> \CD-DVD\%dump%

echo.
echo Do you want to check MD5 of your dump ?
choice /c YN

IF ERRORLEVEL 1 set @checkmd5=yes
IF ERRORLEVEL 2 (goto EndRedumpMatch)

IF %@checkmd5%==yes (

"%~dp0BAT\Diagbox" gd 0e
echo.
echo Download Latest Redump Database ?
echo NOTE: if you choose No, it will do an offline check.
choice /c YN 

IF ERRORLEVEL 1 set @checkmd5=yes
IF ERRORLEVEL 2 (goto md5processingdump)

if errorlevel 1 (
    echo.
	echo Checking internet connection...
	Ping redump.org -n 1 -w 1000 >nul
	
if errorlevel 1 (
"%~dp0BAT\Diagbox" gd 0c
    echo.
	echo Unable to connect to internet Or Website
	) else (
	
"%~dp0BAT\Diagbox" gd 0d
"%~dp0BAT\wget" -q --show-progress http://redump.org/datfile/ps2/ -O "%~dp0BAT\Dats\RedumpPS2.zip"
"%~dp0BAT\Diagbox" gd 07

"%~dp0BAT\Diagbox" gd 0e
	timeout 2 >nul
"%~dp0BAT\Diagbox" gd 0f
"%~dp0BAT\7z.exe" x -bso0 "%~dp0BAT\Dats\RedumpPS2.zip" -so > "%~dp0BAT\Dats\PS2\RedumpPS2.dat"
  )
 )
)
:md5processingdump
"%~dp0BAT\Diagbox" gd 0f
echo\
echo PROCESSING...
echo\

REM MD5
set "file=%dump%"
if not exist "%file%" (goto notfoundisc)
call "%~dp0BAT\md5.bat" "%file%" md5 %md5%
findstr %md5% "%~dp0BAT\Dats\PS2\RedumpPS2.dat" > "%~dp0TMP\RedumpDB.txt"

REM CRC32
"%~dp0BAT\crc32" %dump% > "%~dp0TMP\crc32tmp.txt"
"%~dp0BAT\busybox" sed "y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/" "%~dp0TMP\crc32tmp.txt" > "%~dp0TMP\crc32tmp2.txt"
"%~dp0BAT\busybox" cut -c3-11 "%~dp0TMP\crc32tmp2.txt" > "%~dp0TMP\crc32tmp3.txt"
"%~dp0BAT\busybox" sed -i "s/\s*$//" "%~dp0TMP\crc32tmp3.txt"
set /P CRC32=<"%~dp0TMP\crc32tmp3.txt"
findstr %CRC32% "%~dp0BAT\Dats\PS2\RedumpPS2.dat" > "%~dp0TMP\CRC32.txt"

REM SHA1
call "%~dp0BAT\sha1.bat" "%file%" sha1 %sha1%
findstr %sha1% "%~dp0BAT\Dats\PS2\RedumpPS2.dat" > "%~dp0TMP\SHA1.txt"

if %errorlevel%==0 (

"%~dp0BAT\Diagbox" gd 0a
echo MD5 Match With Redump Database : %md5%
echo\ 
echo http://redump.org/discs/quicksearch/%md5%/
(goto MatchREDUMP)
"%~dp0BAT\Diagbox" gd 0f

) else ( 

(goto MatchNoRedump)
)

:MatchREDUMP
setlocal DisableDelayedExpansion
REM RedumpName 
"%~dp0BAT\busybox" sed "s/size=/\n/g" "%~dp0TMP\RedumpDB.txt" > "%~dp0TMP\RedumpNameDB.txt"
"%~dp0BAT\busybox" sed -i "2d" "%~dp0TMP\RedumpNameDB.txt"
"%~dp0BAT\busybox" cut -c13-1000 "%~dp0TMP\RedumpNameDB.txt" > "%~dp0TMP\RedumpNameDBClean.txt"
"%~dp0BAT\busybox" sed -i "s/\"//g; s/amp;//g" "%~dp0TMP\RedumpNameDBClean.txt"
"%~dp0BAT\busybox" sed -i "s/\s*$//" "%~dp0TMP\RedumpNameDBClean.txt"
set /P redump=<"%~dp0TMP\RedumpNameDBClean.txt"
ren %dump% "%redump%"

REM CRC
REM "%~dp0BAT\busybox" sed "s/.iso/\n/g" "%~dp0TMP\RedumpDB.txt" > "%~dp0TMP\RedumpDBCRC.txt"
REM "%~dp0BAT\busybox" sed -i "1d" "%~dp0TMP\RedumpDBCRC.txt"
REM "%~dp0BAT\busybox" cut -c26-33 "%~dp0TMP\RedumpDBCRC.txt" > "%~dp0TMP\CRC.txt"
REM set /P CRC=<"%~dp0TMP\CRC.txt"

REM SHA1
REM "%~dp0BAT\busybox" sed "s/.iso/\n/g" "%~dp0TMP\RedumpDB.txt" > "%~dp0TMP\RedumpDBSHA1.txt"
REM "%~dp0BAT\busybox" sed -i "1d" "%~dp0TMP\RedumpDBSHA1.txt"
REM "%~dp0BAT\busybox" cut -c81-120 "%~dp0TMP\RedumpDBSHA1.txt" > "%~dp0TMP\SHA1.txt"
REM set /P SHA1=<"%~dp0TMP\SHA1.txt"

REM SIZE
REM "%~dp0BAT\busybox" sed "s/.iso/\n/g" "%~dp0TMP\RedumpDB.txt" > "%~dp0TMP\RedumpDBSIZE.txt"
REM "%~dp0BAT\busybox" sed -i "1d" "%~dp0TMP\RedumpDBSIZE.txt"
REM "%~dp0BAT\busybox" cut -c9-18 "%~dp0TMP\RedumpDBSIZE.txt" > "%~dp0TMP\SIZE.txt"
REM set /P SIZE=<"%~dp0TMP\SIZE.txt"

"%~dp0BAT\Diagbox" gd 0f
echo\
echo DETAIL
echo **********************************************
"%~dp0BAT\Diagbox" gd 0a
echo "%redump%"
echo\
echo ^|CRC: %CRC32%
echo ^|MD5: %MD5%
echo ^|SHA: %SHA1%
REM echo ^|SIZE: %SIZE%
"%~dp0BAT\Diagbox" gd 0f
echo **********************************************

echo ^|%date% %time% >> "%~dp0LOG\MD5-DUMP.log"
echo ^|File: %dump% >> "%~dp0LOG\MD5-DUMP.log"
echo ^|Redump: %redump% >> "%~dp0LOG\MD5-DUMP.log"
echo ^|CRC: %CRC32% >> "%~dp0LOG\MD5-DUMP.log"
echo ^|MD5: %MD5% >> "%~dp0LOG\MD5-DUMP.log"
echo ^|SHA: %SHA1% >> "%~dp0LOG\MD5-DUMP.log"
echo http://redump.org/discs/quicksearch/%md5%/ >> "%~dp0LOG\MD5-DUMP.log"
echo. >> "%~dp0LOG\MD5-DUMP.log"

(goto EndRedumpMatch)

:notfoundisc
cls
"%~dp0BAT\Diagbox" gd 06
echo.
echo Insert your disc into your optical drive
echo.
"%~dp0BAT\Diagbox" gd 0f
pause & (goto GamesManagement)

:MatchNoRedump
"%~dp0BAT\Diagbox" gd 0c
echo.
echo WARNING: MD5 NO MATCH WITH Redump Database : %md5%
echo ^|%date% %time% >> "%~dp0LOG\MD5-DUMP-FAIL.log"
echo ^|File: %dump% >> "%~dp0LOG\MD5-DUMP-FAIL.log"
echo ^|CRC: %CRC32% >> "%~dp0LOG\MD5-DUMP-FAIL.log"
echo ^|MD5: %MD5% >> "%~dp0LOG\MD5-DUMP-FAIL.log"
echo ^|SHA: %SHA1% >> "%~dp0LOG\MD5-DUMP-FAIL.log"
echo. >> "%~dp0LOG\MD5-DUMP-FAIL.log"
echo.
"%~dp0BAT\Diagbox" gd 06
echo There can be several reasons
echo.
echo This could be due to a bad dump or to a CD-ROM Converted to .ISO
echo How to differentiate a DVD-ROM from a CD-ROM In general, the CD-ROM is only 700MB 
echo and CD-ROMs are often colored blue under the disc.
echo.
echo Where you have a copy of a game that has never been dumped for more info visit redump.org
echo.
"%~dp0BAT\Diagbox" gd 0f

:EndRedumpMatch
del "%~dp0CD-DVD\hdl_dump.exe" >nul 2>&1
rmdir /Q/S "%~dp0TMP" >nul 2>&1

echo\
"%~dp0BAT\Diagbox" gd 0f
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo Dump Completed...
echo\
echo\
"%~dp0BAT\Diagbox" gd 07

endlocal
pause & (goto GamesManagement)

REM ###################################################################################################################################################
:ExportChoiceGamesListHDD

cd "%~dp0"
cls

mkdir "%~dp0TMP" >nul 2>&1

"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo Choose what type of games you want to export game list:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) Yes PS2 Games
"%~dp0BAT\Diagbox" gd 0c
echo         2) %NO%
"%~dp0BAT\Diagbox" gd 0e
echo         3) Yes PS1 Games
echo\
"%~dp0BAT\Diagbox" gd 07
CHOICE /C 123 /M "Select Option:"

IF ERRORLEVEL 3 (goto ExportPS1GamesList)
IF ERRORLEVEL 2 (goto GamesManagement) 
IF ERRORLEVEL 1 (goto ExportPS2GamesList)

REM #######################################################################################################################################################################

:ExportPS1GamesList
cls
mkdir "%~dp0TMP" >nul 2>&1
"%~dp0BAT\Diagbox" gd 0e

echo\
echo\
echo Scanning for Playstation 2 HDDs:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD"
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD" | "%~dp0BAT\busybox" cut -c2-6 > "%~dp0TMP\hdl-hdd.txt"
"%~dp0BAT\busybox" sed -i "s/hdd/\\\\.\\\PhysicalDrive/g; s/://g" "%~dp0TMP\hdl-hdd.txt"

set /P @hdl_path=<"%~dp0TMP\hdl-hdd.txt"
::del "%~dp0TMP\hdl-hdd.txt" >nul 2>&1
IF "!@hdl_path!"=="" ( 
"%~dp0BAT\Diagbox" gd 0c
		echo         Playstation 2 HDD Not Detected
		echo         Drive Must Be Formatted First
		echo\
		echo\
"%~dp0BAT\Diagbox" gd 07
		rmdir /Q/S "%~dp0TMP" >nul 2>&1
		del info.sys >nul 2>&1     
		pause & (goto GamesManagement)
	)
	
echo\
echo\
"%~dp0BAT\Diagbox" gd 0f
echo Export PS1 Game List ?
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) Yes (Export All Partition Games list)
"%~dp0BAT\Diagbox" gd 0c
echo         2) No
"%~dp0BAT\Diagbox" gd 0e
echo         3) Yes (Export only the chosen partition)
"%~dp0BAT\Diagbox" gd 0f
echo\
CHOICE /C 1234 /M "Select Option:"

IF ERRORLEVEL 3 (goto ExportPS1GamesOnlyPart)
IF ERRORLEVEL 2 (goto GamesManagement)
IF ERRORLEVEL 1 (goto ExportPS1GamesListPartAll)


:ExportPS1GamesOnlyPart
(
echo.
echo Choose the partition on which Export game list
echo.
echo 0.  __.POPS0
echo 1.  __.POPS1
echo 2.  __.POPS2
echo 3.  __.POPS3
echo 4.  __.POPS4
echo 5.  __.POPS5
echo 6.  __.POPS6
echo 7.  __.POPS7
echo 8.  __.POPS8
echo 9.  __.POPS9
echo 10. __.POPS
echo.

set choice=
set /p choice="Select Option:"
IF "!choice!"=="" (goto ExportPS1GamesList)

IF "!choice!"=="0" set POPSPART=__.POPS0
IF "!choice!"=="1" set POPSPART=__.POPS1
IF "!choice!"=="2" set POPSPART=__.POPS2
IF "!choice!"=="3" set POPSPART=__.POPS3
IF "!choice!"=="4" set POPSPART=__.POPS4
IF "!choice!"=="5" set POPSPART=__.POPS5
IF "!choice!"=="6" set POPSPART=__.POPS6
IF "!choice!"=="7" set POPSPART=__.POPS7
IF "!choice!"=="8" set POPSPART=__.POPS8
IF "!choice!"=="9" set POPSPART=__.POPS9
IF "!choice!"=="10" set POPSPART=__.POPS

)
		
"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo Export...
echo\
	
	echo device !@hdl_path! > "%~dp0TMP\pfs-log.txt"
	echo mount !POPSPART! >> "%~dp0TMP\pfs-log.txt"
	echo ls -l >> "%~dp0TMP\pfs-log.txt"
	echo umount >> "%~dp0TMP\pfs-log.txt"
	echo exit >> "%~dp0TMP\pfs-log.txt"
	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
	"%~dp0BAT\busybox" grep -i -e ".*\.VCD$" "%~dp0TMP\pfs-tmp.log" > "%~dp0GamelistPS1!POPSPART!.txt"

echo Output ^> "%~dp0GamelistPS1!POPSPART!.txt"
	
rmdir /Q/S "%~dp0TMP" >nul 2>&1
del info.sys >nul 2>&1

echo.

pause & (goto GamesManagement)

:ExportPS1GamesListPartAll
"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo Export...
echo\

    echo device !@hdl_path! > "%~dp0TMP\pfs-log.txt"
	echo mount __.POPS >> "%~dp0TMP\pfs-log.txt"
	echo ls -l >> "%~dp0TMP\pfs-log.txt"
	echo umount >> "%~dp0TMP\pfs-log.txt"
	echo exit >> "%~dp0TMP\pfs-log.txt"
	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
	"%~dp0BAT\busybox" grep -i -e ".*\.VCD$" "%~dp0TMP\pfs-tmp.log" > "%~dp0GamelistPS1__.POPS.txt"
	
	echo device !@hdl_path! > "%~dp0TMP\pfs-log.txt"
	echo mount __.POPS0 >> "%~dp0TMP\pfs-log.txt"
	echo ls -l >> "%~dp0TMP\pfs-log.txt"
	echo umount >> "%~dp0TMP\pfs-log.txt"
	echo exit >> "%~dp0TMP\pfs-log.txt"
	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
	"%~dp0BAT\busybox" grep -i -e ".*\.VCD$" "%~dp0TMP\pfs-tmp.log" > "%~dp0GamelistPS1__.POPS0.txt"
	
	echo device !@hdl_path! > "%~dp0TMP\pfs-log.txt"
	echo mount __.POPS1 >> "%~dp0TMP\pfs-log.txt"
	echo ls -l >> "%~dp0TMP\pfs-log.txt"
	echo umount >> "%~dp0TMP\pfs-log.txt"
	echo exit >> "%~dp0TMP\pfs-log.txt"
	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
	"%~dp0BAT\busybox" grep -i -e ".*\.VCD$" "%~dp0TMP\pfs-tmp.log" > "%~dp0GamelistPS1__.POPS1.txt"
	
	echo device !@hdl_path! > "%~dp0TMP\pfs-log.txt"
	echo mount __.POPS2 >> "%~dp0TMP\pfs-log.txt"
	echo ls -l >> "%~dp0TMP\pfs-log.txt"
	echo umount >> "%~dp0TMP\pfs-log.txt"
	echo exit >> "%~dp0TMP\pfs-log.txt"
	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
	"%~dp0BAT\busybox" grep -i -e ".*\.VCD$" "%~dp0TMP\pfs-tmp.log" > "%~dp0GamelistPS1__.POPS2.txt"
	
	echo device !@hdl_path! > "%~dp0TMP\pfs-log.txt"
	echo mount __.POP3 >> "%~dp0TMP\pfs-log.txt"
	echo ls -l >> "%~dp0TMP\pfs-log.txt"
	echo umount >> "%~dp0TMP\pfs-log.txt"
	echo exit >> "%~dp0TMP\pfs-log.txt"
	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
	"%~dp0BAT\busybox" grep -i -e ".*\.VCD$" "%~dp0TMP\pfs-tmp.log" > "%~dp0GamelistPS1__.POPS3.txt"
	
	echo device !@hdl_path! > "%~dp0TMP\pfs-log.txt"
	echo mount __.POPS4 >> "%~dp0TMP\pfs-log.txt"
	echo ls -l >> "%~dp0TMP\pfs-log.txt"
	echo umount >> "%~dp0TMP\pfs-log.txt"
	echo exit >> "%~dp0TMP\pfs-log.txt"
	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
	"%~dp0BAT\busybox" grep -i -e ".*\.VCD$" "%~dp0TMP\pfs-tmp.log" > "%~dp0GamelistPS1__.POPS4.txt"
	
	echo device !@hdl_path! > "%~dp0TMP\pfs-log.txt"
	echo mount __.POPS5 >> "%~dp0TMP\pfs-log.txt"
	echo ls -l >> "%~dp0TMP\pfs-log.txt"
	echo umount >> "%~dp0TMP\pfs-log.txt"
	echo exit >> "%~dp0TMP\pfs-log.txt"
	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
	"%~dp0BAT\busybox" grep -i -e ".*\.VCD$" "%~dp0TMP\pfs-tmp.log" > "%~dp0GamelistPS1__.POPS5.txt"
	
    echo device !@hdl_path! > "%~dp0TMP\pfs-log.txt"
	echo mount __.POPS6 >> "%~dp0TMP\pfs-log.txt"
	echo ls -l >> "%~dp0TMP\pfs-log.txt"
	echo umount >> "%~dp0TMP\pfs-log.txt"
	echo exit >> "%~dp0TMP\pfs-log.txt"
	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
	"%~dp0BAT\busybox" grep -i -e ".*\.VCD$" "%~dp0TMP\pfs-tmp.log" > "%~dp0GamelistPS1__.POPS6.txt"
	
	echo device !@hdl_path! > "%~dp0TMP\pfs-log.txt"
	echo mount __.POPS7 >> "%~dp0TMP\pfs-log.txt"
	echo ls -l >> "%~dp0TMP\pfs-log.txt"
	echo umount >> "%~dp0TMP\pfs-log.txt"
	echo exit >> "%~dp0TMP\pfs-log.txt"
	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
	"%~dp0BAT\busybox" grep -i -e ".*\.VCD$" "%~dp0TMP\pfs-tmp.log" > "%~dp0GamelistPS1__.POPS7.txt"
	
	echo device !@hdl_path! > "%~dp0TMP\pfs-log.txt"
	echo mount __.POPS8 >> "%~dp0TMP\pfs-log.txt"
	echo ls -l >> "%~dp0TMP\pfs-log.txt"
	echo umount >> "%~dp0TMP\pfs-log.txt"
	echo exit >> "%~dp0TMP\pfs-log.txt"
	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
	"%~dp0BAT\busybox" grep -i -e ".*\.VCD$" "%~dp0TMP\pfs-tmp.log" > "%~dp0GamelistPS1__.POPS8.txt"
	
	echo device !@hdl_path! > "%~dp0TMP\pfs-log.txt"
	echo mount __.POPS9 >> "%~dp0TMP\pfs-log.txt"
	echo ls -l >> "%~dp0TMP\pfs-log.txt"
	echo umount >> "%~dp0TMP\pfs-log.txt"
	echo exit >> "%~dp0TMP\pfs-log.txt"
	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
	"%~dp0BAT\busybox" grep -i -e ".*\.VCD$" "%~dp0TMP\pfs-tmp.log" > "%~dp0GamelistPS1__.POPS9.txt"

echo Output ^> "%~dp0GamelistPS1_POPS#.txt"
	
rmdir /Q/S "%~dp0TMP" >nul 2>&1
del info.sys >nul 2>&1

echo.

pause & (goto GamesManagement) 

REM ###################################################################################################################################################
:ExportPS2GamesList
cls
mkdir "%~dp0TMP" >nul 2>&1
"%~dp0BAT\Diagbox" gd 0e

echo\
echo\
echo Scanning for Playstation 2 HDDs:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD"
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD" | "%~dp0BAT\busybox" cut -c2-6 > "%~dp0TMP\hdl-hdd.txt"

set /P @hdl_path=<"%~dp0TMP\hdl-hdd.txt"
::del "%~dp0TMP\hdl-hdd.txt" >nul 2>&1
IF "!@hdl_path!"=="" ( 
"%~dp0BAT\Diagbox" gd 0c
		echo         Playstation 2 HDD Not Detected
		echo         Drive Must Be Formatted First
		echo\
		echo\
"%~dp0BAT\Diagbox" gd 07
		rmdir /Q/S "%~dp0TMP" >nul 2>&1
		del info.sys >nul 2>&1     
		pause & (goto GamesManagement)
	)
	
echo\
echo\
"%~dp0BAT\Diagbox" gd 0f
echo Export PS2 Game List ?
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) Yes (Export All Games list)
"%~dp0BAT\Diagbox" gd 0c
echo         2) No
"%~dp0BAT\Diagbox" gd 0e
echo         3) Yes (Export Only CD)
echo         4) Yes (Export Only DVD)
"%~dp0BAT\Diagbox" gd 0f
echo\
CHOICE /C 1234 /M "Select Option:"

IF ERRORLEVEL 4 (goto ExportPS2GamesOnlyDVD)
IF ERRORLEVEL 3 (goto ExportPS2GamesOnlyCD)
IF ERRORLEVEL 2 (goto GamesManagement)
IF ERRORLEVEL 1 (goto ExportPS2GamesAll)
		
"%~dp0BAT\Diagbox" gd 0f
:ExportPS2GamesAll
echo\
echo\
echo Export...
echo\

    "%~dp0BAT\hdl_dump" hdl_toc %@hdl_path% > "%~dp0\GamelistPS2.txt"

echo Output ^> "%~dp0GamelistPS2.txt"

(goto ExportPS2GamesEnd)

:ExportPS2GamesOnlyCD
echo\
echo\
echo Export...
echo\

    "%~dp0BAT\hdl_dump" hdl_toc %@hdl_path% | "%~dp0BAT\busybox" grep -i -e "CD" > "%~dp0\GamelistPS2CD.txt"

echo Output ^> "%~dp0GamelistPS2CD.txt"

(goto ExportPS2GamesEnd)

:ExportPS2GamesOnlyDVD
echo\
echo\
echo Export...
echo\

    "%~dp0BAT\hdl_dump" hdl_toc %@hdl_path% | "%~dp0BAT\busybox" grep -i -e "DVD" > "%~dp0\GamelistPS2DVD.txt"

echo Output ^> "%~dp0GamelistPS2DVD.txt"

(goto ExportPS2GamesEnd)


:ExportPS2GamesEnd
rmdir /Q/S "%~dp0TMP" >nul 2>&1
del info.sys >nul 2>&1

echo.

pause & (goto GamesManagement) 

REM ####################################################################################################################################################
:checkMD5HashPS2Games

cls
mkdir "%~dp0CD-DVD" >nul 2>&1
mkdir "%~dp0TMP" >nul 2>&1
cd /d "%~dp0CD-DVD"

"%~dp0BAT\Diagbox" gd 0e
echo.
echo Download Latest Redump Database ?
echo NOTE: if you choose No, it will do an offline check.
choice /c YN 

if errorlevel 1 set DownloadDB=yes
if errorlevel 2 set DownloadDB=no


    IF "!DownloadDB!"=="yes" (
    echo Checking internet connection...
	Ping www.redump.org -n 1 -w 1000 >nul
	
	if errorlevel 1 (
    "%~dp0BAT\Diagbox" gd 0c
    echo.
	echo Unable to connect to internet Or Website
	echo\	
	set DownloadDB=no
	) else (
	"%~dp0BAT\Diagbox" gd 0d
    "%~dp0BAT\wget" -q --show-progress http://redump.org/datfile/ps2/ -O "%~dp0BAT\Dats\RedumpPS2.zip"
    "%~dp0BAT\Diagbox" gd 07
    
    "%~dp0BAT\Diagbox" gd 0e
    	timeout 2 >nul
    "%~dp0BAT\Diagbox" gd 0f
    "%~dp0BAT\7z.exe" x -bso0 "%~dp0BAT\Dats\RedumpPS2.zip" -so > "%~dp0BAT\Dats\PS2\RedumpPS2.dat"
	set DownloadDB=no
	)
)

IF "!DownloadDB!"=="no" (

"%~dp0BAT\Diagbox" gd 06
echo\
if not exist "%~dp0CD\*.bin" echo NO .BIN found in CD folder
echo\
if not exist "%~dp0DVD\*.iso" echo NO .ISO found in DVD folder
echo\

move "%~dp0CD\*.bin"  "%~dp0CD-DVD" >nul 2>&1
move "%~dp0CD\*.iso"  "%~dp0CD-DVD" >nul 2>&1
move "%~dp0DVD\*.iso" "%~dp0CD-DVD" >nul 2>&1

cd "%~dp0CD-DVD"
"%~dp0BAT\Diagbox" gd 0f
set /a gamecount=0
for %%f in (*.iso *.bin) do (
	set /a gamecount+=1
    echo.
	echo.
	echo !gamecount! - %%f

	setlocal disabledelayedexpansion
	set filename=%%f
	
	setlocal enabledelayedexpansion 
		
		echo\
        echo PROCESSING...
        echo\
		
		set "md5="
		for /f "skip=1 tokens=* delims=" %%# in ('certutil -hashfile "!filename!" MD5') do (
	    if not defined md5 (
		for %%Z in (%%#) do set "md5=!md5!%%Z"
		findstr !md5! "%~dp0BAT\Dats\PS2\RedumpPS2.dat" > "%~dp0TMP\RedumpDB.txt"
		    )
        )

        REM CRC32
        "%~dp0BAT\crc32" "!filename!" > "%~dp0TMP\crc32tmp.txt"
        "%~dp0BAT\busybox" sed "y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/" "%~dp0TMP\crc32tmp.txt" > "%~dp0TMP\crc32tmp2.txt"
        "%~dp0BAT\busybox" cut -c3-11 "%~dp0TMP\crc32tmp2.txt" > "%~dp0TMP\crc32tmp3.txt"
		"%~dp0BAT\busybox" sed -i "s/\s*$//" "%~dp0TMP\crc32tmp3.txt"
        set /P CRC32=<"%~dp0TMP\crc32tmp3.txt"
        findstr !CRC32! "%~dp0BAT\Dats\PS2\RedumpPS2.dat" > "%~dp0TMP\CRC32.txt"
        
        REM SHA1
        set "sha1="
        for /f "skip=1 tokens=* delims=" %%# in ('certutil -hashfile "!filename!" SHA1') do (
        if not defined sha1 (
        for %%Z in (%%#) do set "sha1=!sha1!%%Z"
        findstr !sha1! "%~dp0BAT\Dats\PS2\RedumpPS2.dat" > "%~dp0TMP\SHA1.txt"
        	)
        )

		if errorlevel 1 (
		"%~dp0BAT\Diagbox" gd 0c
        echo WARNING: MD5 NO MATCH WITH Redump Database : !md5!
		echo ^|!date! !time! >> "%~dp0LOG\MD5-Fail.log"
        echo ^|File: !filename! >> "%~dp0LOG\MD5-Fail.log"
        echo ^|CRC: !CRC32! >> "%~dp0LOG\MD5-Fail.log"
        echo ^|MD5: !MD5! >> "%~dp0LOG\MD5-Fail.log"
        echo ^|SHA: !SHA1! >> "%~dp0LOG\MD5-Fail.log"
        echo. >> "%~dp0LOG\MD5-Fail.log"
        echo.
        "%~dp0BAT\Diagbox" gd 06
        echo There can be several reasons
        echo.
        echo This could be due to a bad dump or to a CD-ROM Converted to .ISO
        echo How to differentiate a DVD-ROM from a CD-ROM. In general, the CD-ROM is only 700MB 
        echo and CD-ROMs are often colored blue under the disc.
        echo.
        echo Where you have a copy of a game that has never been dumped for more info visit redump.org
        "%~dp0BAT\Diagbox" gd 0f
       ) else (
	   "%~dp0BAT\Diagbox" gd 0a
       echo MD5 Match With Redump Database : !md5!
	   echo\
	   echo http://redump.org/discs/quicksearch/!md5!/
	   "%~dp0BAT\Diagbox" gd 0f

setlocal DisableDelayedExpansion
REM RedumpName 
"%~dp0BAT\busybox" sed "s/size=/\n/g" "%~dp0TMP\RedumpDB.txt" > "%~dp0TMP\RedumpNameDB.txt"
"%~dp0BAT\busybox" sed -i "2d" "%~dp0TMP\RedumpNameDB.txt"
"%~dp0BAT\busybox" cut -c13-1000 "%~dp0TMP\RedumpNameDB.txt" > "%~dp0TMP\RedumpNameDBClean.txt"
"%~dp0BAT\busybox" sed -i "s/\"//g; s/amp;//g" "%~dp0TMP\RedumpNameDBClean.txt"
"%~dp0BAT\busybox" sed -i "s/\s*$//" "%~dp0TMP\RedumpNameDBClean.txt"
set /P redump=<"%~dp0TMP\RedumpNameDBClean.txt"

setlocal enabledelayedexpansion
ren "!filename!" "!redump!"

"%~dp0BAT\Diagbox" gd 0f
echo\
echo DETAIL
echo **********************************************
"%~dp0BAT\Diagbox" gd 0a
echo "!redump!"
echo\
echo ^|CRC: !CRC32!
echo ^|MD5: !MD5!
echo ^|SHA: !SHA1!
REM echo ^|SIZE: %SIZE%
"%~dp0BAT\Diagbox" gd 0f
echo **********************************************

echo ^|!date! !time! >> "%~dp0LOG\MD5-Match.log"
echo ^|File: !filename! >> "%~dp0LOG\MD5-Match.log" 
echo ^|Redump: !redump! >> "%~dp0LOG\MD5-Match.log" 
echo ^|CRC: !CRC32! >> "%~dp0LOG\MD5-Match.log"  
echo ^|MD5: !MD5! >> "%~dp0LOG\MD5-Match.log"
echo ^|SHA: !SHA1! >> "%~dp0LOG\MD5-Match.log"
echo http://redump.org/discs/quicksearch/!md5!/ >> "%~dp0LOG\MD5-Match.log"
echo. >> "%~dp0LOG\MD5-Match.log"

move "!redump!" "%~dp0DVD" >nul 2>&1
move "%~dp0DVD\*.bin" "%~dp0CD" >nul 2>&1

endlocal
endlocal
endlocal
endlocal
     )
   )
 )
)
echo\

move "%~dp0CD-DVD\*.bin" "%~dp0CD" >nul 2>&1
move "%~dp0CD-DVD\*.iso" "%~dp0DVD" >nul 2>&1

del "%~dp0CD\*.cue" >nul 2>&1
cd "%~dp0CD" >nul 2>&1
REM CHECK IF .CUE IS MISSING FOR .BIN IF IT IS NOT DETECTED IT WILL BE CREATED
if not exist "%%~nf.cue" call "%~dp0BAT\cuemaker.bat"

rmdir /Q/S "%~dp0TMP" >nul 2>&1

echo\
"%~dp0BAT\Diagbox" gd 0f
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo Completed...
echo\
echo\
"%~dp0BAT\Diagbox" gd 07

pause & (goto GamesManagement)

REM ####################################################################################################################################################
:RenameChoiceGames

cd "%~dp0"
cls

mkdir "%~dp0TMP" >nul 2>&1

"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo Rename your Games:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) Yes PS2 Games
"%~dp0BAT\Diagbox" gd 0c
echo         2) %NO%
"%~dp0BAT\Diagbox" gd 0e
echo         3) Yes PS1 Games (Rename .VCD)
echo\
"%~dp0BAT\Diagbox" gd 07
CHOICE /C 123 /M "Select Option:"

IF ERRORLEVEL 3 (goto RenamePS1GamesHDD)
IF ERRORLEVEL 2 (goto GamesManagement)
IF ERRORLEVEL 1 (goto RenamePS2GamesHDD)

REM ###################################################################

:RenamePS2GamesHDD

cls
mkdir "%~dp0TMP" >nul 2>&1
mkdir "%~dp0CD-DVD" >nul 2>&1
cd /d "%~dp0CD-DVD"

copy "%~dp0BAT\hdl_dump.exe" "%~dp0CD-DVD" >nul 2>&1
"%~dp0BAT\Diagbox" gd 0e

cls
echo\
echo\
echo Scanning for Playstation 2 HDDs:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD"
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD" | "%~dp0BAT\busybox" cut -c2-6 > "%~dp0TMP\hdl-hdd.txt"

set /P @hdl_path=<"%~dp0TMP\hdl-hdd.txt"
::del "%~dp0TMP\hdl-hdd.txt" >nul 2>&1
IF "!@hdl_path!"=="" (
"%~dp0BAT\Diagbox" gd 0c
		echo         Playstation 2 HDD Not Detected
		echo         Drive Must Be Formatted First
		echo\
		echo\
"%~dp0BAT\Diagbox" gd 07
		rmdir /Q/S "%~dp0TMP" >nul 2>&1
		del info.sys >nul 2>&1     
		pause & (goto GamesManagement)
	)
	
"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo Rename a PS2 game ?
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) %YES%
"%~dp0BAT\Diagbox" gd 0c
echo         2) %NO%
"%~dp0BAT\Diagbox" gd 0e
echo         3) Yes (Automatically rename all game titles on hard drive with database)
"%~dp0BAT\Diagbox" gd 0f
echo\
CHOICE /C 123 /M "Select Option:"

IF ERRORLEVEL 3 (goto RenamePS2GamesDBTITLE)
IF ERRORLEVEL 2 (goto GamesManagement)


"%~dp0BAT\Diagbox" gd 0e
cls
echo\
echo\
echo Scan Games List:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
setlocal DisableDelayedExpansion

hdl_dump hdl_toc %@hdl_path% > PARTITION_GAMES.txt

"%~dp0BAT\busybox" sed -i "1d" PARTITION_GAMES.txt
"%~dp0BAT\busybox" sed -i -e "$ d" PARTITION_GAMES.txt
"%~dp0BAT\busybox" cut -c35-500 PARTITION_GAMES.txt > PARTITION_GAMES_NEW.txt

type PARTITION_GAMES_NEW.txt

"%~dp0BAT\Diagbox" gd 0e
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
echo\
setlocal EnableDelayedExpansion
echo Enter the full name
echo Example: NFS Underground
echo\
set /p "RenamePS2Games=Enter the name of the game you want to rename:"
IF "!RenamePS2Games!"=="" (goto GamesManagement)

echo\
echo Enter the new name
echo Example: Need For Speed : Underground
echo\
set /p "RenamePS2GamesNEW=Enter the new name of your game:"
IF "!RenamePS2Games!"=="" (goto GamesManagement)

for /f "tokens=5*" %%C in (PARTITION_GAMES.txt) do ( echo %%C )
set %%C=gameid

setlocal DisableDelayedExpansion
"%~dp0BAT\Diagbox" gd 0e
cls
echo\
echo\
echo Game Selected "%RenamePS2Games%"
"%~dp0BAT\Diagbox" gd 0f
echo ----------------------------------------------------
echo\
"%~dp0BAT\Diagbox" gd 03

    echo        Renaming...
	echo        "%RenamePS2Games%"
	REM Why first renamed with GAME ID. ? To avoid errors if the name of the game is similar to another
	"%~dp0BAT\hdl_dump" modify %@hdl_path% "%RenamePS2Games%" "%gameid%"
	"%~dp0BAT\hdl_dump" modify %@hdl_path% "%gameid%" "%RenamePS2GamesNEW%"
	echo        "%RenamePS2GamesNEW%"
    echo        Completed...
	) else ( echo          Canceled... )

rmdir /Q/S "%~dp0TMP" >nul 2>&1
del info.sys >nul 2>&1

"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo Renaming Completed...
echo\
echo\
"%~dp0BAT\Diagbox" gd 0f

cd "%~dp0CD-DVD"
move *.bin "%~dp0CD" >nul 2>&1
move *.cue "%~dp0CD" >nul 2>&1
move *.iso "%~dp0DVD" >nul 2>&1

cd "%~dp0"
rmdir /Q/S "%~dp0CD-DVD" >nul 2>&1
rmdir /Q/S "%~dp0TMP" >nul 2>&1

echo.
endlocal
pause & (goto GamesManagement)

REM ######################################
:RenamePS2GamesDBTITLE
echo\
echo\
echo Choose the titles language of the games list
echo\
echo Some games have their own title in several languages for example:
echo English = The Simpsons Game
echo French  = Les Simpson le jeu
echo\
echo 1 English 
echo 2 French
echo\
CHOICE /C 12 /M "Select Option:"
IF ERRORLEVEL 1 set language=ENG
IF ERRORLEVEL 2 set language=FRA

"%~dp0BAT\Diagbox" gd 0e
cls
echo\
echo\
echo Scan Games List:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
setlocal DisableDelayedExpansion

hdl_dump hdl_toc %@hdl_path% > PARTITION_GAMES.txt

"%~dp0BAT\busybox" sed -i "1d" PARTITION_GAMES.txt
"%~dp0BAT\busybox" sed -i -e "$ d" PARTITION_GAMES.txt
"%~dp0BAT\busybox" cut -c35-500 PARTITION_GAMES.txt > PARTITION_GAMES_NEW.txt

type PARTITION_GAMES_NEW.txt
"%~dp0BAT\Diagbox" gd 0e
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 07
	
    "%~dp0BAT\busybox" sed -i "s/\"//g" "%~dp0CD-DVD\PARTITION_GAMES.txt"
	
	if %language%==ENG copy "%~dp0BAT\DB\gameidPS2ENG.txt" "%~dp0TMP\gameid.txt" >nul 2>&1
    if %language%==FRA copy "%~dp0BAT\DB\gameidPS2FRA.txt" "%~dp0TMP\gameid.txt" >nul 2>&1

    for /f "tokens=5*" %%C in (PARTITION_GAMES.txt) do (
	
	set "dbtitle="
	for /f "tokens=1*" %%A in (' findstr %%C "%~dp0TMP\gameid.txt" ') do (if not defined dbtitle set dbtitle=%%B
	
	"%~dp0BAT\Diagbox" gd 07
	echo\
    echo %%C
    echo %%D
	"%~dp0BAT\Diagbox" gd 03
	echo Rename to original Title: %%B
	
    REM Why first renamed with GAME ID. ? To avoid errors if the name of the game is similar to another
	hdl_dump modify %@hdl_path% "%%D" "%%C"
	hdl_dump modify %@hdl_path% "%%C" "%%B"
	echo\
	
  )
)

rmdir /Q/S "%~dp0TMP" >nul 2>&1

"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo Renaming Completed...
echo\
echo\
"%~dp0BAT\Diagbox" gd 0f


endlocal
pause & (goto GamesManagement)

REM #######################################################################################################################################################################
:RenamePS1GamesHDD
cd "%~dp0"
cls

mkdir "%~dp0TMP" >nul 2>&1

"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo Scanning for Playstation 2 HDDs:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD"
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD" | "%~dp0BAT\busybox" cut -c2-6 > "%~dp0TMP\hdl-hdd.txt"
"%~dp0BAT\busybox" sed -i "s/hdd/\\\\.\\\PhysicalDrive/g; s/://g" "%~dp0TMP\hdl-hdd.txt"

set /P @hdl_path=<"%~dp0TMP\hdl-hdd.txt"
del "%~dp0TMP\hdl-hdd.txt" >nul 2>&1
IF "!@hdl_path!"=="" ( 
"%~dp0BAT\Diagbox" gd 0c
		echo         Playstation 2 HDD Not Detected
		echo         Drive Must Be Formatted First
		echo\
		echo\
"%~dp0BAT\Diagbox" gd 07
		rmdir /Q/S "%~dp0TMP" >nul 2>&1
		del info.sys >nul 2>&1	
		pause & (goto GamesManagement)
	)

"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo Rename your .VCD:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) %YES%
"%~dp0BAT\Diagbox" gd 0c
echo         2) %NO%
"%~dp0BAT\Diagbox" gd 0e
echo         3) %YES% (Manually Choose your Partition)
echo\
"%~dp0BAT\Diagbox" gd 07
CHOICE /C 123 /M "Select Option:"

IF ERRORLEVEL 1 set @pfs_pop=yes & set POPSPART=__.POPS
IF ERRORLEVEL 3 set @pfs_pop=yesmanually & (goto RenamePS1Gamespoppart)
IF ERRORLEVEL 2 (goto GamesManagement)


:RenamePS1Gamespoppart
IF %@pfs_pop%==yesmanually (
echo.
echo Choose the partition where your .VCDs to extract are located.
echo By default it will be the partition __.POPS 
echo.
echo 0.  __.POPS0
echo 1.  __.POPS1
echo 2.  __.POPS2
echo 3.  __.POPS3
echo 4.  __.POPS4
echo 5.  __.POPS5
echo 6.  __.POPS6
echo 7.  __.POPS7
echo 8.  __.POPS8
echo 9.  __.POPS9
echo 10. __.POPS
echo.

set choice=
set /p choice="Select Option:"
IF "!choice!"=="" (goto RenamePS1GamesHDD)

IF "!choice!"=="0" set POPSPART=__.POPS0
IF "!choice!"=="1" set POPSPART=__.POPS1
IF "!choice!"=="2" set POPSPART=__.POPS2
IF "!choice!"=="3" set POPSPART=__.POPS3
IF "!choice!"=="4" set POPSPART=__.POPS4
IF "!choice!"=="5" set POPSPART=__.POPS5
IF "!choice!"=="6" set POPSPART=__.POPS6
IF "!choice!"=="7" set POPSPART=__.POPS7
IF "!choice!"=="8" set POPSPART=__.POPS8
IF "!choice!"=="9" set POPSPART=__.POPS9
IF "!choice!"=="10" set POPSPART=__.POPS

)

"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo Detecting POPS Partition:
echo ----------------------------------------------------
    "%~dp0BAT\Diagbox" gd 07
    echo device !@hdl_path! > "%~dp0TMP\pfs-prt.txt"
    echo ls -l >> "%~dp0TMP\pfs-prt.txt"
    echo exit >> "%~dp0TMP\pfs-prt.txt"
    type "%~dp0TMP\pfs-prt.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-prt.log"
    "%~dp0BAT\busybox" cat "%~dp0TMP\pfs-prt.log" | "%~dp0BAT\busybox" grep -w "%POPSPART%" | "%~dp0BAT\busybox" sed "s/.*%POPSPART%/%POPSPART%/" | "%~dp0BAT\busybox" tr -d " " | "%~dp0BAT\busybox" head -1 | "%~dp0BAT\busybox" sed -e "s/@/\//g" > "%~dp0TMP\hdd-prt.txt"
    set /P @hdd_avl=<"%~dp0TMP\hdd-prt.txt"
    REM del "%~dp0TMP\pfs-prt.txt" "%~dp0TMP\pfs-prt.log" >nul 2>&1 "%~dp0TMP\hdd-prt.txt"

IF "!@hdd_avl!"=="%POPSPART%/" (
"%~dp0BAT\Diagbox" gd 0a
	echo        %POPSPART% - Partition Detected
	"%~dp0BAT\Diagbox" gd 07
	) else (
	"%~dp0BAT\Diagbox" gd 0c
	echo        %POPSPART% - Partition NOT Detected
	echo        Partition Must Be Formatted Or Created
	echo\
	echo\
	"%~dp0BAT\Diagbox" gd 07
	rmdir /Q/S "%~dp0TMP" >nul 2>&1
	del info.sys >nul 2>&1
	pause & (goto GamesManagement)
	)

echo\
echo\
pause
cls

"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo Scanning Games List in %POPSPART%:
echo ----------------------------------------------------
echo\
"%~dp0BAT\Diagbox" gd 07

    echo device !@hdl_path! > "%~dp0TMP\pfs-prt.txt"
	echo mount %POPSPART% >> "%~dp0TMP\pfs-prt.txt"
    echo ls -l >> "%~dp0TMP\pfs-prt.txt"
    echo exit >> "%~dp0TMP\pfs-prt.txt"
    type "%~dp0TMP\pfs-prt.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-prt.log"
	"%~dp0BAT\busybox" grep -i -e ".*\.VCD$" "%~dp0TMP\pfs-prt.log" | "%~dp0BAT\busybox" cut -c42-500 > "%~dp0TMP\%POPSPART%.txt"
	type "%~dp0TMP\%POPSPART%.txt"
	
"%~dp0BAT\Diagbox" gd 0e
echo\
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 07
setlocal DisableDelayedExpansion

echo\
echo Enter the full name including the .VCD
echo Example: MyGameName.VCD
"%~dp0BAT\Diagbox" gd 06
echo Respect upper and lower case
"%~dp0BAT\Diagbox" gd 07
echo.
set /p "RenamePS1Games=Enter the name of the game you want to rename:"
IF "%RenamePS1Games%"=="" (goto GamesManagement)

echo\
echo\
echo Enter the new name including the .VCD
echo Example: MyNewGameName.VCD
echo\
set /p "RenamePS1GamesNEW=Enter the new name of your game:"
IF "%RenamePS1GamesNEW%"=="" (goto GamesManagement)

"%~dp0BAT\Diagbox" gd 0e
cls
echo\
echo\
echo Game Selected "%RenamePS1Games%"
"%~dp0BAT\Diagbox" gd 0f
echo ----------------------------------------------------
echo\
"%~dp0BAT\Diagbox" gd 03

	echo        Renaming...
	echo        "%RenamePS1Games%"
	echo device %@hdl_path% > "%~dp0TMP\pfs-pops.txt"
	echo mount %POPSPART% >> "%~dp0TMP\pfs-pops.txt"
	echo rename "%RenamePS1Games%" "%RenamePS1GamesNEW%" >> "%~dp0TMP\pfs-pops.txt"
	echo umount >> "%~dp0TMP\pfs-pops.txt"
	echo exit >> "%~dp0TMP\pfs-pops.txt"
	del "%~dp0POPS\PFS-POPS-NEW.txt" >nul 2>&1
	type "%~dp0TMP\pfs-pops.txt" | "%~dp0BAT\pfsshell" >nul 2>&1
	echo        "%RenamePS1GamesNEW%"
    echo         Completed...
	cd "%~dp0"

endlocal
rmdir /Q/S "%~dp0TMP" >nul 2>&1
del info.sys >nul 2>&1

"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo Renaming Completed...
echo\
echo\
"%~dp0BAT\Diagbox" gd 0f

pause & (goto GamesManagement)

REM #######################################################################################################################################################################
:DeleteChoiceGamesHDD

cd "%~dp0"
cls

mkdir "%~dp0TMP" >nul 2>&1

"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo Choose what type of games you want to delete:
echo ----------------------------------------------------
echo         PS2 Games Not yet available, I recommend you to delete the game directly from OPL)
"%~dp0BAT\Diagbox" gd 0c
echo         2) %NO%
"%~dp0BAT\Diagbox" gd 0e
echo         3) Yes PS1 Games (Delete .VCD)
echo\
"%~dp0BAT\Diagbox" gd 07
CHOICE /C 123 /M "Select Option:"

IF ERRORLEVEL 3 (goto DeletePS1GamesHDD)
IF ERRORLEVEL 2 (goto GamesManagement)
IF ERRORLEVEL 1 (goto DeleteChoiceGamesHDD)

REM #######################################################################################################################################################################
:DeletePS1GamesHDD

cd "%~dp0"
cls

mkdir "%~dp0TMP" >nul 2>&1

"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo Scanning for Playstation 2 HDDs:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD"
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD" | "%~dp0BAT\busybox" cut -c2-6 > "%~dp0TMP\hdl-hdd.txt"
"%~dp0BAT\busybox" sed -i "s/hdd/\\\\.\\\PhysicalDrive/g; s/://g" "%~dp0TMP\hdl-hdd.txt"

set /P @hdl_path=<"%~dp0TMP\hdl-hdd.txt"
del "%~dp0TMP\hdl-hdd.txt" >nul 2>&1
IF "!@hdl_path!"=="" ( 
"%~dp0BAT\Diagbox" gd 0c
		echo         Playstation 2 HDD Not Detected
		echo         Drive Must Be Formatted First
		echo\
		echo\
"%~dp0BAT\Diagbox" gd 07
		rmdir /Q/S "%~dp0TMP" >nul 2>&1
		del info.sys >nul 2>&1	
		pause & (goto GamesManagement)
	)

"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo Remove .VCD:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) %YES%
"%~dp0BAT\Diagbox" gd 0c
echo         2) %NO%
"%~dp0BAT\Diagbox" gd 0e
echo         3) %YES% (Manually Choose your Partition)
echo\
"%~dp0BAT\Diagbox" gd 07
CHOICE /C 123 /M "Select Option:"

IF ERRORLEVEL 1 set @pfs_pop=yes & set POPSPART=__.POPS
IF ERRORLEVEL 2 set @pfs_pop=no
IF ERRORLEVEL 3 set @pfs_pop=yesmanually

IF %@pfs_pop%==yesmanually (
echo.
echo Choose the partition where your .VCDs to extract are located.
echo By default it will be the partition __.POPS 
echo.
echo 0.  __.POPS0
echo 1.  __.POPS1
echo 2.  __.POPS2
echo 3.  __.POPS3
echo 4.  __.POPS4
echo 5.  __.POPS5
echo 6.  __.POPS6
echo 7.  __.POPS7
echo 8.  __.POPS8
echo 9.  __.POPS9
echo 10. __.POPS
echo.

set choice=
set /p choice="Select Option:"
IF "!choice!"=="" (goto DeletePS1GamesHDD)

IF "!choice!"=="0" set POPSPART=__.POPS0
IF "!choice!"=="1" set POPSPART=__.POPS1
IF "!choice!"=="2" set POPSPART=__.POPS2
IF "!choice!"=="3" set POPSPART=__.POPS3
IF "!choice!"=="4" set POPSPART=__.POPS4
IF "!choice!"=="5" set POPSPART=__.POPS5
IF "!choice!"=="6" set POPSPART=__.POPS6
IF "!choice!"=="7" set POPSPART=__.POPS7
IF "!choice!"=="8" set POPSPART=__.POPS8
IF "!choice!"=="9" set POPSPART=__.POPS9
IF "!choice!"=="10" set POPSPART=__.POPS

)

"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo Detecting POPS Partition:
echo ----------------------------------------------------
    "%~dp0BAT\Diagbox" gd 07
    echo device !@hdl_path! > "%~dp0TMP\pfs-prt.txt"
    echo ls -l >> "%~dp0TMP\pfs-prt.txt"
    echo exit >> "%~dp0TMP\pfs-prt.txt"
    type "%~dp0TMP\pfs-prt.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-prt.log"
    "%~dp0BAT\busybox" cat "%~dp0TMP\pfs-prt.log" | "%~dp0BAT\busybox" grep -w "%POPSPART%" | "%~dp0BAT\busybox" sed "s/.*%POPSPART%/%POPSPART%/" | "%~dp0BAT\busybox" tr -d " " | "%~dp0BAT\busybox" head -1 | "%~dp0BAT\busybox" sed -e "s/@/\//g" > "%~dp0TMP\hdd-prt.txt"
    set /P @hdd_avl=<"%~dp0TMP\hdd-prt.txt"
    REM del "%~dp0TMP\pfs-prt.txt" "%~dp0TMP\pfs-prt.log" >nul 2>&1 "%~dp0TMP\hdd-prt.txt"

IF "!@hdd_avl!"=="%POPSPART%/" (
"%~dp0BAT\Diagbox" gd 0a
	echo        %POPSPART% - Partition Detected
	"%~dp0BAT\Diagbox" gd 07
	) else (
	"%~dp0BAT\Diagbox" gd 0c
	echo        %POPSPART% - Partition NOT Detected
	echo        Partition Must Be Formatted Or Created
	echo\
	echo\
	"%~dp0BAT\Diagbox" gd 07
	rmdir /Q/S "%~dp0TMP" >nul 2>&1
	del info.sys >nul 2>&1
	pause & (goto GamesManagement)
	)

echo\
echo\
pause
cls

"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo Scanning Games List in %POPSPART%:
echo ----------------------------------------------------
echo\
"%~dp0BAT\Diagbox" gd 07

    echo device !@hdl_path! > "%~dp0TMP\pfs-prt.txt"
	echo mount %POPSPART% >> "%~dp0TMP\pfs-prt.txt"
    echo ls -l >> "%~dp0TMP\pfs-prt.txt"
    echo exit >> "%~dp0TMP\pfs-prt.txt"
    type "%~dp0TMP\pfs-prt.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-prt.log"
	"%~dp0BAT\busybox" grep -i -e ".*\.VCD$" "%~dp0TMP\pfs-prt.log" | "%~dp0BAT\busybox" cut -c42-500 > "%~dp0TMP\%POPSPART%.txt"
	type "%~dp0TMP\%POPSPART%.txt"

"%~dp0BAT\Diagbox" gd 0e
echo\
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 07
setlocal DisableDelayedExpansion

echo\
echo Enter the full name including the .VCD
echo Example: MyGameToDelete.VCD
"%~dp0BAT\Diagbox" gd 06
echo Respect upper and lower case
"%~dp0BAT\Diagbox" gd 07
echo.
set /p "DeletePS1Games=Enter the name of the game you want to Delete:"
IF "%DeletePS1Games%"=="" (goto GamesManagement)

"%~dp0BAT\Diagbox" gd 0e
cls
echo\
echo\
echo Game Selected "%DeletePS1Games%"
"%~dp0BAT\Diagbox" gd 0f
echo ----------------------------------------------------
echo\
"%~dp0BAT\Diagbox" gd 03

	echo          Removing...
	echo device %@hdl_path% > "%~dp0TMP\pfs-pops.txt"
	echo mount %POPSPART% >> "%~dp0TMP\pfs-pops.txt"
	echo rm "%DeletePS1Games%" >> "%~dp0TMP\pfs-pops.txt"
	echo umount >> "%~dp0TMP\pfs-pops.txt"
	echo exit >> "%~dp0TMP\pfs-pops.txt"
	del "%~dp0POPS\PFS-POPS-NEW.txt" >nul 2>&1
	type "%~dp0TMP\pfs-pops.txt" | "%~dp0BAT\pfsshell" >nul 2>&1
    echo          Completed...
	cd "%~dp0"

rmdir /Q/S "%~dp0TMP" >nul 2>&1
del info.sys >nul 2>&1

"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo Removing Completed...
echo\
echo\
"%~dp0BAT\Diagbox" gd 0f

endlocal
pause & (goto GamesManagement)


REM ####################################################################################################################
:DownloadWideScreenCheat

cls 
mkdir "%~dp0TMP" >nul 2>&1

    REM "%~dp0BAT\busybox" sed -i "s/\\\\.\\\PhysicalDrive/hdd/g" "%~dp0TMP\hdl-hdd.txt"
    REM "%~dp0BAT\busybox" sed -i s/$/:/ "%~dp0TMP\hdl-hdd.txt"
    REM set /P @hdl_path1=<"%~dp0TMP\hdl-hdd.txt"
    REM "%~dp0BAT\hdl_dump" hdl_toc !@hdl_path1! > "%~dp0TMP\PARTITION_GAMES.txt"
    REM "%~dp0BAT\busybox" sed -i "1d" "%~dp0TMP\PARTITION_GAMES.txt"
    REM "%~dp0BAT\busybox" sed -i -e "$ d" "%~dp0TMP\PARTITION_GAMES.txt"
	REM 
	REM "%~dp0BAT\Diagbox" gd 0e
    REM echo %EXTRACTING_WIDE%

	REM cd /d "%~dp0CHT"
    REM if not exist %%i.cht (
	REM 
    REM "%~dp0BAT\7z.exe" x -bso0 "%~dp0BAT\PS2-OPL-CHT-Widescreen.zip" -o"%~dp0CHT\WIDE" %%i.cht -r -y
	REM move WIDE\CHT\%%i.cht "%~dp0CHT\%%i.cht" >nul 2>&1
	REM 
    REM )


REM for %%F in ( "%~dp0CHT\*.CHT" ) do if %%~zF==0 del "%%F"

cd /d "%~dp0CHT\"
if exist "%~dp0CHT\*.cht" (

REM Checking Mastercode...
for %%i in (*.cht) do (
REM "%~dp0BAT\busybox" grep "Mastercode" "%~dp0CHT\%%i" > "%~dp0TMP\MastercodeCheck.txt" 2>&1
"%~dp0BAT\busybox" sed -n "/Mastercode/,/ /p" "%~dp0CHT\%%i" > "%~dp0TMP\MastercodeCheck.txt" 2>&1
"%~dp0BAT\busybox" sed -i "1d" "%~dp0TMP\MastercodeCheck.txt"
"%~dp0BAT\busybox" sed -i "2,20d" "%~dp0TMP\MastercodeCheck.txt"
"%~dp0BAT\busybox" sed -i "s/\s*$//" "%~dp0TMP\MastercodeCheck.txt"
for %%F in ( "%~dp0TMP\MastercodeCheck.txt" ) do if %%~zF==0 del "%%F" >nul 2>&1

if errorlevel 1 (

echo %%i Mastercode not found: Files Ignored
ren %%i %%iIGNORED

) else (
echo %%i found > nul
    )
  )
)

cd /d "%~dp0"
if not exist "%~dp0CHT\*.cht" (
"%~dp0BAT\Diagbox" gd 06
echo\
echo NO .CHT FOUND IN CHT FOLDER 
echo\
"%~dp0BAT\Diagbox" gd 07
echo You need to Create your .CHT with the Mastercode inside.
echo Or extract the .CHT present in your partition +OPL
echo\
echo\
echo Do You want Create .CHT with Mastercode ?
choice /c YN

if errorlevel 2 (goto DownloadCheatsMenu)
if errorlevel 1 copy "%~dp0BAT\make_cheat_mastercode.bat" >nul "%~dp0" & call make_cheat_mastercode.bat & del make_cheat_mastercode.bat
 "%~dp0BAT\Diagbox" gd 0f
echo --------------------------------------------------------------------------
)
if exist "%~dp0TMP\ISONotFound.txt" (

echo not found >nul 

) else (

mkdir "%~dp0TMP" >nul 2>&1

echo.
echo Download Latest WideScreen Cheat Database ?
echo NOTE: if you choose No, it will do an offline installation.
choice /c YN 

if errorlevel 1 set DownloadDB=yes
if errorlevel 2 set DownloadDB=no

    IF "!DownloadDB!"=="yes" (
	echo\
    echo Checking internet connection...
	echo\
	Ping www.github.com -n 1 -w 1000 >nul
	
	if errorlevel 1 (
    "%~dp0BAT\Diagbox" gd 0c
    echo.
	echo Unable to connect to internet Or Website
	echo\
	echo You will switch to offline mode
	echo\
	set DownloadDB=no
	"%~dp0BAT\Diagbox" gd 0f
	pause
	
    ) else (
	
	"%~dp0BAT\Diagbox" gd 0d
    "%~dp0BAT\wget" -q --show-progress https://github.com/PS2-Widescreen/OPL-Widescreen-Cheats/releases/download/Latest/widescreen_hacks.zip -O BAT\PS2-OPL-CHT-Widescreen.zip
    "%~dp0BAT\Diagbox" gd 0f
	set DownloadDB=no
	)
)

IF "!DownloadDB!"=="no" (

    echo\
	cd /d "%~dp0CHT"
	for %%i in (*.cht) do (
	set gameidcht=%%~ni

	if not exist "%~dp0CHT\WIDE" MD "%~dp0CHT\WIDE" & if not exist "%~dp0CHT\WIDE\CHT" MD "%~dp0CHT\WIDE\CHT"
	if not exist "%~dp0CHT\WIDE2" MD "%~dp0CHT\WIDE2"
	
	"%~dp0BAT\7z.exe" x -bso0 "%~dp0BAT\PS2-OPL-CHT-Widescreen.zip" -o"%~dp0CHT\WIDE" !gameidcht!.cht -r -y
	move WIDE\CHT\!gameidcht!.cht "%~dp0CHT\!gameidcht!.chtWIDE" >nul 2>&1
	
	"%~dp0BAT\7z.exe" x -bso0 "%~dp0BAT\PS2-OPL-CHT-Widescreen.zip" -o"%~dp0CHT\WIDE" !gameidcht!_v?.??.cht -r -y
	cd /d "%~dp0CHT\WIDE\CHT" >nul 2>&1 & ren !gameidcht!_v?.??.cht !gameidcht!.chtWIDE2 >nul 2>&1 & move *.chtWIDE2 "%~dp0CHT\WIDE2" >nul 2>&1

	cd /d "%~dp0CHT" & rmdir /Q/S "%~dp0CHT\WIDE\" >nul 2>&1

)

For %%C in (*.cht) do (
"%~dp0BAT\busybox" sed -n "/Mastercode/,/ /p" "%~dp0CHT\%%C" > "%~dp0TMP\Mastercode.txt"
"%~dp0BAT\busybox" sed -i "1d" "%~dp0TMP\Mastercode.txt"
"%~dp0BAT\busybox" sed -i "2,20d" "%~dp0TMP\Mastercode.txt"
"%~dp0BAT\busybox" sed -i "s/\s*$//" "%~dp0TMP\Mastercode.txt"
set /p Mastercode=<"%~dp0TMP\Mastercode.txt"

REM Check if widescreen is already installe
echo Widescreen-Fix-Installed-with-PFS-BatchKit-Manager > "%~dp0TMP\checkcheat.txt"
"%~dp0BAT\busybox" sed -i "s/\s*$//" "%~dp0TMP\checkcheat.txt"
set /p checkcheat=<"%~dp0TMP\checkcheat.txt"
"%~dp0BAT\busybox" sed -i "/----Widescreen-Fix-DONT-TOUCH-THIS-LINE----/{N;s/\n$//}" "%~dp0CHT\%%C"
REM "%~dp0BAT\busybox" sed -i "/----Widescreen-Fix-DONT-TOUCH-THIS-LINE----/{n;d}" "%~dp0CHT\%%C"
"%~dp0BAT\busybox" sed -i -e "/!checkcheat!/,/----Widescreen-Fix-DONT-TOUCH-THIS-LINE----/d" "%~dp0CHT\%%C"

"%~dp0BAT\busybox" sed -n "/Mastercode/,/ /p" "%~dp0CHT\%%CWIDE" > "%~dp0TMP\MastercodeCheck.txt" 2>&1
"%~dp0BAT\busybox" sed -i "1d" "%~dp0TMP\MastercodeCheck.txt"
"%~dp0BAT\busybox" sed -i "2,20d" "%~dp0TMP\MastercodeCheck.txt"
"%~dp0BAT\busybox" sed -i "s/\s*$//" "%~dp0TMP\MastercodeCheck.txt"
set /p MastercodeCheck=<"%~dp0TMP\MastercodeCheck.txt"

findstr "!checkcheat!" %%C >nul

if errorlevel 1 (

if !Mastercode! equ !MastercodeCheck! (

 "%~dp0BAT\busybox" sed -i -e :a -e "/^\n*$/{$d;N;ba" -e "}" "%~dp0CHT\%%CWIDE"
 "%~dp0BAT\busybox" grep -s -A 9999 "//" "%~dp0CHT\%%CWIDE" > "%~dp0TMP\Cheatstmp.txt"
 "%~dp0BAT\busybox" sed -i -e "/Mastercode/,+1d" "%~dp0TMP\Cheatstmp.txt"
  REM "%~dp0BAT\busybox" sed -i "${/^$/d}" "%~dp0TMP\Cheatstmp.txt"
 "%~dp0BAT\busybox" sed -i -e "$a//----Widescreen-Fix-DONT-TOUCH-THIS-LINE----" "%~dp0TMP\Cheatstmp.txt"
 "%~dp0BAT\busybox" sed -i "1i //Widescreen-Fix-Installed-with-PFS-BatchKit-Manager" "%~dp0TMP\Cheatstmp.txt"
 "%~dp0BAT\busybox" sed -i "s/\s*$//" "%~dp0TMP\Cheatstmp.txt"
 "%~dp0BAT\busybox" sed -i "${/^$/d}" %%C
 "%~dp0BAT\busybox" sed -i -e "$a" %%C
 "%~dp0BAT\busybox" cat "%~dp0TMP\Cheatstmp.txt" >> %%C
 ) else (

move %%C "%~dp0CHT\WIDE2" >nul 2>&1

"%~dp0BAT\busybox" sed -n "/Mastercode/,/ /p" "%~dp0CHT\WIDE2\%%CWIDE2" > "%~dp0TMP\MastercodeCheck2.txt" 2>&1
"%~dp0BAT\busybox" sed -i "1d" "%~dp0TMP\MastercodeCheck2.txt"
"%~dp0BAT\busybox" sed -i "2,20d" "%~dp0TMP\MastercodeCheck2.txt"
"%~dp0BAT\busybox" sed -i "s/\s*$//" "%~dp0TMP\MastercodeCheck2.txt"
set /p MastercodeCheck2=<"%~dp0TMP\MastercodeCheck2.txt"

if !Mastercode! equ !MastercodeCheck2! (

 "%~dp0BAT\busybox" sed -i -e :a -e "/^\n*$/{$d;N;ba" -e "}" "%~dp0CHT\WIDE2\%%CWIDE2"
 "%~dp0BAT\busybox" grep -s -A 9999 "//" "%~dp0CHT\WIDE2\%%CWIDE2" > "%~dp0TMP\Cheatstmp.txt"
 "%~dp0BAT\busybox" sed -i -e "/Mastercode/,+1d" "%~dp0TMP\Cheatstmp.txt"
 REM "%~dp0BAT\busybox" sed -i "${/^$/d}" "%~dp0TMP\Cheatstmp.txt"
 "%~dp0BAT\busybox" sed -i -e "$a//----Widescreen-Fix-DONT-TOUCH-THIS-LINE----" "%~dp0TMP\Cheatstmp.txt"
 "%~dp0BAT\busybox" sed -i "1i //Widescreen-Fix-Installed-with-PFS-BatchKit-Manager" "%~dp0TMP\Cheatstmp.txt"
 "%~dp0BAT\busybox" sed -i "s/\s*$//" "%~dp0TMP\Cheatstmp.txt"
 "%~dp0BAT\busybox" sed -i "${/^$/d}" "%~dp0CHT\WIDE2\%%C"
 "%~dp0BAT\busybox" sed -i -e "$a" "%~dp0CHT\WIDE2\%%C"
 "%~dp0BAT\busybox" cat "%~dp0TMP\Cheatstmp.txt" >> "%~dp0CHT\WIDE2\%%C"
     )
   )
 )
 
 move "%~dp0CHT\WIDE2\*.cht" "%~dp0CHT" >nul 2>&1
 findstr "!checkcheat!" %%C >nul
 if errorlevel 1 (
 "%~dp0BAT\Diagbox" gd 06
 echo %%C No WideScreen cheats are available for this game.
 "%~dp0BAT\Diagbox" gd 0f
 ) else ( 
 echo %%C WideScreen cheats has been created.

      )
     )
    )
   )
  )

echo\

del *.chtWIDE >nul 2>&1
ren *.chtIGNORED *.cht >nul 2>&1
rmdir /Q/S "%~dp0CHT\WIDE2" >nul 2>&1
rmdir /Q/S "%~dp0TMP" >nul 2>&1

REM To remove blank lines from the begin of a file:
REM sed -i '/./,$!d' filename

REM To remove blank lines from the end of a file:
REM sed -i -e :a -e '/^\n*$/{$d;N;ba' -e '}' file

REM To remove blank lines from begin and end of a file:
REM sed -i -e '/./,$!d' -e :a -e '/^\n*$/{$d;N;ba' -e '}' file
echo\
pause & (goto DownloadCheatsMenu)

REM ####################################################################################################################
:TransferPS1GamesHDDOSD
endlocal
endlocal

mkdir "%~dp0TMP" >nul 2>&1
setlocal DisableDelayedExpansion

copy "%~dp0POPS-Binaries\POPSTARTER.KELF" "%~dp0TMP" >nul 2>&1
copy "%~dp0BAT\hdl_dump.exe" "%~dp0TMP" >nul 2>&1

copy "%~dp0BAT\DB\gameidPS1.txt" "%~dp0TMP\gameid.txt" >nul 2>&1
"%~dp0BAT\busybox" sed -i "s/\&/\\\&/g" "%~dp0TMP\gameid.txt"
"%~dp0BAT\busybox" sed -i "s/\^!/\!/g" "%~dp0TMP\gameid.txt" >nul 2>&1
"%~dp0BAT\busybox" sed -i "s.//.\\/\\/.g" "%~dp0TMP\gameid.txt"

cd /d "%~dp0TMP"

setlocal EnableDelayedExpansion
cls
"%~dp0BAT\Diagbox" gd 0e
echo\
echo\
echo Scanning for Playstation 2 HDDs:
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 03
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD"
"%~dp0BAT\hdl_dump" query | findstr "hdd" | "%~dp0BAT\busybox" grep "Playstation 2 HDD" | "%~dp0BAT\busybox" cut -c2-6 > "%~dp0TMP\hdl-hdd.txt" & type "%~dp0TMP\hdl-hdd.txt" > "%~dp0TMP\hdl-hdd2.txt"
"%~dp0BAT\busybox" sed -i "s/hdd/\\\\.\\\PhysicalDrive/g; s/://g" "%~dp0TMP\hdl-hdd.txt" >nul 2>&1

set /P @hdl_path2=<"%~dp0TMP\hdl-hdd2.txt"
set /P @hdl_path=<"%~dp0TMP\hdl-hdd.txt"
del "%~dp0TMP\hdl-hdd.txt" >nul 2>&1
IF "!@hdl_path!"=="" (
"%~dp0BAT\Diagbox" gd 0c
		echo         Playstation 2 HDD Not Detected
		echo         Drive Must Be Formatted First
		echo\
		echo\
"%~dp0BAT\Diagbox" gd 07
		rmdir /Q/S "%~dp0TMP" >nul 2>&1
		del info.sys >nul 2>&1
        pause & (goto HDDOSDPartManagement)
	)

"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo Make sure your Multi-Discs have the (Disc #) Example:
echo\
echo Gran Turismo 2 (Disc 1) (Arcade Mode).VCD
echo Gran Turismo 2 (Disc 2) (Gran Turismo Mode).VCD
echo\
echo Install .VCD as partition for HDD-OSD
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo         1) Yes (Install each Multi-Disc as a single partition)
"%~dp0BAT\Diagbox" gd 0c
echo         2) No
"%~dp0BAT\Diagbox" gd 0e
echo         3) Yes (Install each Multi-Disc in the same partition as (Disc 1) )
"%~dp0BAT\Diagbox" gd 0f
echo\
CHOICE /C 123 /M "Select Option:"

IF ERRORLEVEL 1 set @pfs_POPShddosd=yes
IF ERRORLEVEL 3 (goto TransferPS1GamesMultiDiscHDDOSD)
IF ERRORLEVEL 2 (goto HDDOSDPartManagement)


    echo\
	echo Checking internet connection...
	"%~dp0BAT\wget" -q --show-progress "https://ia801402.us.archive.org/view_archive.php?archive=/16/items/hdd-osd-icons-pack/HDD-OSD-Icons-Pack.zip&file=PS1%%2FSCES_000.01%%2FPreview.png" -O "%~dp0TMP\Preview.png" >nul 2>&1
	for %%F in ( "Preview.png" ) do if %%~zF==0 del "%%F"
	set DownloadARTPS1HDDOSD=yes
	
	if not exist Preview.png (
    "%~dp0BAT\Diagbox" gd 0c
    echo.
	echo Unable to connect to internet Or Website
	echo\
	echo You will switch to offline mode
	echo\
	set "DownloadARTPS1HDDOSD="
	"%~dp0BAT\Diagbox" gd 0f
	pause
	 )

    cls
    cd /d "%~dp0POPS"
    for %%V in (*.VCD) do (
    
    setlocal disabledelayedexpansion
    dir | "%~dp0BAT\busybox" grep -i -e ".*\.VCD$" | "%~dp0BAT\busybox" cut -c37-999 | "%~dp0BAT\busybox" sed -e "s/^/\"/g; s/\r*$/\"/" > "%~dp0POPS\Disc0.txt"
    
    for /f "tokens=*" %%# in (Disc0.txt) do (
    if not exist "Temp/%%~n#" md "Temp/%%~n#"
    move %%# "Temp/%%~n#" >nul 2>&1
      )
    )
    del "%~dp0POPS\Disc0.txt"
    
    cd /d "%~dp0POPS\temp" & for /f "delims=" %%a in ('dir /ad /b') do (
    set appfolder=%%a
    
    set "filename="
    cd /d "%~dp0POPS\temp\%%a" & for %%V in (*.VCD) do set filename=%%V & cd /d "%~dp0POPS\temp"
    echo\
    
    setlocal EnableDelayedExpansion

REM echo "!appfolder!"

REM Get Size (Disc 0)
set "Disc0Size="
cd /d "%~dp0POPS\temp\!appfolder!" & for %%s in (*.VCD) do echo %%~zs | "%~dp0BAT\busybox" sed "s/\s*$//g" > "%~dp0POPS\Temp\!appfolder!\Disc0Size.txt"
REM "%~dp0BAT\busybox" sed -i -r "/^.{,8}$/d" Disc0Size.txt >nul 2>&1
REM "%~dp0BAT\busybox" sed -i "/^.\{9\}./d" Disc0Size.txt >nul 2>&1
for %%x in (*.VCD) do if %%~zx GTR 1920000000 set SIZEMBD0=0

if !SIZEMBD0!==0 (
"%~dp0BAT\Diagbox" gd 0c
    echo.
	echo !filename! Files Exceeds size limit: 2GB Maximum per Files
	echo.
	move "%~dp0POPS\Temp\!appfolder!\*.VCD" "%~dp0POPS" >nul 2>&1
"%~dp0BAT\Diagbox" gd 0f
	) else (
	echo good >nul 2>&1

if exist "%~dp0POPS\temp\!appfolder!\Disc0Size.txt" for /f %%0 in (Disc0Size.txt) do (
if %%0 GTR 1000000 set SIZEMBD0=128
if %%0 GTR 128000000 set SIZEMBD0=256
if %%0 GTR 256000000 set SIZEMBD0=384
if %%0 GTR 384000000 set SIZEMBD0=512
if %%0 GTR 512000000 set SIZEMBD0=640
if %%0 GTR 640000000 set SIZEMBD0=768
if %%0 GTR 768000000 set SIZEMBD0=896
)
if not exist "%~dp0POPS\temp\!appfolder!\Disc0Size.txt" set SIZEMBD0=0

SET /A Result = !SIZEMBD0!

REM echo !Result!

REM Special Thanks To Matias Israelson (AKA:El_isra) for POPS-VCD-ID-Extractor
"%~dp0BAT\POPS-VCD-ID-Extractor" "%~dp0POPS\temp\!appfolder!\!filename!" > "%~dp0TMP\VCDID.txt"
set /P ID=<"%~dp0TMP\VCDID.txt" 

dir "%~dp0POPS\temp\!appfolder!\" > "%~dp0TMP\tmpfiles.txt"

"%~dp0BAT\busybox" grep -i -e ".*\.VCD$" "%~dp0TMP\tmpfiles.txt" | "%~dp0BAT\busybox" cut -c37-999 > "%~dp0TMP\Name.txt" & "%~dp0BAT\busybox" sed -i "s/!ID!.//g" "%~dp0TMP\Name.txt"
"%~dp0BAT\busybox" paste -d " " "%~dp0TMP\VCDID.txt" "%~dp0TMP\Name.txt" > "%~dp0TMP\VCDIDNameTMP.txt"
"%~dp0BAT\busybox" sed -i "2,6d" "%~dp0TMP\VCDIDNameTMP.txt"
"%~dp0BAT\busybox" sed "s/.\{12\}/&/" "%~dp0TMP\VCDIDNameTMP.txt" > "%~dp0POPS\Temp\!appfolder!\VCDIDName.txt"

REM Get (Disc 0) FName
dir | "%~dp0BAT\busybox" grep -i -e ".*\.VCD$" | "%~dp0BAT\busybox" cut -c37-999 > "%~dp0TMP\VCD0.txt"
if exist "%~dp0TMP\VCD0.txt" set /P FNameDISC0=<"%~dp0TMP\VCD0.txt"

for /f "tokens=1*" %%F in (VCDIDName.txt) do (

REM echo %%G.VCD

 	set "PPtitle="
 	for /f "tokens=1*" %%A in ( 'findstr %%F "%~dp0TMP\gameid.txt"' ) do (if not defined PPtitle set PPtitle=%%B
     )

if not defined PPtitle set PPtitle=%%~nG
echo !PPtitle! | "%~dp0BAT\busybox" iconv -f utf8 -t ascii//TRANSLIT//IGNORE | "%~dp0BAT\busybox" sed -e "s/-/_/g; s/\./_/g" | "%~dp0BAT\busybox" sed -e "s/^/PP.%%F.POPS./" | "%~dp0BAT\busybox" cut -c0-32 > "%~dp0POPS\Temp\!appfolder!\PPName.txt"
"%~dp0BAT\busybox" sed -r -i "s/^(.{11})(.{1})/\1/" "%~dp0POPS\Temp\!appfolder!\PPName.txt"
"%~dp0BAT\busybox" sed -i "s/.\{8\}/&-/" "%~dp0POPS\Temp\!appfolder!\PPName.txt"

"%~dp0BAT\busybox" sed -i "s/\s*$//" "%~dp0POPS\Temp\!appfolder!\PPName.txt"
"%~dp0BAT\busybox" sed -i "s/ /_/g" "%~dp0POPS\Temp\!appfolder!\PPName.txt"
"%~dp0BAT\busybox" sed -i "s/'/_/g" "%~dp0POPS\Temp\!appfolder!\PPName.txt"
"%~dp0BAT\busybox" sed -i "s/\&/_/g" "%~dp0POPS\Temp\!appfolder!\PPName.txt"
"%~dp0BAT\busybox" sed -i "s/%%/_/g" "%~dp0POPS\Temp\!appfolder!\PPName.txt"
"%~dp0BAT\busybox" sed -i "s/\"//g" "%~dp0POPS\Temp\!appfolder!\PPName.txt"
"%~dp0BAT\busybox" sed -i "s/\[//g; s/\]//g" "%~dp0POPS\Temp\!appfolder!\PPName.txt"
"%~dp0BAT\busybox" sed -i "s/(//g; s/)//g" "%~dp0POPS\Temp\!appfolder!\PPName.txt"
"%~dp0BAT\busybox" sed -i "y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/" "%~dp0POPS\Temp\!appfolder!\PPName.txt"
"%~dp0BAT\busybox" sed -i "s/\(.\{7\}\)./\1/" "%~dp0POPS\Temp\!appfolder!\PPName.txt"
REM "%~dp0BAT\busybox" sed -i "s/.\{7\}/&-/" "%~dp0POPS\Temp\!appfolder!\PPName.txt"
REM "%~dp0BAT\busybox" sed -i "s/.\{12\}/&-/" "%~dp0POPS\Temp\!appfolder!\PPName.txt"
REM "%~dp0BAT\busybox" sed -i "s/.\{16\}/&./" "%~dp0POPS\Temp\!appfolder!\PPName.txt"
set /P PPName=<"%~dp0POPS\Temp\!appfolder!\PPName.txt"

REM echo !PPName!

move "%~dp0TMP\POPSTARTER.KELF" "%~dp0POPS\Temp\!appfolder!\EXECUTE.KELF" >nul 2>&1
move "%~dp0TMP\hdl_dump.exe" "%~dp0POPS\Temp\!appfolder!\" >nul 2>&1

REM PAUSE
echo\
echo\
echo Creating Partition:
echo ----------------------------------------------------
echo\

    echo        Creating partitions...
    echo device %@hdl_path% > "%~dp0TMP\pfs-log.txt"
 	echo mkpart "!PPName!" !Result!M >> "%~dp0TMP\pfs-log.txt"
   	echo exit >> "%~dp0TMP\pfs-log.txt"
 	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
 	del "%~dp0TMP\pfs-log.txt" >nul 2>&1

 	echo        Installing %%G... 
    echo device %@hdl_path% > "%~dp0TMP\pfs-log.txt"
 	echo mount "!PPName!" >> "%~dp0TMP\pfs-log.txt"
	echo put "!FNameDISC0!" >> "%~dp0TMP\pfs-log.txt"
	echo rename "!FNameDISC0!" IMAGE0.VCD >> "%~dp0TMP\pfs-log.txt"
	echo put "EXECUTE.KELF" >> "%~dp0TMP\pfs-log.txt"
 	echo umount >> "%~dp0TMP\pfs-log.txt"
   	echo exit >> "%~dp0TMP\pfs-log.txt"
 	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
 	del "%~dp0TMP\pfs-log.txt" >nul 2>&1
 	
	"%~dp0BAT\7z.exe" x -bso0 "%~dp0BAT\HDD-OSD_SAMPLE_HEADER.zip" -o"%~dp0POPS\Temp\!appfolder!" -r -y
	
	if defined DownloadARTPS1HDDOSD (
	md PS1 >nul 2>&1
	"%~dp0BAT\Diagbox" gd 03
	"%~dp0BAT\wget" -q "https://ia801402.us.archive.org/view_archive.php?archive=/16/items/hdd-osd-icons-pack/HDD-OSD-Icons-Pack.zip&file=PS1%%2F%%F%%2Ficon.sys" -O "%~dp0POPS\Temp\!appfolder!\PS1\icon.sys" >nul & for %%x in ( "%~dp0POPS\Temp\!appfolder!\PS1\icon.sys" ) do if %%~zx==0 del %%x
	"%~dp0BAT\wget" -q "https://ia801402.us.archive.org/view_archive.php?archive=/16/items/hdd-osd-icons-pack/HDD-OSD-Icons-Pack.zip&file=PS1%%2F%%F%%2Flist.ico" -O "%~dp0POPS\Temp\!appfolder!\PS1\list.ico" >nul & for %%x in ( "%~dp0POPS\Temp\!appfolder!\PS1\list.ico" ) do if %%~zx==0 del %%x
    "%~dp0BAT\wget" -q "https://ia801402.us.archive.org/view_archive.php?archive=/16/items/hdd-osd-icons-pack/HDD-OSD-Icons-Pack.zip&file=PS1%%2F%%F%%2Fdel.ico" -O "%~dp0POPS\Temp\!appfolder!\PS1\del.ico" >nul & for %%x in ( "%~dp0POPS\Temp\!appfolder!\PS1\del.ico" ) do if %%~zx==0 del %%x
	"%~dp0BAT\wget" -q "https://ia801402.us.archive.org/view_archive.php?archive=/16/items/hdd-osd-icons-pack/HDD-OSD-Icons-Pack.zip&file=PS1%%2F%%F%%2FPreview.png" -O "%~dp0POPS\Temp\!appfolder!\PS1\Preview.png" >nul & for %%x in ( "%~dp0POPS\Temp\!appfolder!\PS1\Preview.png" ) do if %%~zx==0 del %%x
    "%~dp0BAT\Diagbox" gd 0f
	move "%~dp0POPS\Temp\!appfolder!\PS1\*" "%~dp0POPS\Temp\!appfolder!\" >nul 2>&1
	)	
	
	if not defined DownloadARTPS1HDDOSD (
	"%~dp0BAT\7z.exe" x -bso0 "%~dp0BAT\HDD-OSD-Icons-Pack.zip" -o"%~dp0POPS\Temp\!appfolder!" PS1\%%F\ -r -y & move "%~dp0POPS\Temp\!appfolder!\PS1\%%F\*" "%~dp0POPS\Temp\!appfolder!\" >nul 2>&1
	)
	
	setlocal DisableDelayedExpansion
	"%~dp0BAT\busybox" sed -i -e "s/title0=APPNAME/title0=%%~nG/" "%~dp0POPS\Temp\%%a\icon.sys"
	"%~dp0BAT\busybox" sed -i -e "s/title1=APPNAME2/title1=%%F/" "%~dp0POPS\Temp\%%a\icon.sys"
	setlocal EnableDelayedExpansion
	
 	set "dbtitle="
 	for /f "tokens=1*" %%A in ( 'findstr %%F "%~dp0TMP\gameid.txt"' ) do (if not defined dbtitle set dbtitle=%%B
    "%~dp0BAT\busybox" sed -i -e "s/title0=.*/title0=/g; s/title0=/title0=!dbtitle!/g" "%~dp0POPS\Temp\!appfolder!\icon.sys"
 	"%~dp0BAT\busybox" sed -i -e "s/title1=.*/title1=/g; s/title1=/title1=%%F/g" "%~dp0POPS\Temp\!appfolder!\icon.sys"
     )
	 
	hdl_dump modify_header %@hdl_path2% "!PPName!" >nul 2>&1
	echo        Completed...
	
	move "%~dp0POPS\Temp\!appfolder!\EXECUTE.KELF" "%~dp0TMP\POPSTARTER.KELF" >nul 2>&1
	move "%~dp0POPS\Temp\!appfolder!\hdl_dump.exe" "%~dp0TMP" >nul 2>&1
    move "%~dp0POPS\Temp\!appfolder!\*.VCD" "%~dp0POPS" >nul 2>&1
    rmdir /Q/S "%~dp0POPS\Temp\!appfolder!" >nul 2>&1
	  )
     )
   endlocal
  endlocal
 endlocal 
 )

cd /d "%~dp0" & rmdir /Q/S "%~dp0POPS\Temp" >nul 2>&1
rmdir /Q/S "%~dp0TMP" >nul 2>&1

"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo Completed...
echo\
echo\
"%~dp0BAT\Diagbox" gd 07

pause & (goto HDDOSDPartManagement)

:TransferPS1GamesMultiDiscHDDOSD

    echo\
	echo Checking internet connection...
	"%~dp0BAT\wget" -q --show-progress "https://ia801402.us.archive.org/view_archive.php?archive=/16/items/hdd-osd-icons-pack/HDD-OSD-Icons-Pack.zip&file=PS1%%2FSCES_000.01%%2FPreview.png" -O "%~dp0TMP\Preview.png" >nul 2>&1
	for %%F in ( "Preview.png" ) do if %%~zF==0 del "%%F"
	set DownloadARTPS1HDDOSD=yes
	
	if not exist Preview.png (
    "%~dp0BAT\Diagbox" gd 0c
    echo.
	echo Unable to connect to internet Or Website
	echo\
	echo You will switch to offline mode
	echo\
	set "DownloadARTPS1HDDOSD="
	"%~dp0BAT\Diagbox" gd 0f
	pause
	)

    setlocal disabledelayedexpansion
    cls
    cd /d "%~dp0POPS"
    
	REM Scan Disc0
    dir | "%~dp0BAT\busybox" grep -i -e ".*\.VCD$" | "%~dp0BAT\busybox" cut -c37-999 | "%~dp0BAT\busybox" sed -e "/(Disc [1-6])/d" | "%~dp0BAT\busybox" sed -e "s/^/\"/g; s/\r*$/\"/" > "%~dp0POPS\Disc0.txt"
	
	for %%x in ( "Disc0.txt" ) do if %%~zx==0 set NODISC0=NO
    if not defined NODISC0 (
    for /f "tokens=*" %%# in (Disc0.txt) do (
    if not exist "Temp/%%~n#" md "Temp/%%~n#"
    move %%# "Temp/%%~n#" >nul 2>&1
	 )
	)

   REM Scan Disc 1,2,3,4
   dir | "%~dp0BAT\busybox" grep -i -e ".*\.VCD$" | "%~dp0BAT\busybox" grep -i -e "(Disc 1)" | "%~dp0BAT\busybox" cut -c37-999 | "%~dp0BAT\busybox" sed -e "s/^/\"/g; s/\r*$/\"/" > "%~dp0POPS\Disc1.txt"
   dir | "%~dp0BAT\busybox" grep -i -e ".*\.VCD$" | "%~dp0BAT\busybox" grep -i -e "(Disc 2)" | "%~dp0BAT\busybox" cut -c37-999 | "%~dp0BAT\busybox" sed -e "s/^/\"/g; s/\r*$/\"/" > "%~dp0POPS\Disc2.txt"
   dir | "%~dp0BAT\busybox" grep -i -e ".*\.VCD$" | "%~dp0BAT\busybox" grep -i -e "(Disc 3)" | "%~dp0BAT\busybox" cut -c37-999 | "%~dp0BAT\busybox" sed -e "s/^/\"/g; s/\r*$/\"/" > "%~dp0POPS\Disc3.txt"
   dir | "%~dp0BAT\busybox" grep -i -e ".*\.VCD$" | "%~dp0BAT\busybox" grep -i -e "(Disc 4)" | "%~dp0BAT\busybox" cut -c37-999 | "%~dp0BAT\busybox" sed -e "s/^/\"/g; s/\r*$/\"/" > "%~dp0POPS\Disc4.txt"

   for %%x in ( "Disc1.txt" ) do if %%~zx==0 set NODISC1=NO
   if not defined NODISC1 (
   for /f "tokens=*" %%# in (Disc1.txt) do (
   if not exist "Temp/%%~n#" md "Temp/%%~n#"
   move %%# "Temp/%%~n#" >nul 2>&1
   )

   "%~dp0BAT\busybox" sed -i "s/\"//g" "%~dp0POPS\Disc1.txt"
   "%~dp0BAT\busybox" sed -i "s/^/temp\//g" "%~dp0POPS\Disc1.txt"
   "%~dp0BAT\busybox" sed -i "s/^/\"/g; s/\r*$/\"/" "%~dp0POPS\Disc1.txt"
   "%~dp0BAT\busybox" sed -i "s/.VCD//g" "%~dp0POPS\Disc1.txt"
   
   "%~dp0BAT\busybox" sed -i "s/^/move /g" "%~dp0POPS\Disc2.txt"
   "%~dp0BAT\busybox" paste -d " " "%~dp0POPS\Disc2.txt" "%~dp0POPS\Disc1.txt" > "%~dp0POPS\Disc2.BAT"
   call Disc2.BAT >nul 2>&1
   
   "%~dp0BAT\busybox" sed -i "s/^/move /g" "%~dp0POPS\Disc3.txt"
   "%~dp0BAT\busybox" paste -d " " "%~dp0POPS\Disc3.txt" "%~dp0POPS\Disc1.txt" > "%~dp0POPS\Disc3.BAT"
   call Disc3.BAT >nul 2>&1
   
   "%~dp0BAT\busybox" sed -i "s/^/move /g" "%~dp0POPS\Disc4.txt"
   "%~dp0BAT\busybox" paste -d " " "%~dp0POPS\Disc4.txt" "%~dp0POPS\Disc1.txt" > "%~dp0POPS\Disc4.BAT"
   call Disc4.BAT >nul 2>&1
   
   )

   del Disc?.???
   
   cd /d "%~dp0POPS\temp" & for /f "delims=" %%a in ('dir /ad /b') do (
   set appfolder=%%a
   set "filename="
   cd /d "%~dp0POPS\temp\%%a" & for %%V in (*.VCD) do set filename=%%V & cd /d "%~dp0POPS\temp"
   echo\
    
setlocal EnableDelayedExpansion

REM echo "!appfolder!"

REM Get Size + Name (Disc 0)
set "Disc0Size="
set "Disc0="
set "SIZEMBD0="
dir "%~dp0POPS\temp\!appfolder!" | "%~dp0BAT\busybox" grep -s -i -e ".*\.VCD$" | "%~dp0BAT\busybox" sed -e "/(Disc [1-6])/d" |  "%~dp0BAT\busybox" cut -c37-999 > "%~dp0POPS\temp\!appfolder!\Disc0.txt" & cd /d "%~dp0POPS\temp\!appfolder!" & for %%x in (Disc0.txt) do if %%~zx==0 del %%x & cd /d "%~dp0POPS\temp\"
if exist "%~dp0POPS\temp\!appfolder!\Disc0.txt" set /P Disc0=<"%~dp0POPS\temp\!appfolder!\Disc0.txt"
if defined Disc0 cd /d "%~dp0POPS\temp\!appfolder!" & for %%s in ("!Disc0!") do ( echo %%~zs | "%~dp0BAT\busybox" sed "s/\s*$//g" > Disc0Size.txt )

REM "%~dp0BAT\busybox" sed -i "/^.\{9\}./d" Disc0Size.txt >nul 2>&1
for %%x in ("!Disc0!") do if %%~zx GTR 1920000000 set SIZEMBD0=0

if !SIZEMBD0!==0 (
"%~dp0BAT\Diagbox" gd 0c
    echo.
	echo !Disc0! Files Exceeds size limit
	echo.
	move "%~dp0POPS\Temp\!appfolder!\*.VCD" "%~dp0POPS" >nul 2>&1
	cd /d "%~dp0POPS\temp"
"%~dp0BAT\Diagbox" gd 0f
	) else (
	echo good >nul 2>&1

REM Get Size + Name (Disc 1)
set "Disc1Size="
set "Disc1="
set "SIZEMBD1="
dir "%~dp0POPS\temp\!appfolder!" | "%~dp0BAT\busybox" grep -e "(Disc 1)" | "%~dp0BAT\busybox" sed -e "1d" | "%~dp0BAT\busybox" cut -c37-999 > "%~dp0POPS\temp\!appfolder!\Disc1.txt" & cd /d "%~dp0POPS\temp\!appfolder!" & for %%x in (Disc1.txt) do if %%~zx==0 del %%x & cd /d "%~dp0POPS\temp\"
if exist "%~dp0POPS\temp\!appfolder!\Disc1.txt" set /P Disc1=<"%~dp0POPS\temp\!appfolder!\Disc1.txt"
if defined Disc1 cd /d "%~dp0POPS\temp\!appfolder!" & for %%s in ("!Disc1!") do ( echo %%~zs | "%~dp0BAT\busybox" sed "s/\s*$//g" > Disc1Size.txt ) 

for %%x in ("!Disc1!") do if %%~zx GTR 1920000000 set SIZEMBD1=0

if !SIZEMBD1!==0 (
"%~dp0BAT\Diagbox" gd 0c
    echo.
	echo !Disc1! Files Exceeds size limit: 2GB Maximum per Files
	echo.
	move "%~dp0POPS\Temp\!appfolder!\*.VCD" "%~dp0POPS" >nul 2>&1
	cd /d "%~dp0POPS\temp"
"%~dp0BAT\Diagbox" gd 0f
	) else (
	echo good >nul 2>&1
	
cd /d "%~dp0POPS\temp\"
REM Get Size + Name (Disc 2)
set "Disc2Size="
set "Disc2="
set "SIZEMBD2="
dir "%~dp0POPS\temp\!appfolder!" | "%~dp0BAT\busybox" grep -e "(Disc 2)" | "%~dp0BAT\busybox" cut -c37-999 > "%~dp0POPS\temp\!appfolder!\Disc2.txt" & cd /d "%~dp0POPS\temp\!appfolder!" & for %%x in (Disc2.txt) do if %%~zx==0 del %%x & cd /d "%~dp0POPS\temp\"
if exist "%~dp0POPS\temp\!appfolder!\Disc2.txt" set /P Disc2=<"%~dp0POPS\temp\!appfolder!\Disc2.txt"
if defined Disc2 cd /d "%~dp0POPS\temp\!appfolder!" & for %%s in ("!Disc2!") do ( echo %%~zs | "%~dp0BAT\busybox" sed "s/\s*$//g" > Disc2Size.txt ) & cd /d "%~dp0POPS\temp\"

REM Get Size + Name(Disc 3)
set "Disc3Size="
set "Disc3="
set "SIZEMBD3="
dir "%~dp0POPS\temp\!appfolder!" | "%~dp0BAT\busybox" grep -e "(Disc 3)" | "%~dp0BAT\busybox" cut -c37-999 > "%~dp0POPS\temp\!appfolder!\Disc3.txt" & cd /d "%~dp0POPS\temp\!appfolder!" & for %%x in (Disc3.txt) do if %%~zx==0 del %%x & cd /d "%~dp0POPS\temp\"
if exist "%~dp0POPS\temp\!appfolder!\Disc3.txt" set /P Disc3=<"%~dp0POPS\temp\!appfolder!\Disc3.txt"
if defined Disc3 cd /d "%~dp0POPS\temp\!appfolder!" & for %%s in ("!Disc3!") do ( echo %%~zs | "%~dp0BAT\busybox" sed "s/\s*$//g" > Disc3Size.txt ) & cd /d "%~dp0POPS\temp\"

REM Get Size + Name (Disc 4)
set "Disc4Size="
set "Disc4="
set "SIZEMBD4="
dir "%~dp0POPS\temp\!appfolder!" | "%~dp0BAT\busybox" grep -e "(Disc 4)" | "%~dp0BAT\busybox" cut -c37-999 > "%~dp0POPS\temp\!appfolder!\Disc4.txt" & cd /d "%~dp0POPS\temp\!appfolder!" & for %%x in (Disc4.txt) do if %%~zx==0 del %%x & cd /d "%~dp0POPS\temp\"
if exist "%~dp0POPS\temp\!appfolder!\Disc4.txt" set /P Disc4=<"%~dp0POPS\temp\!appfolder!\Disc4.txt"
if defined Disc4 cd /d "%~dp0POPS\temp\!appfolder!" & for %%s in ("!Disc4!") do ( echo %%~zs | "%~dp0BAT\busybox" sed "s/\s*$//g" > Disc4Size.txt ) & cd /d "%~dp0POPS\temp\"


REM Calculs (Disc 0)
cd /d "%~dp0POPS\temp\!appfolder!"
if exist "%~dp0POPS\temp\!appfolder!\Disc0Size.txt" for /f %%0 in (Disc0Size.txt) do (
if %%0 GTR 1000000 set SIZEMBD0=128
if %%0 GTR 128000000 set SIZEMBD0=256
if %%0 GTR 256000000 set SIZEMBD0=384
if %%0 GTR 384000000 set SIZEMBD0=512
if %%0 GTR 512000000 set SIZEMBD0=640
if %%0 GTR 640000000 set SIZEMBD0=768
if %%0 GTR 768000000 set SIZEMBD0=896
)
if not exist "%~dp0POPS\temp\!appfolder!\Disc0Size.txt" set SIZEMBD0=0

REM Calculs (Disc 1)
if exist "%~dp0POPS\temp\!appfolder!\Disc1Size.txt" for /f %%1 in (Disc1Size.txt) do (
if %%1 GTR 1000000 set SIZEMBD1=128
if %%1 GTR 128000000 set SIZEMBD1=256
if %%1 GTR 256000000 set SIZEMBD1=384
if %%1 GTR 384000000 set SIZEMBD1=512
if %%1 GTR 512000000 set SIZEMBD1=640
if %%1 GTR 640000000 set SIZEMBD1=768
if %%1 GTR 768000000 set SIZEMBD1=896
)
if not exist "%~dp0POPS\temp\!appfolder!\Disc1Size.txt" set SIZEMBD1=0

REM Calculs (Disc 2)
if exist "%~dp0POPS\temp\!appfolder!\Disc2Size.txt" for /f %%2 in (Disc2Size.txt) do (
if %%2 GTR 1000000 set SIZEMBD2=128
if %%2 GTR 128000000 set SIZEMBD2=256
if %%2 GTR 256000000 set SIZEMBD2=384
if %%2 GTR 384000000 set SIZEMBD2=512
if %%2 GTR 512000000 set SIZEMBD2=640
if %%2 GTR 640000000 set SIZEMBD2=768
if %%2 GTR 768000000 set SIZEMBD2=896
)
if not exist "%~dp0POPS\temp\!appfolder!\Disc2Size.txt" set SIZEMBD2=0

REM Calculs (Disc 3)
if exist "%~dp0POPS\temp\!appfolder!\Disc3Size.txt" for /f %%3 in (Disc3Size.txt) do (
if %%3 GTR 1000000 set SIZEMBD3=128
if %%3 GTR 128000000 set SIZEMBD3=256
if %%3 GTR 256000000 set SIZEMBD3=384
if %%3 GTR 384000000 set SIZEMBD3=512
if %%3 GTR 512000000 set SIZEMBD3=640
if %%3 GTR 640000000 set SIZEMBD3=768
if %%3 GTR 768000000 set SIZEMBD3=896
)
if not exist "%~dp0POPS\temp\!appfolder!\Disc3Size.txt" set SIZEMBD3=0

REM Calculs (Disc 4)
if exist "%~dp0POPS\temp\!appfolder!\Disc4Size.txt" for /f %%4 in (Disc4Size.txt) do (
if %%4 GTR 1000000 set SIZEMBD4=128
if %%4 GTR 128000000 set SIZEMBD4=256
if %%4 GTR 256000000 set SIZEMBD4=384
if %%4 GTR 384000000 set SIZEMBD4=512
if %%4 GTR 512000000 set SIZEMBD4=640
if %%4 GTR 640000000 set SIZEMBD4=768
if %%4 GTR 768000000 set SIZEMBD4=896
)
if not exist "%~dp0POPS\temp\!appfolder!\Disc4Size.txt" set SIZEMBD4=0

SET /A Result = !SIZEMBD0!+!SIZEMBD1!+!SIZEMBD2!+!SIZEMBD3!+!SIZEMBD4!

REM echo !Result!

REM Special Thanks To Matias Israelson (AKA:El_isra) for POPS-VCD-ID-Extractor
"%~dp0BAT\POPS-VCD-ID-Extractor" "%~dp0POPS\temp\!appfolder!\!filename!" > "%~dp0TMP\VCDID.txt"

dir "%~dp0POPS\temp\!appfolder!\" > "%~dp0TMP\tmpfiles.txt"

"%~dp0BAT\busybox" grep -i -e ".*\.VCD$" "%~dp0TMP\tmpfiles.txt" | "%~dp0BAT\busybox" cut -c37-999 > "%~dp0TMP\Name.txt"
"%~dp0BAT\busybox" paste -d " " "%~dp0TMP\VCDID.txt" "%~dp0TMP\Name.txt" > "%~dp0TMP\VCDIDNameTMP.txt"
"%~dp0BAT\busybox" sed -i "2,6d" "%~dp0TMP\VCDIDNameTMP.txt"
"%~dp0BAT\busybox" sed "s/.\{12\}/&/" "%~dp0TMP\VCDIDNameTMP.txt" > "%~dp0POPS\Temp\!appfolder!\VCDIDName.txt"

for /f "tokens=1*" %%F in (VCDIDName.txt) do (

REM echo %%G.VCD

 	set "PPtitle="
 	for /f "tokens=1*" %%A in ( 'findstr %%F "%~dp0TMP\gameid.txt"' ) do (if not defined PPtitle set PPtitle=%%B
     )

if not defined PPtitle set PPtitle=%%~nG
echo !PPtitle! | "%~dp0BAT\busybox" iconv -f utf8 -t ascii//TRANSLIT//IGNORE | "%~dp0BAT\busybox" sed -e "s/-/_/g; s/\./_/g" | "%~dp0BAT\busybox" sed -e "s/^/PP.%%F.POPS./" | "%~dp0BAT\busybox" cut -c0-32 > "%~dp0POPS\Temp\!appfolder!\PPName.txt"
"%~dp0BAT\busybox" sed -r -i "s/^(.{11})(.{1})/\1/" "%~dp0POPS\Temp\!appfolder!\PPName.txt"
"%~dp0BAT\busybox" sed -i "s/.\{8\}/&-/" "%~dp0POPS\Temp\!appfolder!\PPName.txt"

"%~dp0BAT\busybox" sed -i "s/\s*$//" "%~dp0POPS\Temp\!appfolder!\PPName.txt"
"%~dp0BAT\busybox" sed -i "s/ /_/g" "%~dp0POPS\Temp\!appfolder!\PPName.txt"
"%~dp0BAT\busybox" sed -i "s/'/_/g" "%~dp0POPS\Temp\!appfolder!\PPName.txt"
"%~dp0BAT\busybox" sed -i "s/\&/_/g" "%~dp0POPS\Temp\!appfolder!\PPName.txt"
"%~dp0BAT\busybox" sed -i "s/%%/_/g" "%~dp0POPS\Temp\!appfolder!\PPName.txt"
"%~dp0BAT\busybox" sed -i "s/\"//g" "%~dp0POPS\Temp\!appfolder!\PPName.txt"
"%~dp0BAT\busybox" sed -i "s/\[//g; s/\]//g" "%~dp0POPS\Temp\!appfolder!\PPName.txt"
"%~dp0BAT\busybox" sed -i "s/(//g; s/)//g" "%~dp0POPS\Temp\!appfolder!\PPName.txt"
"%~dp0BAT\busybox" sed -i "y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/" "%~dp0POPS\Temp\!appfolder!\PPName.txt"
"%~dp0BAT\busybox" sed -i "s/\(.\{7\}\)./\1/" "%~dp0POPS\Temp\!appfolder!\PPName.txt"
set /P PPName=<"%~dp0POPS\Temp\!appfolder!\PPName.txt"

REM echo !PPName!

move "%~dp0TMP\POPSTARTER.KELF" "%~dp0POPS\Temp\!appfolder!\EXECUTE.KELF" >nul 2>&1
move "%~dp0TMP\hdl_dump.exe" "%~dp0POPS\Temp\!appfolder!\" >nul 2>&1

REM PAUSE
echo\
echo\
echo Creating Partition:
echo ----------------------------------------------------
echo\

    echo        Creating partitions...
    echo device %@hdl_path% > "%~dp0TMP\pfs-log.txt"
 	echo mkpart "!PPName!" !Result!M >> "%~dp0TMP\pfs-log.txt"
   	echo exit >> "%~dp0TMP\pfs-log.txt"
 	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
 	del "%~dp0TMP\pfs-log.txt" >nul 2>&1

 	echo        Installing %%G... 
    echo device %@hdl_path% > "%~dp0TMP\pfs-log.txt"
 	echo mount "!PPName!" >> "%~dp0TMP\pfs-log.txt"
    if defined Disc0 echo put "!Disc0!" >> "%~dp0TMP\pfs-log.txt"
    if defined Disc1 echo put "!Disc1!" >> "%~dp0TMP\pfs-log.txt"
    if defined Disc2 echo put "!Disc2!" >> "%~dp0TMP\pfs-log.txt"
    if defined Disc3 echo put "!Disc3!" >> "%~dp0TMP\pfs-log.txt"
    if defined Disc4 echo put "!Disc4!" >> "%~dp0TMP\pfs-log.txt"
    if defined Disc0 echo rename "!Disc0!" IMAGE0.VCD >> "%~dp0TMP\pfs-log.txt"
    if defined Disc1 echo rename "!Disc1!" IMAGE0.VCD >> "%~dp0TMP\pfs-log.txt"
    if defined Disc2 echo rename "!Disc2!" IMAGE1.VCD >> "%~dp0TMP\pfs-log.txt"
    if defined Disc3 echo rename "!Disc3!" IMAGE2.VCD >> "%~dp0TMP\pfs-log.txt"
    if defined Disc4 echo rename "!Disc4!" IMAGE3.VCD >> "%~dp0TMP\pfs-log.txt"
	echo put "EXECUTE.KELF" >> "%~dp0TMP\pfs-log.txt"
 	echo umount >> "%~dp0TMP\pfs-log.txt"
   	echo exit >> "%~dp0TMP\pfs-log.txt"
 	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
 	del "%~dp0TMP\pfs-log.txt" >nul 2>&1
	
	if defined Disc2 (
	"%~dp0BAT\busybox" sed -i -e "s/PP.//g" "%~dp0POPS\Temp\!appfolder!\PPName.txt"
	set /P VMCName=<"%~dp0POPS\Temp\!appfolder!\PPName.txt"
	
	echo device %@hdl_path% > "%~dp0TMP\pfs-log.txt"
 	echo mount __common >> "%~dp0TMP\pfs-log.txt"
	echo mkdir POPS >> "%~dp0TMP\pfs-log.txt"
	echo cd POPS >> "%~dp0TMP\pfs-log.txt"
	echo mkdir "!VMCName!" >> "%~dp0TMP\pfs-log.txt"
	echo cd "!VMCName!" >> "%~dp0TMP\pfs-log.txt"
	echo IMAGE0.VCD > "%~dp0POPS\Temp\!appfolder!\DISCS.TXT"
	echo IMAGE1.VCD >> "%~dp0POPS\Temp\!appfolder!\DISCS.TXT"
	if defined Disc3 echo IMAGE2.VCD >> "%~dp0POPS\Temp\!appfolder!\DISCS.TXT"
	if defined Disc4 echo IMAGE3.VCD >> "%~dp0POPS\Temp\!appfolder!\DISCS.TXT"
	"%~dp0BAT\busybox" sed -i "s/ *$//" "%~dp0POPS\Temp\!appfolder!\DISCS.TXT"
	
	echo put DISCS.TXT >> "%~dp0TMP\pfs-log.txt"
	echo umount >> "%~dp0TMP\pfs-log.txt"
   	echo exit >> "%~dp0TMP\pfs-log.txt"
 	type "%~dp0TMP\pfs-log.txt" | "%~dp0BAT\pfsshell" 2>&1 | "%~dp0BAT\busybox" tee > "%~dp0TMP\pfs-tmp.log"
 	del "%~dp0TMP\pfs-log.txt" >nul 2>&1
	
	"%~dp0BAT\busybox" sed -i -e "s/ (Disc [1-6])//g" "%~dp0TMP\gameid.txt"
	)

	"%~dp0BAT\7z.exe" x -bso0 "%~dp0BAT\HDD-OSD_SAMPLE_HEADER.zip" -o"%~dp0POPS\Temp\!appfolder!" -r -y
	
	if defined DownloadARTPS1HDDOSD (
	md PS1 >nul 2>&1
	"%~dp0BAT\Diagbox" gd 03
	"%~dp0BAT\wget" -q "https://ia801402.us.archive.org/view_archive.php?archive=/16/items/hdd-osd-icons-pack/HDD-OSD-Icons-Pack.zip&file=PS1%%2F%%F%%2Ficon.sys" -O "%~dp0POPS\Temp\!appfolder!\PS1\icon.sys" >nul & for %%x in ( "%~dp0POPS\Temp\!appfolder!\PS1\icon.sys" ) do if %%~zx==0 del %%x
	"%~dp0BAT\wget" -q "https://ia801402.us.archive.org/view_archive.php?archive=/16/items/hdd-osd-icons-pack/HDD-OSD-Icons-Pack.zip&file=PS1%%2F%%F%%2Flist.ico" -O "%~dp0POPS\Temp\!appfolder!\PS1\list.ico" >nul & for %%x in ( "%~dp0POPS\Temp\!appfolder!\PS1\list.ico" ) do if %%~zx==0 del %%x
	"%~dp0BAT\wget" -q "https://ia801402.us.archive.org/view_archive.php?archive=/16/items/hdd-osd-icons-pack/HDD-OSD-Icons-Pack.zip&file=PS1%%2F%%F%%2Fdel.ico" -O "%~dp0POPS\Temp\!appfolder!\PS1\del.ico" >nul & for %%x in ( "%~dp0POPS\Temp\!appfolder!\PS1\del.ico" ) do if %%~zx==0 del %%x
    "%~dp0BAT\wget" -q "https://ia801402.us.archive.org/view_archive.php?archive=/16/items/hdd-osd-icons-pack/HDD-OSD-Icons-Pack.zip&file=PS1%%2F%%F%%2FPreview.png" -O "%~dp0POPS\Temp\!appfolder!\PS1\Preview.png" >nul & for %%x in ( "%~dp0POPS\Temp\!appfolder!\PS1\Preview.png" ) do if %%~zx==0 del %%x
    "%~dp0BAT\Diagbox" gd 0f
	move "%~dp0POPS\Temp\!appfolder!\PS1\*" "%~dp0POPS\Temp\!appfolder!\" >nul 2>&1
	)
	
	if not defined DownloadARTPS1HDDOSD (
	"%~dp0BAT\7z.exe" x -bso0 "%~dp0BAT\HDD-OSD-Icons-Pack.zip" -o"%~dp0POPS\Temp\!appfolder!" PS1\%%F\ -r -y & move "%~dp0POPS\Temp\!appfolder!\PS1\%%F\*" "%~dp0POPS\Temp\!appfolder!\" >nul 2>&1
	)
	
	setlocal DisableDelayedExpansion
	"%~dp0BAT\busybox" sed -i -e "s/title0=APPNAME/title0=%%~nG/" "%~dp0POPS\Temp\%%a\icon.sys"
	"%~dp0BAT\busybox" sed -i -e "s/title1=APPNAME2/title1=%%F/" "%~dp0POPS\Temp\%%a\icon.sys"
	setlocal EnableDelayedExpansion
	
 	set "dbtitle="
 	for /f "tokens=1*" %%A in ( 'findstr %%F "%~dp0TMP\gameid.txt"' ) do (if not defined dbtitle set dbtitle=%%B
    "%~dp0BAT\busybox" sed -i -e "s/title0=.*/title0=/g; s/title0=/title0=!dbtitle!/g" "%~dp0POPS\Temp\!appfolder!\icon.sys"
 	"%~dp0BAT\busybox" sed -i -e "s/title1=.*/title1=/g; s/title1=/title1=%%F/g" "%~dp0POPS\Temp\!appfolder!\icon.sys"
     )
	 
	hdl_dump modify_header %@hdl_path2% "!PPName!" >nul 2>&1

	echo        Completed...

	move "%~dp0POPS\Temp\!appfolder!\EXECUTE.KELF" "%~dp0TMP\POPSTARTER.KELF" >nul 2>&1
	move "%~dp0POPS\Temp\!appfolder!\hdl_dump.exe" "%~dp0TMP" >nul 2>&1
    move "%~dp0POPS\Temp\!appfolder!\*.VCD" "%~dp0POPS" >nul 2>&1
    rmdir /Q/S "%~dp0POPS\Temp\!appfolder!" >nul 2>&1
	  )
     )
	)
   endlocal
  endlocal
 endlocal 
 )

cd /d "%~dp0" & rmdir /Q/S "%~dp0POPS\Temp" >nul 2>&1
rmdir /Q/S "%~dp0TMP" >nul 2>&1

"%~dp0BAT\Diagbox" gd 0f
echo\
echo\
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo Completed...
echo\
echo\
"%~dp0BAT\Diagbox" gd 07

pause & (goto HDDOSDPartManagement)

REM ####################################################################################################################
:InstallNBDDriver

cls
cd /d %~dp0
mkdir "%~dp0TMP" >nul 2>&1

echo\
bcdedit.exe | "%~dp0BAT\busybox" grep testsigning | "%~dp0BAT\busybox" grep -o Yes > "%~dp0TMP\checkmodetest.txt" & set /P checkmodetest=<"%~dp0TMP\checkmodetest.txt"
set modetest=!checkmodetest!


    if !modetest!==Yes (
	
	echo\
    "%~dp0BAT\Diagbox" gd 0a
    echo Windows test mode detected!
    "%~dp0BAT\Diagbox" gd 0f
	
   "%~dp0BAT\7z.exe" x -bso0 "%~dp0BAT\Driver_WNBD.zip" -o"%~dp0__DriverWNBD" -r -y
   "%~dp0__DriverWNBD\wnbd-client.exe" uninstall-driver
   "%~dp0__DriverWNBD\wnbd-client.exe" install-driver "%~dp0__DriverWNBD\wnbd.inf"
   
   echo\
   echo\
   echo When you restart your computer, test mode will be disabled.
   bcdedit.exe /set testsigning no >nul 2>&1


echo\
echo\
rmdir /Q/S "%~dp0__DriverWNBD" >nul 2>&1

echo\
"%~dp0BAT\Diagbox" gd 0f
echo ----------------------------------------------------
"%~dp0BAT\Diagbox" gd 0a
echo Completed...
echo\
echo\
"%~dp0BAT\Diagbox" gd 0f

pause & (goto NBDServer)

) else (

echo\
"%~dp0BAT\Diagbox" gd 0c
echo Windows test mode NOT DETECTED!
"%~dp0BAT\Diagbox" gd 06
echo YOU NEED to enable test mode to install the drivers
echo\
echo Please note that test signed drivers cannot be used when Secure Boot is enabled
echo You must disable Secure Boot UEFI in your computer's bios
"%~dp0BAT\Diagbox" gd 0f
echo\
echo Reboot your computeur now for enable Windows test mode?
echo\
choice /c YN
echo\

if errorlevel 1 set rebootnow=yes
if errorlevel 2 (goto NBDServer)


if !rebootnow!==yes (
bcdedit.exe /set testsigning yes >nul 2>&1
shutdown.exe /r /t 05

echo Reboot...
echo.
echo 5
ping -n 2 127.0.0.1>nul
echo 4
ping -n 2 127.0.0.1>nul
echo 3
ping -n 2 127.0.0.1>nul
echo 2
ping -n 2 127.0.0.1>nul
echo 1
ping -n 2 127.0.0.1>nul

     )
)

pause & (goto NBDServer)

REM ####################################################################################################################
:RenameVCDDB
endlocal
endlocal

mkdir "%~dp0TMP" >nul 2>&1

copy "%~dp0BAT\DB\gameidPS1.txt" "%~dp0TMP\gameid.txt" >nul 2>&1
"%~dp0BAT\busybox" sed -i "s/\^!/\!/g" "%~dp0TMP\gameid.txt" >nul 2>&1

if not exist "%~dp0POPS\*.VCD" (
cls
"%~dp0BAT\Diagbox" gd 06
echo.
echo .VCD NOT DETECTED: Please drop .VCD IN POPS FOLDER.
echo.
"%~dp0BAT\Diagbox" gd 0f

 ) else (

cls
echo\ 
echo\
echo Do you want rename your .VCDs from database?
choice /c YN /m "Use titles from database?"
echo\

if errorlevel 2 (goto GamesManagement)

echo Do you want use a prefix?
echo\
echo With prefix: SCES_009.84.Gran Turismo.VCD
echo Without prefix: Gran Turismo.VCD
echo\

choice /c YN /m "Use Prefix ?"
echo\
if errorlevel 1 set usegameiddb=yes
if errorlevel 2 set usegameiddb=no

echo -----------------------------------------------------
cd /d "%~dp0POPS"

For %%P in ( "*.VCD" ) do ( "%~dp0BAT\POPS-VCD-ID-Extractor" "%%P" > VCDID.txt
set "filename=%%P"

for /f %%i in (VCDID.txt) do (
set gameid=%%i

set "dbtitle="
for /f "tokens=1*" %%A in ( 'findstr %%i "%~dp0TMP\gameid.txt" ' ) do ( if not defined dbtitle set dbtitle=%%B
				
  )
 )

setlocal EnableDelayedExpansion
del "%~dp0POPS\VCDID.txt" >nul 2>&1

if !usegameiddb!==yes (
findstr !gameid! "%~dp0TMP\gameid.txt" >nul
if errorlevel 1 (
"%~dp0BAT\Diagbox" gd 0c
echo !gameid! "!filename!" : TITLE NOT FOUND IN DATABASE
"%~dp0BAT\Diagbox" gd 07
) else (
echo !gameid!.!dbtitle!

md temp >nul 2>&1
if exist "temp\!gameid!.!dbtitle!.VCD" (

"%~dp0BAT\Diagbox" gd 06
echo "!filename!" Has the same name as another
"%~dp0BAT\Diagbox" gd 07
cd ..

 ) else (

move "!filename!" "temp\!gameid!.!dbtitle!.VCD" >nul 2>&1

   )
 )
 

) else (

findstr !gameid! "%~dp0TMP\gameid.txt" >nul
if errorlevel 1 (
"%~dp0BAT\Diagbox" gd 0c
echo !gameid! "!filename!" : TITLE NOT FOUND IN DATABASE
"%~dp0BAT\Diagbox" gd 07
) else (
echo !dbtitle!

md temp >nul 2>&1
if exist "temp\!dbtitle!.VCD" (

"%~dp0BAT\Diagbox" gd 06
echo "!filename!" Has the same name as another
"%~dp0BAT\Diagbox" gd 07
cd ..

 ) else (

move "!filename!" "temp\!dbtitle!.VCD" >nul 2>&1
  )
 )	
)
endlocal
     )
   )
)
move "%~dp0POPS\temp\*.VCD" "%~dp0POPS" >nul 2>&1

rmdir /s /q temp >nul 2>&1
echo\

pause & (goto GamesManagement)

REM ####################################################################################################################################################
:BIN2VCD
cls

endlocal
endlocal
mkdir "%~dp0TMP" >nul 2>&1

copy "%~dp0BAT\DB\gameidPS1.txt" "%~dp0TMP\gameid.txt" >nul 2>&1
"%~dp0BAT\busybox" sed -i "s/\^!/\!/g" "%~dp0TMP\gameid.txt" >nul 2>&1

cd "%~dp0POPS"

if exist rmdir /s /q temp >nul 2>&1
if exist *.zip "%~dp0BAT\7z.exe" x -bso0 "%~dp0POPS\*.zip"
if exist *.rar "%~dp0BAT\7z.exe" x -bso0 "%~dp0POPS\*.rar"
if exist *.7z  "%~dp0BAT\7z.exe" x -bso0 "%~dp0POPS\*.7z"
if not exist *.cue (goto failmultibin)
md temp >nul 2>&1
md Original >nul 2>&1

for %%f in (*.cue) do "%~dp0BAT\binmerge" "%%f" "temp\%%~nf"
move *.bin "%~dp0POPS\Original" >nul 2>&1
move *.cue "%~dp0POPS\Original" >nul 2>&1

cd "%~dp0POPS\temp"
"%~dp0BAT\busybox" sed -i "s/temp\\//g" "*.cue"

for %%f in (*.cue) do "%~dp0BAT\CUE2POPS_2_3" "%%f"
move *.VCD "%~dp0POPS" >nul 2>&1

cd /d "%~dp0POPS
rmdir /s /q temp >nul 2>&1
endlocal
echo.


echo\ 
echo\
echo Do you want rename your .VCDs from database?
choice /c YN /m "Use titles from database?"
echo\

if errorlevel 2 (goto ConversionMenu)

echo Do you want use a prefix?
echo\
echo With prefix: SCES_009.84.Gran Turismo.VCD
echo Without prefix: Gran Turismo.VCD
echo\

choice /c YN /m "Use Prefix ?"
echo\
if errorlevel 1 set usegameiddb=yes
if errorlevel 2 set usegameiddb=no

echo -----------------------------------------------------
cd /d "%~dp0POPS"

For %%P in ( "*.VCD" ) do ( "%~dp0BAT\POPS-VCD-ID-Extractor" "%%P" > VCDID.txt
set "filename=%%P"

for /f %%i in (VCDID.txt) do (
set gameid=%%i

set "dbtitle="
for /f "tokens=1*" %%A in ( 'findstr %%i "%~dp0TMP\gameid.txt" ' ) do ( if not defined dbtitle set dbtitle=%%B
				
  )
 )

setlocal EnableDelayedExpansion
del "%~dp0POPS\VCDID.txt" >nul 2>&1

if !usegameiddb!==yes (
findstr !gameid! "%~dp0TMP\gameid.txt" >nul
if errorlevel 1 (
"%~dp0BAT\Diagbox" gd 0c
echo !gameid! "!filename!" : TITLE NOT FOUND IN DATABASE
"%~dp0BAT\Diagbox" gd 07
) else (
echo !gameid!.!dbtitle!

md temp >nul 2>&1
if exist "temp\!gameid!.!dbtitle!.VCD" (

"%~dp0BAT\Diagbox" gd 06
echo "!filename!" Has the same name as another
"%~dp0BAT\Diagbox" gd 07
cd ..

 ) else (

move "!filename!" "temp\!gameid!.!dbtitle!.VCD" >nul 2>&1

   )
 )
 

) else (

findstr !gameid! "%~dp0TMP\gameid.txt" >nul
if errorlevel 1 (
"%~dp0BAT\Diagbox" gd 0c
echo !gameid! "!filename!" : TITLE NOT FOUND IN DATABASE
"%~dp0BAT\Diagbox" gd 07
) else (
echo !dbtitle!

md temp >nul 2>&1
if exist "temp\!dbtitle!.VCD" (

"%~dp0BAT\Diagbox" gd 06
echo "!filename!" Has the same name as another
"%~dp0BAT\Diagbox" gd 07
cd ..

 ) else (

move "!filename!" "temp\!dbtitle!.VCD" >nul 2>&1
  )
 )	
)
endlocal
     )
   )
)
move "%~dp0POPS\temp\*.VCD" "%~dp0POPS" >nul 2>&1

rmdir /s /q temp >nul 2>&1
echo\

pause & (goto ConversionMenu)

REM ####################################################################################################################################################
:VCD2BIN
cls
endlocal
endlocal
cd "%~dp0POPS"

if exist rmdir /s /q temp >nul 2>&1
if exist *.zip "%~dp0BAT\7z.exe" x -bso0 "%~dp0POPS\*.zip"
if exist *.rar "%~dp0BAT\7z.exe" x -bso0 "%~dp0POPS\*.rar"
if exist *.7z  "%~dp0BAT\7z.exe" x -bso0 "%~dp0POPS\*.7z"
if not exist *.vcd (goto failVCD)
md temp >nul 2>&1
md Original >nul 2>&1

for %%f in (*.vcd) do "%~dp0BAT\POPS2CUE.EXE" "%%f"
move *.vcd "%~dp0POPS\Original" >nul 2>&1

REM ZIP Multiple Tracks
::for %%# in (*.cue) do %~dp0BAT\7z.exe a -bso0 "%%~n#.zip" "%%#" "%%~n# (Track ?).bin" "%%~n# (Track ??).bin"

REM Move BIN/CUE in FOLDER
for %%# in (*.cue) do md "%%~n#" >nul 2>&1
for %%# in (*.cue) do move "%%~n#.bin" "%%~n#" >nul 2>&1
for %%# in (*.cue) do move "%%~n#.cue" "%%~n#" >nul 2>&1

rmdir /s /q temp >nul 2>&1
echo.

pause & (goto ConversionMenu)

:failVCD
"%~dp0BAT\Diagbox" gd 06
echo.
echo .VCD NOT DETECTED: Please drop .VCD IN POPS FOLDER.
echo.
"%~dp0BAT\Diagbox" gd 0f

pause & (goto ConversionMenu)

REM #########################################################################################################################################################
:ECM2BIN
endlocal
endlocal

cd "%~dp0POPS"
if exist *.zip "%~dp0BAT\7z.exe" x -bso0 "%~dp0POPS\*.zip"
if exist *.rar "%~dp0BAT\7z.exe" x -bso0 "%~dp0POPS\*.rar"
if exist *.7z  "%~dp0BAT\7z.exe" x -bso0 "%~dp0POPS\*.7z"
if not exist *.ecm (goto failECM)
md temp >nul 2>&1
md Original >nul 2>&1

move *.ecm temp >nul 2>&1
move *.cue temp >nul 2>&1
cd temp >nul 2>&1

for %%f in (*.ecm) do "%~dp0BAT\unecm.exe" "%%f" "%%~nf"
if not exist "%%~nf.cue" call "%~dp0BAT\cuemaker.bat"

move *.bin "%~dp0POPS" >nul 2>&1
move *.cue "%~dp0POPS" >nul 2>&1
move *.ecm "%~dp0POPS\Original" >nul 2>&1
cd "%~dp0POPS"

rmdir /s /q temp >nul 2>&1
echo.


pause & (goto ConversionMenu)

:failECM
cls
"%~dp0BAT\Diagbox" gd 06
echo.
echo .ECM NOT DETECTED: Please drop .ECM IN POPS FOLDER.
echo.
"%~dp0BAT\Diagbox" gd 0f

pause & (goto ConversionMenu)

REM ##########################################################################################################################################################
:BIN2CHD
endlocal
endlocal

cd "%~dp0POPS"
if exist *.zip "%~dp0BAT\7z.exe" x -bso0 "%~dp0POPS\*.zip"
if exist *.rar "%~dp0BAT\7z.exe" x -bso0 "%~dp0POPS\*.rar"
if exist *.7z  "%~dp0BAT\7z.exe" x -bso0 "%~dp0POPS\*.7z"
if not exist *.cue (goto failbin2CHD)
md Original >nul 2>&1

for %%i in (*.cue) do "%~dp0BAT\chdman.exe" createcd -i "%%i" -o "%%~ni.chd" 
move *.bin "%~dp0POPS\Original" >nul 2>&1
move *.cue "%~dp0POPS\Original" >nul 2>&1

echo.

pause & (goto ConversionMenu)

:failCHD2BIN
cls
"%~dp0BAT\Diagbox" gd 06
echo.
echo .CHD NOT DETECTED: Please drop .CHD IN POPS FOLDER.
echo.
"%~dp0BAT\Diagbox" gd 0f

pause & (goto ConversionMenu)

REM ##########################################################################################################################################################
:CHD2BIN
endlocal
endlocal

cd "%~dp0POPS"
if exist *.zip "%~dp0BAT\7z.exe" x -bso0 "%~dp0POPS\*.zip"
if exist *.rar "%~dp0BAT\7z.exe" x -bso0 "%~dp0POPS\*.rar"
if exist *.7z  "%~dp0BAT\7z.exe" x -bso0 "%~dp0POPS\*.7z"
if not exist *.chd (goto failCHD2bin)
md Original >nul 2>&1

for %%h in (*.chd) do "%~dp0BAT\chdman.exe" extractcd -i "%%h" -o "%%~nh.cue"
move *.CHD "%~dp0POPS\Original" >nul 2>&1

echo.

pause & (goto ConversionMenu)

:failBIN2CHD
cls
"%~dp0BAT\Diagbox" gd 06
echo.
echo .BIN/.CUE NOT DETECTED: Please drop .BIN IN POPS FOLDER.
echo.
"%~dp0BAT\Diagbox" gd 0f

pause & (goto ConversionMenu)

REM ##########################################################################################################################################################
:multibin2bin
endlocal
endlocal

cls
cd "%~dp0POPS"

if exist rmdir /s /q temp >nul 2>&1
if exist *.zip "%~dp0BAT\7z.exe" x -bso0 "%~dp0POPS\*.zip"
if exist *.rar "%~dp0BAT\7z.exe" x -bso0 "%~dp0POPS\*.rar"
if exist *.7z  "%~dp0BAT\7z.exe" x -bso0 "%~dp0POPS\*.7z"
if not exist *.cue (goto failmultibin)
md temp >nul 2>&1
md Original >nul 2>&1

for %%f in (*.cue) do "%~dp0BAT\binmerge" "%%f" "temp\%%~nf"
move *.bin "%~dp0POPS\Original" >nul 2>&1
move *.cue "%~dp0POPS\Original" >nul 2>&1

cd "%~dp0POPS\temp"
"%~dp0BAT\busybox" sed -i "s/temp\\//g" "*.cue"
move *.bin "%~dp0POPS" >nul 2>&1
move *.cue "%~dp0POPS" >nul 2>&1
cd "%~dp0POPS"

rmdir /s /q temp >nul 2>&1
echo.

pause & (goto ConversionMenu)

:failmultibin
cls 

"%~dp0BAT\Diagbox" gd 06
echo. 
echo .BIN/.CUE NOT DETECTED: Please drop .BIN/.CUE with the same name in the POPS folder.
echo Also check that the name matches inside the .cue
echo. 
"%~dp0BAT\Diagbox" gd 07

pause & (goto ConversionMenu)

REM ##########################################################################################################################################################
:bin2split
endlocal
endlocal

cls
cd "%~dp0POPS"

if exist rmdir /s /q temp >nul 2>&1
if exist *.zip "%~dp0BAT\7z.exe" x -bso0 "%~dp0POPS\*.zip"
if exist *.rar "%~dp0BAT\7z.exe" x -bso0 "%~dp0POPS\*.rar"
if exist *.7z  "%~dp0BAT\7z.exe" x -bso0 "%~dp0POPS\*.7z"
if not exist *.cue (goto failbinsplit)
md temp >nul 2>&1
md Original >nul 2>&1

for %%f in (*.cue) do "%~dp0BAT\binmerge" -s "%%f" "temp\%%~nf"
move *.bin "%~dp0POPS\Original" >nul 2>&1
move *.cue "%~dp0POPS\Original" >nul 2>&1

cd "%~dp0POPS\temp"
"%~dp0BAT\busybox" sed -i "s/temp\\//g" "*.cue"
move *.bin "%~dp0POPS" >nul 2>&1
move *.cue "%~dp0POPS" >nul 2>&1
cd "%~dp0POPS"

REM ZIP Multiple Tracks
::for %%# in (*.cue) do %~dp0BAT\7z.exe a -bso0 "%%~n#.zip" "%%#" "%%~n# (Track ?).bin" "%%~n# (Track ??).bin"

REM Move Multiple Tracks in FOLDER
for %%# in (*.cue) do md "%%~n#" >nul 2>&1
for %%# in (*.cue) do move "%%~n# (Track *).bin" "%%~n#" >nul 2>&1
for %%# in (*.cue) do move "%%~n#.cue" "%%~n#" >nul 2>&1

rmdir /s /q temp >nul 2>&1
echo.

pause & (goto ConversionMenu)

:failbinsplit
cls 

"%~dp0BAT\Diagbox" gd 06
echo. 
echo .BIN/.CUE NOT DETECTED: Please drop .BIN/.CUE with the same name in the POPS folder.
echo Also check that the name matches inside the .cue
echo. 
"%~dp0BAT\Diagbox" gd 07

pause & (goto ConversionMenu)

REM OLD Replace
REM setlocal EnableExtensions DisableDelayedExpansion
REM 
REM set "search=temp\"
REM set "replace="
REM 
REM set "textFile=*.cue"
REM set "rootDir=."
REM for /R "%rootDir%" %%j in ("%textFile%") do (
REM for %%j in ("%rootDir%\%textFile%") do (
REM     for /f "delims=" %%i in ('type "%%~j" ^& break ^> "%%~j"') do (
REM         set "line=%%i"
REM         setlocal EnableDelayedExpansion
REM         set "line=!line:%search%=%replace%!"
REM         >>"%%~j" echo(!line!
REM         
REM     )
REM )

REM ###########################################################################################################################################################
:BIN2ISO
endlocal
endlocal

cd "%~dp0CD"
if not exist *.bin (goto failBIN2ISO)
md Original >nul 2>&1

if not exist "%%~nf.cue" call "%~dp0BAT\cuemaker.bat"

echo Converting... .BIN To .ISO
for %%f in (*.bin) do (
"%~dp0BAT\bchunk" "%%~nf.bin" "%%~nf.cue" "%%~nf" >nul 2>&1 
move "%%~nf01.iso" "%%~nf.iso" >nul 2>&1
)

move *.bin "%~dp0CD\Original" >nul 2>&1
move *.cue "%~dp0CD\Original" >nul 2>&1

echo.
echo Conversion completed
echo.

pause & (goto ConversionMenu)

:failBIN2ISO
cls
"%~dp0BAT\Diagbox" gd 06
echo.
echo .BIN/.CUE NOT DETECTED: Please drop .BIN IN CD FOLDER.
echo.
"%~dp0BAT\Diagbox" gd 0f

pause & (goto ConversionMenu)

REM ###########################################################################################################################################################

:GDX-X 
cls
echo\
echo\
echo\
echo\
echo\                                                                               
ECHO   ,ad8888ba,  88888888ba, 8b        d8
ECHO  d8"'    `"8b 88      `"8b Y8,    ,8P 
ECHO d8'           88        `8b `8b  d8'  
ECHO 88            88         88   Y88P    
ECHO 88      88888 88         88   d88b    
ECHO Y8,        88 88         8P ,8P  Y8,  
ECHO  Y8a.    .a88 88      .a8P d8'    `8b 
ECHO   `"Y88888P"  88888888Y"' 8P        Y8  
echo\ 
echo\
echo\
echo\
echo\                                 
PAUSE
cls
(goto mainmenu)

REM ###########################################################################################################################################################

:poop
cls
echo\
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@////@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@////////@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@///////////@@@@@@@@@@@@@@@@@@@@@@@@@@@
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@////////////////@@@@@@@@@@@@@@@@@@@@@@@@@
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@//////////////////////@@@@@@@@@@@@@@@@@@@@@@@@
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@///////////////////////////@@@@@@@@@@@@@@@@@@@@@@@
echo @@@@@@@@@@@@@@@@@@@@@@@@//////////////////////////////////@@@@@@@@@@@@@@@@@@@@@@
echo @@@@@@@@@@@@@@@@@@@@///////////////////////////////////////@@@@@@@@@@@@@@@@@@@@@
echo @@@@@@@@@@@@@@@@@//////////////////////////////////////////////@@@@@@@@@@@@@@@@@
echo @@@@@@@@@@@@@@@///////////////////////////////////////////////////@@@@@@@@@@@@@@
echo @@@@@@@@@@@@@///////////////////////////////////////////////////////@@@@@@@@@@@@
echo @@@@@@@@@@@@/////////////////////////////////////////////////////////@@@@@@@@@@@
echo @@@@@@@@@@@@//////////////////////////////////////////////////////////@@@@@@@@@@
echo @@@@@@@@@@@@//////////////////////////////////////////////////////////@@@@@@@@@@
echo @@@@@@@@@@@@//////////////////////////////////////////////////////////@@@@@@@@@@
echo @@@@@@@@@@@@@/////////////////////////////////////////////////////////@@@@@@@@@@
echo @@@@@@@@@@@/////////////////////////FUCK-PS2-HOME////////////////////@@@@@@@@@@@
echo @@@@@@@@/////////////////////////////////////////////////////////////////@@@@@@@
echo @@@@@@/////////////////////////////////////////////////////////////////////@@@@@
echo @@@@////////////////////////////////////////////////////////////////////////@@@@
echo @@@@/////////////////////////////////////////////////////////////////////////@@@
echo @@@///////////////////////////////////////////////////////////////////////////@@
echo @@@///////////////////////////////////////////////////////////////////////////@@
echo @@@@/////////////////////////////////////////////////////////////////////////@@@
echo @@@@/////////////////////////////////////////////////////////////////////////@@@
echo @@@@@///////////////////////////////////////////////////////////////////////@@@@
echo @@@@@@@///////////////////////////////////////////////////////////////////@@@@@@
echo @@@@@@@@@///////////////////////////////////////////////////////////////@@@@@@@@
echo @@@@@@@@@@@@/////////////////////////////////////////////////////////@@@@@@@@@@@
echo @@@@@@@@@@@@@@@@/////////////////////////////////////////////////@@@@@@@@@@@@@@@
echo @@@@@@@@@@@@@@@@@@@@@@/////////////////////////////////////@@@@@@@@@@@@@@@@@@@@@
pause
cls
