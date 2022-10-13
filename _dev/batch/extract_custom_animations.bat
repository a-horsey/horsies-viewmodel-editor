SETLOCAL ENABLEDELAYEDEXPANSION
@echo OFF
cd "%vm_customizer_folder%\custom animations"
IF NOT EXIST "*.vpk" goto :EOF

title Checking animations...
echo Checking custom animations:

::delete temp just in case
cd "%vm_customizer_folder%\custom animations"
IF EXIST custom_vm_temp del custom_vm_temp >nul
IF EXIST custom_vm_temp_1 del custom_vm_temp_1
IF EXIST custom_vm_temp_2 del custom_vm_temp_2
IF EXIST last_used_vpks del last_used_vpks

:check_for_vpks
cd "%vm_customizer_folder%\custom animations"
dir "%cd%" /b >> custom_vm_temp_1
findstr /e /C:".vpk" "custom_vm_temp_1" >> custom_vm_temp_2
IF EXIST custom_vm_temp_1 del custom_vm_temp_1
IF EXIST custom_vm_temp_2 ren "custom_vm_temp_2" "custom_vm_temp"
::make list of files to compare changes
dir "%cd%" >> last_used_vpks_temp_1
findstr /e /C:".vpk" "last_used_vpks_temp_1" >> last_used_vpks_temp_2
IF EXIST last_used_vpks_temp_1 del last_used_vpks_temp_1
IF EXIST last_used_vpks_temp_2 ren "last_used_vpks_temp_2" "last_used_vpks"

:check_for_changes
IF NOT EXIST "%dev_folder%\decompiled_custom_animations\last_used_vpks" goto :check_for_changes_done
FC "%vm_customizer_folder%\custom animations\last_used_vpks" "%dev_folder%\decompiled_custom_animations\last_used_vpks" >nul
IF %errorlevel%==0 goto :check_for_changes_done
cd "%dev_folder%"
IF EXIST "decompiled_custom_animations_temp"  rd /s /q "decompiled_custom_animations_temp"
IF EXIST "decompiled_custom_animations"  rd /s /q "decompiled_custom_animations"
:check_for_changes_done


:loop
::check if file is empty, exit if yes
cd "%vm_customizer_folder%\custom animations"
set size=0
for /f %%i in ("custom_vm_temp") do set size=%%~zi
IF NOT %size% gtr 0 goto :custom_mods_installed

::check the list of mods
for /f "delims=*" %%f in (custom_vm_temp) do (
	set custom_animation=%%f
	goto :check_mod )
	
:check_mod
::make required folders
cd "%dev_folder%"
IF NOT EXIST decompiled_custom_animations mkdir decompiled_custom_animations
IF NOT EXIST decompiled_custom_animations_temp mkdir decompiled_custom_animations_temp
del /Q "%dev_folder%\decompiled_custom_animations_temp\*"

::skip if already checked
cd "%dev_folder%\decompiled_custom_animations"
IF EXIST "%custom_animation%.extracted" goto :check_loop

::extract viewmodel files
cd "%dev_folder%"
HLExtract.exe -s -p "%vm_customizer_folder%\custom animations\%custom_animation%" -d "%dev_folder%\decompiled_custom_animations_temp" -e "models\weapons\c_models\c_scout_animations.mdl" >nul
HLExtract.exe -s -p "%vm_customizer_folder%\custom animations\%custom_animation%" -d "%dev_folder%\decompiled_custom_animations_temp" -e "models\weapons\c_models\c_soldier_animations.mdl" >nul
HLExtract.exe -s -p "%vm_customizer_folder%\custom animations\%custom_animation%" -d "%dev_folder%\decompiled_custom_animations_temp" -e "models\weapons\c_models\c_pyro_animations.mdl" >nul
HLExtract.exe -s -p "%vm_customizer_folder%\custom animations\%custom_animation%" -d "%dev_folder%\decompiled_custom_animations_temp" -e "models\weapons\c_models\c_demo_animations.mdl" >nul
HLExtract.exe -s -p "%vm_customizer_folder%\custom animations\%custom_animation%" -d "%dev_folder%\decompiled_custom_animations_temp" -e "models\weapons\c_models\c_heavy_animations.mdl" >nul
HLExtract.exe -s -p "%vm_customizer_folder%\custom animations\%custom_animation%" -d "%dev_folder%\decompiled_custom_animations_temp" -e "models\weapons\c_models\c_engineer_animations.mdl" >nul
HLExtract.exe -s -p "%vm_customizer_folder%\custom animations\%custom_animation%" -d "%dev_folder%\decompiled_custom_animations_temp" -e "models\weapons\c_models\c_medic_animations.mdl" >nul
HLExtract.exe -s -p "%vm_customizer_folder%\custom animations\%custom_animation%" -d "%dev_folder%\decompiled_custom_animations_temp" -e "models\weapons\c_models\c_sniper_animations.mdl" >nul
HLExtract.exe -s -p "%vm_customizer_folder%\custom animations\%custom_animation%" -d "%dev_folder%\decompiled_custom_animations_temp" -e "models\weapons\c_models\c_spy_animations.mdl" >nul

::mark as incompatible if no animation models exist
cd "%dev_folder%\decompiled_custom_animations_temp"
IF NOT EXIST c_scout_animations.mdl IF NOT EXIST c_soldier_animations.mdl IF NOT EXIST c_pyro_animations.mdl IF NOT EXIST c_demo_animations.mdl IF NOT EXIST c_heavy_animations.mdl IF NOT EXIST c_engineer_animations.mdl IF NOT EXIST c_medic_animations.mdl IF NOT EXIST c_sniper_animations.mdl IF NOT EXIST c_spy_animations.mdl goto :incompatible_mod

::Decompile them
::Workaround for crowbar settings bug present in CrowbarCommandLine - part 1
cd /d "%appdata%"
IF EXIST "CrowbarDecompiler 0.71" cd "CrowbarDecompiler 0.71"
IF EXIST "Crowbar Settings Backup.xml" (
	IF EXIST "Crowbar Settings.xml" del "Crowbar Settings.xml" && ren "Crowbar Settings Backup.xml" "Crowbar Settings.xml"
	IF NOT EXIST "Crowbar Settings.xml" ren "Crowbar Settings Backup.xml" "Crowbar Settings.xml" )
IF EXIST "Crowbar Settings.xml" ren "Crowbar Settings.xml" "Crowbar Settings Backup.xml"
::Actual decompiling
:start_decompiling
cd /d "%dev_folder%"
title Checking %custom_animation%...
echo Checking %custom_animation%:
IF EXIST "%dev_folder%\decompiled_custom_animations_temp\c_scout_animations.mdl" (
	CrowbarDecompiler.exe "%dev_folder%\decompiled_custom_animations_temp\c_scout_animations.mdl" "%dev_folder%\decompiled_custom_animations_temp" >nul )
IF EXIST "%dev_folder%\decompiled_custom_animations_temp\c_soldier_animations.mdl" (	
	CrowbarDecompiler.exe "%dev_folder%\decompiled_custom_animations_temp\c_soldier_animations.mdl" "%dev_folder%\decompiled_custom_animations_temp" >nul )
IF EXIST "%dev_folder%\decompiled_custom_animations_temp\c_pyro_animations.mdl" (	
	CrowbarDecompiler.exe "%dev_folder%\decompiled_custom_animations_temp\c_pyro_animations.mdl" "%dev_folder%\decompiled_custom_animations_temp" >nul )
IF EXIST "%dev_folder%\decompiled_custom_animations_temp\c_demo_animations.mdl" (	
	CrowbarDecompiler.exe "%dev_folder%\decompiled_custom_animations_temp\c_demo_animations.mdl" "%dev_folder%\decompiled_custom_animations_temp" >nul )
IF EXIST "%dev_folder%\decompiled_custom_animations_temp\c_heavy_animations.mdl" (	
	CrowbarDecompiler.exe "%dev_folder%\decompiled_custom_animations_temp\c_heavy_animations.mdl" "%dev_folder%\decompiled_custom_animations_temp" >nul )
IF EXIST "%dev_folder%\decompiled_custom_animations_temp\c_engineer_animations.mdl" (	
	CrowbarDecompiler.exe "%dev_folder%\decompiled_custom_animations_temp\c_engineer_animations.mdl" "%dev_folder%\decompiled_custom_animations_temp" >nul )
IF EXIST "%dev_folder%\decompiled_custom_animations_temp\c_medic_animations.mdl" (	
	CrowbarDecompiler.exe "%dev_folder%\decompiled_custom_animations_temp\c_medic_animations.mdl" "%dev_folder%\decompiled_custom_animations_temp" >nul )
IF EXIST "%dev_folder%\decompiled_custom_animations_temp\c_sniper_animations.mdl" (	
	CrowbarDecompiler.exe "%dev_folder%\decompiled_custom_animations_temp\c_sniper_animations.mdl" "%dev_folder%\decompiled_custom_animations_temp" >nul )
IF EXIST "%dev_folder%\decompiled_custom_animations_temp\c_spy_animations.mdl" (	
	CrowbarDecompiler.exe "%dev_folder%\decompiled_custom_animations_temp\c_spy_animations.mdl" "%dev_folder%\decompiled_custom_animations_temp" >nul )
::Restore settings
cd /d "%appdata%"
cd /d "%appdata%"
IF EXIST "CrowbarDecompiler 0.71" cd "CrowbarDecompiler 0.71"
IF EXIST "Crowbar Settings Backup.xml" (
	IF EXIST "Crowbar Settings.xml" del "Crowbar Settings.xml" && ren "Crowbar Settings Backup.xml" "Crowbar Settings.xml"
	IF NOT EXIST "Crowbar Settings.xml" ren "Crowbar Settings Backup.xml" "Crowbar Settings.xml" )
cd /d "%dev_folder%"

::delete raw MDLs
cd "%dev_folder%\decompiled_custom_animations_temp"
IF EXIST "c_scout_animations.mdl" del "c_scout_animations.mdl"
IF EXIST "c_soldier_animations.mdl" del "c_soldier_animations.mdl"
IF EXIST "c_pyro_animations.mdl" del "c_pyro_animations.mdl"
IF EXIST "c_demo_animations.mdl" del "c_demo_animations.mdl"
IF EXIST "c_heavy_animations.mdl" del "c_heavy_animations.mdl"
IF EXIST "c_engineer_animations.mdl" del "c_engineer_animations.mdl"
IF EXIST "c_medic_animations.mdl" del "c_medic_animations.mdl"
IF EXIST "c_sniper_animations.mdl" del "c_sniper_animations.mdl"
IF EXIST "c_spy_animations.mdl" del "c_spy_animations.mdl"

::general fixes
:: 1 - replace $modelname intances with the default ones - prevents compiling errors
cd "%dev_folder%\decompiled_custom_animations_temp"

:fix_modelname_1
IF NOT EXIST c_scout_animations.qc goto :fix_modelname_end_1
set input_qc=c_scout_animations.qc
set "$modelname=$modelname "weapons/c_models/c_scout_animations.mdl""
IF EXIST replace_modelname_1 del replace_modelname_1 >nul
IF EXIST replace_modelname_2 del replace_modelname_2 >nul
IF EXIST replace_modelname_3 del replace_modelname_3 >nul
findstr /i /v /c:"$modelname" "%input_qc%" > replace_modelname_2
echo %$modelname% > replace_modelname_1
copy "replace_modelname_1" + "replace_modelname_2" "replace_modelname_3" >nul
move "replace_modelname_3" "%input_qc%" >nul
IF EXIST replace_modelname_1 del replace_modelname_1 >nul
IF EXIST replace_modelname_2 del replace_modelname_2 >nul
IF EXIST replace_modelname_3 del replace_modelname_3 >nul
:fix_modelname_end_1

:fix_modelname_2
IF NOT EXIST c_soldier_animations.qc goto :fix_modelname_end_2
set input_qc=c_soldier_animations.qc
set "$modelname=$modelname "weapons/c_models/c_soldier_animations.mdl""
IF EXIST replace_modelname_1 del replace_modelname_1 >nul
IF EXIST replace_modelname_2 del replace_modelname_2 >nul
IF EXIST replace_modelname_3 del replace_modelname_3 >nul
findstr /i /v /c:"$modelname" "%input_qc%" > replace_modelname_2
echo %$modelname% > replace_modelname_1
copy "replace_modelname_1" + "replace_modelname_2" "replace_modelname_3" >nul
move "replace_modelname_3" "%input_qc%" >nul
IF EXIST replace_modelname_1 del replace_modelname_1 >nul
IF EXIST replace_modelname_2 del replace_modelname_2 >nul
IF EXIST replace_modelname_3 del replace_modelname_3 >nul
:fix_modelname_end_2

:fix_modelname_3
IF NOT EXIST c_pyro_animations.qc goto :fix_modelname_end_3
set input_qc=c_pyro_animations.qc
set "$modelname=$modelname "weapons\c_models\c_pyro_animations.mdl""
IF EXIST replace_modelname_1 del replace_modelname_1 >nul
IF EXIST replace_modelname_2 del replace_modelname_2 >nul
IF EXIST replace_modelname_3 del replace_modelname_3 >nul
findstr /i /v /c:"$modelname" "%input_qc%" > replace_modelname_2
echo %$modelname% > replace_modelname_1
copy "replace_modelname_1" + "replace_modelname_2" "replace_modelname_3" >nul
move "replace_modelname_3" "%input_qc%" >nul
IF EXIST replace_modelname_1 del replace_modelname_1 >nul
IF EXIST replace_modelname_2 del replace_modelname_2 >nul
IF EXIST replace_modelname_3 del replace_modelname_3 >nul
:fix_modelname_end_3

:fix_modelname_4
IF NOT EXIST c_demo_animations.qc goto :fix_modelname_end_4
set input_qc=c_demo_animations.qc
set "$modelname=$modelname "weapons/c_models/c_demo_animations.mdl""
IF EXIST replace_modelname_1 del replace_modelname_1 >nul
IF EXIST replace_modelname_2 del replace_modelname_2 >nul
IF EXIST replace_modelname_3 del replace_modelname_3 >nul
findstr /i /v /c:"$modelname" "%input_qc%" > replace_modelname_2
echo %$modelname% > replace_modelname_1
copy "replace_modelname_1" + "replace_modelname_2" "replace_modelname_3" >nul
move "replace_modelname_3" "%input_qc%" >nul
IF EXIST replace_modelname_1 del replace_modelname_1 >nul
IF EXIST replace_modelname_2 del replace_modelname_2 >nul
IF EXIST replace_modelname_3 del replace_modelname_3 >nul
:fix_modelname_end_4

:fix_modelname_5
IF NOT EXIST c_heavy_animations.qc goto :fix_modelname_end_5
set input_qc=c_heavy_animations.qc
set "$modelname=$modelname "weapons/c_models/c_heavy_animations.mdl""
IF EXIST replace_modelname_1 del replace_modelname_1 >nul
IF EXIST replace_modelname_2 del replace_modelname_2 >nul
IF EXIST replace_modelname_3 del replace_modelname_3 >nul
findstr /i /v /c:"$modelname" "%input_qc%" > replace_modelname_2
echo %$modelname% > replace_modelname_1
copy "replace_modelname_1" + "replace_modelname_2" "replace_modelname_3" >nul
move "replace_modelname_3" "%input_qc%" >nul
IF EXIST replace_modelname_1 del replace_modelname_1 >nul
IF EXIST replace_modelname_2 del replace_modelname_2 >nul
IF EXIST replace_modelname_3 del replace_modelname_3 >nul
:fix_modelname_end_5

:fix_modelname_6
IF NOT EXIST c_engineer_animations.qc goto :fix_modelname_end_6
set input_qc=c_engineer_animations.qc
set "$modelname=$modelname "weapons\c_models\c_engineer_animations.mdl""
IF EXIST replace_modelname_1 del replace_modelname_1 >nul
IF EXIST replace_modelname_2 del replace_modelname_2 >nul
IF EXIST replace_modelname_3 del replace_modelname_3 >nul
findstr /i /v /c:"$modelname" "%input_qc%" > replace_modelname_2
echo %$modelname% > replace_modelname_1
copy "replace_modelname_1" + "replace_modelname_2" "replace_modelname_3" >nul
move "replace_modelname_3" "%input_qc%" >nul
IF EXIST replace_modelname_1 del replace_modelname_1 >nul
IF EXIST replace_modelname_2 del replace_modelname_2 >nul
IF EXIST replace_modelname_3 del replace_modelname_3 >nul
:fix_modelname_end_6

:fix_modelname_7
IF NOT EXIST c_medic_animations.qc goto :fix_modelname_end_7
set input_qc=c_medic_animations.qc
set "$modelname=$modelname "weapons/c_models/c_medic_animations.mdl""
IF EXIST replace_modelname_1 del replace_modelname_1 >nul
IF EXIST replace_modelname_2 del replace_modelname_2 >nul
IF EXIST replace_modelname_3 del replace_modelname_3 >nul
findstr /i /v /c:"$modelname" "%input_qc%" > replace_modelname_2
echo %$modelname% > replace_modelname_1
copy "replace_modelname_1" + "replace_modelname_2" "replace_modelname_3" >nul
move "replace_modelname_3" "%input_qc%" >nul
IF EXIST replace_modelname_1 del replace_modelname_1 >nul
IF EXIST replace_modelname_2 del replace_modelname_2 >nul
IF EXIST replace_modelname_3 del replace_modelname_3 >nul
:fix_modelname_end_7

:fix_modelname_8
IF NOT EXIST c_sniper_animations.qc goto :fix_modelname_end_8
set input_qc=c_sniper_animations.qc
set "$modelname=$modelname "weapons/c_models/c_sniper_animations.mdl""
IF EXIST replace_modelname_1 del replace_modelname_1 >nul
IF EXIST replace_modelname_2 del replace_modelname_2 >nul
IF EXIST replace_modelname_3 del replace_modelname_3 >nul
findstr /i /v /c:"$modelname" "%input_qc%" > replace_modelname_2
echo %$modelname% > replace_modelname_1
copy "replace_modelname_1" + "replace_modelname_2" "replace_modelname_3" >nul
move "replace_modelname_3" "%input_qc%" >nul
IF EXIST replace_modelname_1 del replace_modelname_1 >nul
IF EXIST replace_modelname_2 del replace_modelname_2 >nul
IF EXIST replace_modelname_3 del replace_modelname_3 >nul
:fix_modelname_end_8

:fix_modelname_9
IF NOT EXIST c_spy_animations.qc goto :fix_modelname_end_9
set input_qc=c_spy_animations.qc
set "$modelname=$modelname "weapons/c_models/c_spy_animations.mdl""
IF EXIST replace_modelname_1 del replace_modelname_1 >nul
IF EXIST replace_modelname_2 del replace_modelname_2 >nul
IF EXIST replace_modelname_3 del replace_modelname_3 >nul
findstr /i /v /c:"$modelname" "%input_qc%" > replace_modelname_2
echo %$modelname% > replace_modelname_1
copy "replace_modelname_1" + "replace_modelname_2" "replace_modelname_3" >nul
move "replace_modelname_3" "%input_qc%" >nul
IF EXIST replace_modelname_1 del replace_modelname_1 >nul
IF EXIST replace_modelname_2 del replace_modelname_2 >nul
IF EXIST replace_modelname_3 del replace_modelname_3 >nul
:fix_modelname_end_9

::2 - remove duplicate r_handposes weightlist if needed - prevents compile failure
cd "%dev_folder%\decompiled_custom_animations_temp"

:weightlist_fix_1
IF NOT EXIST c_scout_animations.qc goto :weightlist_fix_done_1
set %input_qc%=c_scout_animations.qc
IF EXIST "temp_weightlist_fix" del "temp_weightlist_fix" >nul
set echo_once=false
set "weightlist_name=$weightlist "weights_r_handposes" {"
FOR /F "tokens=*" %%A IN (%input_qc%) DO (
  IF !echo_once!==true set "weightlist_name=$weightlist "weights_r_handposes_BUGGED" {"
  set echo_me=%%A
  IF "%%A" EQU "$weightlist "weights_r_handposes" {" (
	set "echo_me=!weightlist_name!"
	set "echo_once=true" )
  ECHO. !echo_me!
) >> temp_weightlist_fix
move "temp_weightlist_fix" "%input_qc%" >nul
:weightlist_fix_done_1

:weightlist_fix_2
IF NOT EXIST c_soldier_animations.qc goto :weightlist_fix_done_2
set %input_qc%=c_soldier_animations.qc
IF EXIST "temp_weightlist_fix" del "temp_weightlist_fix" >nul
set echo_once=false
set "weightlist_name=$weightlist "weights_r_handposes" {"
FOR /F "tokens=*" %%A IN (%input_qc%) DO (
  IF !echo_once!==true set "weightlist_name=$weightlist "weights_r_handposes_BUGGED" {"
  set echo_me=%%A
  IF "%%A" EQU "$weightlist "weights_r_handposes" {" (
	set "echo_me=!weightlist_name!"
	set "echo_once=true" )
  ECHO. !echo_me!
) >> temp_weightlist_fix
move "temp_weightlist_fix" "%input_qc%" >nul
:weightlist_fix_done_2

:weightlist_fix_3
IF NOT EXIST c_pyro_animations.qc goto :weightlist_fix_done_3
set %input_qc%=c_pyro_animations.qc
IF EXIST "temp_weightlist_fix" del "temp_weightlist_fix" >nul
set echo_once=false
set "weightlist_name=$weightlist "weights_r_handposes" {"
FOR /F "tokens=*" %%A IN (%input_qc%) DO (
  IF !echo_once!==true set "weightlist_name=$weightlist "weights_r_handposes_BUGGED" {"
  set echo_me=%%A
  IF "%%A" EQU "$weightlist "weights_r_handposes" {" (
	set "echo_me=!weightlist_name!"
	set "echo_once=true" )
  ECHO. !echo_me!
) >> temp_weightlist_fix
move "temp_weightlist_fix" "%input_qc%" >nul
:weightlist_fix_done_3

:weightlist_fix_4
IF NOT EXIST c_demo_animations.qc goto :weightlist_fix_done_4
set %input_qc%=c_demo_animations.qc
IF EXIST "temp_weightlist_fix" del "temp_weightlist_fix" >nul
set echo_once=false
set "weightlist_name=$weightlist "weights_r_handposes" {"
FOR /F "tokens=*" %%A IN (%input_qc%) DO (
  IF !echo_once!==true set "weightlist_name=$weightlist "weights_r_handposes_BUGGED" {"
  set echo_me=%%A
  IF "%%A" EQU "$weightlist "weights_r_handposes" {" (
	set "echo_me=!weightlist_name!"
	set "echo_once=true" )
  ECHO. !echo_me!
) >> temp_weightlist_fix
move "temp_weightlist_fix" "%input_qc%" >nul
:weightlist_fix_done_4

:weightlist_fix_5
IF NOT EXIST c_heavy_animations.qc goto :weightlist_fix_done_5
set %input_qc%=c_heavy_animations.qc
IF EXIST "temp_weightlist_fix" del "temp_weightlist_fix" >nul
set echo_once=false
set "weightlist_name=$weightlist "weights_r_handposes" {"
FOR /F "tokens=*" %%A IN (%input_qc%) DO (
  IF !echo_once!==true set "weightlist_name=$weightlist "weights_r_handposes_BUGGED" {"
  set echo_me=%%A
  IF "%%A" EQU "$weightlist "weights_r_handposes" {" (
	set "echo_me=!weightlist_name!"
	set "echo_once=true" )
  ECHO. !echo_me!
) >> temp_weightlist_fix
move "temp_weightlist_fix" "%input_qc%" >nul
:weightlist_fix_done_5

:weightlist_fix_6
IF NOT EXIST c_engineer_animations.qc goto :weightlist_fix_done_6
set %input_qc%=c_engineer_animations.qc
IF EXIST "temp_weightlist_fix" del "temp_weightlist_fix" >nul
set echo_once=false
set "weightlist_name=$weightlist "weights_r_handposes" {"
FOR /F "tokens=*" %%A IN (%input_qc%) DO (
  IF !echo_once!==true set "weightlist_name=$weightlist "weights_r_handposes_BUGGED" {"
  set echo_me=%%A
  IF "%%A" EQU "$weightlist "weights_r_handposes" {" (
	set "echo_me=!weightlist_name!"
	set "echo_once=true" )
  ECHO. !echo_me!
) >> temp_weightlist_fix
move "temp_weightlist_fix" "%input_qc%" >nul
:weightlist_fix_done_6

:weightlist_fix_7
IF NOT EXIST c_medic_animations.qc goto :weightlist_fix_done_7
set %input_qc%=c_medic_animations.qc
IF EXIST "temp_weightlist_fix" del "temp_weightlist_fix" >nul
set echo_once=false
set "weightlist_name=$weightlist "weights_r_handposes" {"
FOR /F "tokens=*" %%A IN (%input_qc%) DO (
  IF !echo_once!==true set "weightlist_name=$weightlist "weights_r_handposes_BUGGED" {"
  set echo_me=%%A
  IF "%%A" EQU "$weightlist "weights_r_handposes" {" (
	set "echo_me=!weightlist_name!"
	set "echo_once=true" )
  ECHO. !echo_me!
) >> temp_weightlist_fix
move "temp_weightlist_fix" "%input_qc%" >nul
:weightlist_fix_done_7

:weightlist_fix_8
IF NOT EXIST c_sniper_animations.qc goto :weightlist_fix_done_8
set %input_qc%=c_sniper_animations.qc
IF EXIST "temp_weightlist_fix" del "temp_weightlist_fix" >nul
set echo_once=false
set "weightlist_name=$weightlist "weights_r_handposes" {"
FOR /F "tokens=*" %%A IN (%input_qc%) DO (
  IF !echo_once!==true set "weightlist_name=$weightlist "weights_r_handposes_BUGGED" {"
  set echo_me=%%A
  IF "%%A" EQU "$weightlist "weights_r_handposes" {" (
	set "echo_me=!weightlist_name!"
	set "echo_once=true" )
  ECHO. !echo_me!
) >> temp_weightlist_fix
move "temp_weightlist_fix" "%input_qc%" >nul
:weightlist_fix_done_8

:weightlist_fix_9
IF NOT EXIST c_spy_animations.qc goto :weightlist_fix_done_9
set %input_qc%=c_spy_animations.qc
IF EXIST "temp_weightlist_fix" del "temp_weightlist_fix" >nul
set echo_once=false
set "weightlist_name=$weightlist "weights_r_handposes" {"
FOR /F "tokens=*" %%A IN (%input_qc%) DO (
  IF !echo_once!==true set "weightlist_name=$weightlist "weights_r_handposes_BUGGED" {"
  set echo_me=%%A
  IF "%%A" EQU "$weightlist "weights_r_handposes" {" (
	set "echo_me=!weightlist_name!"
	set "echo_once=true" )
  ECHO. !echo_me!
) >> temp_weightlist_fix
move "temp_weightlist_fix" "%input_qc%" >nul
:weightlist_fix_done_9

::ball throw activity fix
:ball_fix
set skip_one=no
IF NOT EXIST c_pyro_animations.qc goto :ball_fix_done
FOR /F "tokens=*" %%A IN (c_pyro_animations.qc) DO (
	IF NOT "%%A" EQU ""c_pyro_animations_anims\PASSTIME_ball_throw_end.smd"" IF NOT !skip_one!==yes echo.%%A
	IF NOT "%%A" EQU ""c_pyro_animations_anims\PASSTIME_ball_throw_end.smd"" IF !skip_one!==yes set skip_one=no
	IF "%%A" EQU ""c_pyro_animations_anims\PASSTIME_ball_throw_end.smd"" (
		set skip_one=yes
		echo."c_pyro_animations_anims\PASSTIME_ball_throw_end.smd"
		echo.activity "ACT_BALL_VM_THROW_END" 1 )
	) >> temp_ballfix
move "temp_ballfix" "c_pyro_animations.qc" >nul
:ball_fix_done


::attempt to recompile and check for errors
cd "%tf_folder%"
IF EXIST "models" ren "models" "models_backup" 

cd "%dev_folder%\decompiled_custom_animations_temp"
IF EXIST "error_check.txt" del "error_check.txt" >nul

cd "%bin_folder%"
IF EXIST "%dev_folder%\decompiled_custom_animations_temp\c_scout_animations.qc" studiomdl -quiet -fastbuild -nop4 "%dev_folder%\decompiled_custom_animations_temp\c_scout_animations.qc" >> "%dev_folder%\decompiled_custom_animations_temp\error_check.txt" 
IF EXIST "%dev_folder%\decompiled_custom_animations_temp\c_soldier_animations.qc" studiomdl -quiet -fastbuild -nop4 "%dev_folder%\decompiled_custom_animations_temp\c_soldier_animations.qc" >> "%dev_folder%\decompiled_custom_animations_temp\error_check.txt" 
IF EXIST "%dev_folder%\decompiled_custom_animations_temp\c_pyro_animations.qc" studiomdl -quiet -fastbuild -nop4 "%dev_folder%\decompiled_custom_animations_temp\c_pyro_animations.qc" >> "%dev_folder%\decompiled_custom_animations_temp\error_check.txt" 
IF EXIST "%dev_folder%\decompiled_custom_animations_temp\c_demo_animations.qc" studiomdl -quiet -fastbuild -nop4 "%dev_folder%\decompiled_custom_animations_temp\c_demo_animations.qc" >> "%dev_folder%\decompiled_custom_animations_temp\error_check.txt" 
IF EXIST "%dev_folder%\decompiled_custom_animations_temp\c_heavy_animations.qc" studiomdl -quiet -fastbuild -nop4 "%dev_folder%\decompiled_custom_animations_temp\c_heavy_animations.qc" >> "%dev_folder%\decompiled_custom_animations_temp\error_check.txt" 
IF EXIST "%dev_folder%\decompiled_custom_animations_temp\c_engineer_animations.qc" studiomdl -quiet -fastbuild -nop4 "%dev_folder%\decompiled_custom_animations_temp\c_engineer_animations.qc" >> "%dev_folder%\decompiled_custom_animations_temp\error_check.txt" 
IF EXIST "%dev_folder%\decompiled_custom_animations_temp\c_medic_animations.qc" studiomdl -quiet -fastbuild -nop4 "%dev_folder%\decompiled_custom_animations_temp\c_medic_animations.qc" >> "%dev_folder%\decompiled_custom_animations_temp\error_check.txt" 
IF EXIST "%dev_folder%\decompiled_custom_animations_temp\c_sniper_animations.qc" studiomdl -quiet -fastbuild -nop4 "%dev_folder%\decompiled_custom_animations_temp\c_sniper_animations.qc" >> "%dev_folder%\decompiled_custom_animations_temp\error_check.txt" 
IF EXIST "%dev_folder%\decompiled_custom_animations_temp\c_spy_animations.qc" studiomdl -quiet -fastbuild -nop4 "%dev_folder%\decompiled_custom_animations_temp\c_spy_animations.qc" >> "%dev_folder%\decompiled_custom_animations_temp\error_check.txt" 

cd "%tf_folder%"
IF EXIST "models"  rd /s /q "models"
IF EXIST "models_backup" ren "models_backup" "models"

cd "%dev_folder%\decompiled_custom_animations_temp"
for /f "usebackq" %%b in (`type error_check.txt ^| find /I "error"`) do (
  goto :incompatible_mod
  )
)

cd "%dev_folder%\decompiled_custom_animations_temp"

IF EXIST c_scout_animations.qc (
	for /f "usebackq" %%b in (`type c_scout_animations.qc ^| find /I "$includemodel"`) do (
		goto :incompatible_mod )
)

IF EXIST c_soldier_animations.qc (
	for /f "usebackq" %%b in (`type c_soldier_animations.qc ^| find /I "$includemodel"`) do (
		goto :incompatible_mod )
)

IF EXIST c_pyro_animations.qc (
	for /f "usebackq" %%b in (`type c_pyro_animations.qc ^| find /I "$includemodel"`) do (
		goto :incompatible_mod )
)

IF EXIST c_demo_animations.qc (
	for /f "usebackq" %%b in (`type c_demo_animations.qc ^| find /I "$includemodel"`) do (
		goto :incompatible_mod )
)

IF EXIST c_heavy_animations.qc (
	for /f "usebackq" %%b in (`type c_heavy_animations.qc ^| find /I "$includemodel"`) do (
		goto :incompatible_mod )
)

IF EXIST c_engineer_animations.qc (
	for /f "usebackq" %%b in (`type c_engineer_animations.qc ^| find /I "$includemodel"`) do (
		goto :incompatible_mod )
)

IF EXIST c_medic_animations.qc (
	for /f "usebackq" %%b in (`type c_medic_animations.qc ^| find /I "$includemodel"`) do (
		goto :incompatible_mod )
)

IF EXIST c_sniper_animations.qc (
	for /f "usebackq" %%b in (`type c_sniper_animations.qc ^| find /I "$includemodel"`) do (
		goto :incompatible_mod )
)

IF EXIST c_spy_animations.qc (
	for /f "usebackq" %%b in (`type c_spy_animations.qc ^| find /I "$includemodel"`) do (
		goto :incompatible_mod )
)

cd "%dev_folder%\decompiled_custom_animations_temp"
echo If this file exists, %custom_animation% has already been checked and extracted > "%custom_animation%.extracted"


:check_loop
echo		 %custom_animation% checked and installed.
cd "%dev_folder%"
xcopy /y "decompiled_custom_animations_temp" "decompiled_custom_animations" /e /q >nul
IF EXIST "decompiled_custom_animations_temp"  rd /s /q "decompiled_custom_animations_temp"
cd "%vm_customizer_folder%\custom animations"
IF EXIST "custom_vm_temp" more +1 "custom_vm_temp" > "custom_vm_temp_2"
IF EXIST "custom_vm_temp_2" move "custom_vm_temp_2" "custom_vm_temp" >nul
goto :loop

:incompatible_mod
echo		 %custom_animation% is not compatible. Removing...
cd "%vm_customizer_folder%\custom animations"
del "%custom_animation%" >nul
cd "%dev_folder%"
IF EXIST "decompiled_custom_animations_temp"  rd /s /q "decompiled_custom_animations_temp"
cd "%vm_customizer_folder%\custom animations"
IF EXIST "custom_vm_temp" more +1 "custom_vm_temp" > "custom_vm_temp_2"
IF EXIST "custom_vm_temp_2" move "custom_vm_temp_2" "custom_vm_temp" >nul
goto :loop

:custom_mods_installed
echo All custom mods checked, compatible ones have been installed.
cd "%dev_folder%"
IF EXIST "decompiled_custom_animations_temp"  rd /s /q "decompiled_custom_animations_temp"
::clear temp
cd "%vm_customizer_folder%\custom animations"
IF EXIST custom_vm_temp del custom_vm_temp
IF EXIST custom_vm_temp_1 del custom_vm_temp_1
IF EXIST custom_vm_temp_2 del custom_vm_temp_2
IF EXIST last_used_vpks del last_used_vpks
cd "%dev_folder%\decompiled_custom_animations"
IF EXIST error_check.txt del error_check.txt >nul
::make list of last used vpks
cd "%vm_customizer_folder%\custom animations"
dir "%cd%" >> last_used_vpks_temp_1
findstr /e /C:".vpk" "last_used_vpks_temp_1" >> last_used_vpks_temp_2
IF EXIST last_used_vpks_temp_1 del last_used_vpks_temp_1
IF EXIST last_used_vpks_temp_2 ren "last_used_vpks_temp_2" "last_used_vpks"
move "last_used_vpks" "%dev_folder%\decompiled_custom_animations\last_used_vpks" >nul
goto :EOF