::This script extracts and applies animations from the fixed viewmodels vpk if it exist

@echo OFF

::delete temp just in case
cd "%vm_customizer_folder%\fixed viewmodels addon"
IF EXIST fixed_vm_temp del fixed_vm_temp
IF EXIST fixed_vm_temp_1 del fixed_vm_temp_1
IF EXIST fixed_vm_temp_2 del fixed_vm_temp_2

::check if extracted already
cd %dev_folder%
IF NOT EXIST "decompiled_fixed_animations" goto :check_for_vpk
cd "decompiled_fixed_animations"
IF NOT EXIST c_scout_animations.qc goto :check_for_vpk
IF NOT EXIST c_soldier_animations.qc goto :check_for_vpk
IF NOT EXIST c_pyro_animations.qc goto :check_for_vpk
IF NOT EXIST c_demo_animations.qc goto :check_for_vpk
IF NOT EXIST c_heavy_animations.qc goto :check_for_vpk
IF NOT EXIST c_engineer_animations.qc goto :check_for_vpk
IF NOT EXIST c_medic_animations.qc goto :check_for_vpk
IF NOT EXIST c_sniper_animations.qc goto :check_for_vpk
IF NOT EXIST c_spy_animations.qc goto :check_for_vpk
IF EXIST "animations_already_extracted.txt" goto :animations_already_extracted

:check_for_vpk
cd "%vm_customizer_folder%\fixed viewmodels addon"
dir "%cd%" /s /b >> fixed_vm_temp_1
findstr /e /C:".vpk" "fixed_vm_temp_1" >> fixed_vm_temp_2
IF EXIST fixed_vm_temp_1 del fixed_vm_temp_1
IF EXIST fixed_vm_temp_2 ren "fixed_vm_temp_2" "fixed_vm_temp"
for /f "delims=*" %%f in (fixed_vm_temp) do set fixed_vm_vpk=%%f
IF EXIST fixed_vm_temp del fixed_vm_temp
IF EXIST fixed_vm_temp_1 del fixed_vm_temp_1
IF EXIST fixed_vm_temp_2 del fixed_vm_temp_2

IF EXIST "%fixed_vm_vpk%" goto :extract_vpk
IF NOT EXIST "%fixed_vm_vpk%" goto :no_vpk_detected

:extract_vpk
::extract models from fixed vm pack
cd %dev_folder%
IF NOT EXIST decompiled_fixed_animations mkdir decompiled_fixed_animations
del /Q "%dev_folder%\decompiled_fixed_animations\*"

title Extracting fixed animations...
echo Extracting fixed animations...
HLExtract.exe -s -p "%fixed_vm_vpk%" -d "%dev_folder%\decompiled_fixed_animations" -e "models\weapons\c_models\c_scout_animations.mdl" >nul
HLExtract.exe -s -p "%fixed_vm_vpk%" -d "%dev_folder%\decompiled_fixed_animations" -e "models\weapons\c_models\c_soldier_animations.mdl" >nul
HLExtract.exe -s -p "%fixed_vm_vpk%" -d "%dev_folder%\decompiled_fixed_animations" -e "models\weapons\c_models\c_pyro_animations.mdl" >nul
HLExtract.exe -s -p "%fixed_vm_vpk%" -d "%dev_folder%\decompiled_fixed_animations" -e "models\weapons\c_models\c_demo_animations.mdl" >nul
HLExtract.exe -s -p "%fixed_vm_vpk%" -d "%dev_folder%\decompiled_fixed_animations" -e "models\weapons\c_models\c_heavy_animations.mdl" >nul
HLExtract.exe -s -p "%fixed_vm_vpk%" -d "%dev_folder%\decompiled_fixed_animations" -e "models\weapons\c_models\c_engineer_animations.mdl" >nul
HLExtract.exe -s -p "%fixed_vm_vpk%" -d "%dev_folder%\decompiled_fixed_animations" -e "models\weapons\c_models\c_medic_animations.mdl" >nul
HLExtract.exe -s -p "%fixed_vm_vpk%" -d "%dev_folder%\decompiled_fixed_animations" -e "models\weapons\c_models\c_sniper_animations.mdl" >nul
HLExtract.exe -s -p "%fixed_vm_vpk%" -d "%dev_folder%\decompiled_fixed_animations" -e "models\weapons\c_models\c_spy_animations.mdl" >nul

::mark as incompatible if no animation models exist
cd "%dev_folder%\decompiled_fixed_animations"
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
title Decompiling fixed animations...
echo Decompiling fixed animations...
CrowbarDecompiler.exe "%dev_folder%\decompiled_fixed_animations\c_scout_animations.mdl" "%dev_folder%\decompiled_fixed_animations" >nul
CrowbarDecompiler.exe "%dev_folder%\decompiled_fixed_animations\c_soldier_animations.mdl" "%dev_folder%\decompiled_fixed_animations" >nul
CrowbarDecompiler.exe "%dev_folder%\decompiled_fixed_animations\c_pyro_animations.mdl" "%dev_folder%\decompiled_fixed_animations" >nul
CrowbarDecompiler.exe "%dev_folder%\decompiled_fixed_animations\c_demo_animations.mdl" "%dev_folder%\decompiled_fixed_animations" >nul
CrowbarDecompiler.exe "%dev_folder%\decompiled_fixed_animations\c_heavy_animations.mdl" "%dev_folder%\decompiled_fixed_animations" >nul
CrowbarDecompiler.exe "%dev_folder%\decompiled_fixed_animations\c_engineer_animations.mdl" "%dev_folder%\decompiled_fixed_animations" >nul
CrowbarDecompiler.exe "%dev_folder%\decompiled_fixed_animations\c_medic_animations.mdl" "%dev_folder%\decompiled_fixed_animations" >nul
CrowbarDecompiler.exe "%dev_folder%\decompiled_fixed_animations\c_sniper_animations.mdl" "%dev_folder%\decompiled_fixed_animations" >nul
CrowbarDecompiler.exe "%dev_folder%\decompiled_fixed_animations\c_spy_animations.mdl" "%dev_folder%\decompiled_fixed_animations" >nul
::Restore settings
cd /d "%appdata%"
IF EXIST "CrowbarDecompiler 0.71" cd "CrowbarDecompiler 0.71"
IF EXIST "Crowbar Settings Backup.xml" (
	IF EXIST "Crowbar Settings.xml" del "Crowbar Settings.xml" && ren "Crowbar Settings Backup.xml" "Crowbar Settings.xml"
	IF NOT EXIST "Crowbar Settings.xml" ren "Crowbar Settings Backup.xml" "Crowbar Settings.xml" )
cd /d "%dev_folder%"

::Delete raw MDLs
IF EXIST "%dev_folder%\decompiled_fixed_animations\c_scout_animations.mdl" del "%dev_folder%\decompiled_fixed_animations\c_scout_animations.mdl" >nul
IF EXIST "%dev_folder%\decompiled_fixed_animations\c_soldier_animations.mdl" del "%dev_folder%\decompiled_fixed_animations\c_soldier_animations.mdl" >nul
IF EXIST "%dev_folder%\decompiled_fixed_animations\c_pyro_animations.mdl" del "%dev_folder%\decompiled_fixed_animations\c_pyro_animations.mdl" >nul
IF EXIST "%dev_folder%\decompiled_fixed_animations\c_demo_animations.mdl" del "%dev_folder%\decompiled_fixed_animations\c_demo_animations.mdl" >nul
IF EXIST "%dev_folder%\decompiled_fixed_animations\c_heavy_animations.mdl" del "%dev_folder%\decompiled_fixed_animations\c_heavy_animations.mdl" >nul
IF EXIST "%dev_folder%\decompiled_fixed_animations\c_engineer_animations.mdl" del "%dev_folder%\decompiled_fixed_animations\c_engineer_animations.mdl" >nul
IF EXIST "%dev_folder%\decompiled_fixed_animations\c_medic_animations.mdl" del "%dev_folder%\decompiled_fixed_animations\c_medic_animations.mdl" >nul
IF EXIST "%dev_folder%\decompiled_fixed_animations\c_sniper_animations.mdl" del "%dev_folder%\decompiled_fixed_animations\c_sniper_animations.mdl" >nul
IF EXIST "%dev_folder%\decompiled_fixed_animations\c_spy_animations.mdl" del "%dev_folder%\decompiled_fixed_animations\c_spy_animations.mdl" >nul

::attempt to recompile and check for errors
cd "%tf_folder%"
IF EXIST "models" ren "models" "models_backup" 

cd "%dev_folder%\decompiled_fixed_animations"
IF EXIST "error_check.txt" del "error_check.txt" >nul

cd "%bin_folder%"
IF EXIST "%dev_folder%\decompiled_fixed_animations\c_scout_animations.qc" studiomdl -quiet -fastbuild -nop4 "%dev_folder%\decompiled_fixed_animations\c_scout_animations.qc" >> "%dev_folder%\decompiled_fixed_animations\error_check.txt" 
IF EXIST "%dev_folder%\decompiled_fixed_animations\c_soldier_animations.qc" studiomdl -quiet -fastbuild -nop4 "%dev_folder%\decompiled_fixed_animations\c_soldier_animations.qc" >> "%dev_folder%\decompiled_fixed_animations\error_check.txt" 
IF EXIST "%dev_folder%\decompiled_fixed_animations\c_pyro_animations.qc" studiomdl -quiet -fastbuild -nop4 "%dev_folder%\decompiled_fixed_animations\c_pyro_animations.qc" >> "%dev_folder%\decompiled_fixed_animations\error_check.txt" 
IF EXIST "%dev_folder%\decompiled_fixed_animations\c_demo_animations.qc" studiomdl -quiet -fastbuild -nop4 "%dev_folder%\decompiled_fixed_animations\c_demo_animations.qc" >> "%dev_folder%\decompiled_fixed_animations\error_check.txt" 
IF EXIST "%dev_folder%\decompiled_fixed_animations\c_heavy_animations.qc" studiomdl -quiet -fastbuild -nop4 "%dev_folder%\decompiled_fixed_animations\c_heavy_animations.qc" >> "%dev_folder%\decompiled_fixed_animations\error_check.txt" 
IF EXIST "%dev_folder%\decompiled_fixed_animations\c_engineer_animations.qc" studiomdl -quiet -fastbuild -nop4 "%dev_folder%\decompiled_fixed_animations\c_engineer_animations.qc" >> "%dev_folder%\decompiled_fixed_animations\error_check.txt" 
IF EXIST "%dev_folder%\decompiled_fixed_animations\c_medic_animations.qc" studiomdl -quiet -fastbuild -nop4 "%dev_folder%\decompiled_fixed_animations\c_medic_animations.qc" >> "%dev_folder%\decompiled_fixed_animations\error_check.txt" 
IF EXIST "%dev_folder%\decompiled_fixed_animations\c_sniper_animations.qc" studiomdl -quiet -fastbuild -nop4 "%dev_folder%\decompiled_fixed_animations\c_sniper_animations.qc" >> "%dev_folder%\decompiled_fixed_animations\error_check.txt" 
IF EXIST "%dev_folder%\decompiled_fixed_animations\c_spy_animations.qc" studiomdl -quiet -fastbuild -nop4 "%dev_folder%\decompiled_fixed_animations\c_spy_animations.qc" >> "%dev_folder%\decompiled_fixed_animations\error_check.txt" 

cd "%tf_folder%"
IF EXIST "models"  rd /s /q "models"
IF EXIST "models_backup" ren "models_backup" "models"

cd "%dev_folder%\decompiled_fixed_animations"
	for /f "usebackq" %%b in (`type error_check.txt ^| find /I "error"`) do (
		goto :incompatible_mod )

::Mark them as extracted to avoid extracting on each run
cd "%dev_folder%\decompiled_fixed_animations"
IF NOT EXIST c_scout_animations.qc goto :animation_extract_error
IF NOT EXIST c_soldier_animations.qc goto :animation_extract_error
IF NOT EXIST c_pyro_animations.qc goto :animation_extract_error
IF NOT EXIST c_demo_animations.qc goto :animation_extract_error
IF NOT EXIST c_heavy_animations.qc goto :animation_extract_error
IF NOT EXIST c_engineer_animations.qc goto :animation_extract_error
IF NOT EXIST c_medic_animations.qc goto :animation_extract_error
IF NOT EXIST c_sniper_animations.qc goto :animation_extract_error
IF NOT EXIST c_spy_animations.qc goto :animation_extract_error
echo If this file exists, the files have been extracted already. > animations_already_extracted.txt

::Fixes
::fix extracted kunai-type knives and sharp dresser having jittery idle after decompiling
IF EXIST "%dev_folder%\extra_animation_fixes\acr_idle.smd" (
	del "%dev_folder%\decompiled_fixed_animations\c_spy_animations_anims\acr_idle.smd" >nul
	copy "%dev_folder%\extra_animation_fixes\acr_idle.smd" "%dev_folder%\decompiled_fixed_animations\c_spy_animations_anims\acr_idle.smd" >nul )

IF EXIST "%dev_folder%\extra_animation_fixes\eternal_idle.smd" (
	del "%dev_folder%\decompiled_fixed_animations\c_spy_animations_anims\eternal_idle.smd" >nul
	copy "%dev_folder%\extra_animation_fixes\eternal_idle.smd" "%dev_folder%\decompiled_fixed_animations\c_spy_animations_anims\eternal_idle.smd" >nul )

::exit
cls
echo Fixed animations extracted...
exit /b

:no_vpk_detected
echo No fixed viewmodels VPK detected, skipping...
exit /b

:animations_already_extracted
echo Fixed animations already extracted. Skipping...
exit /b

:incompatible_mod
echo Bad fixed animations VPK detected. Skipping...
cd "%dev_folder%"
IF EXIST "decompiled_fixed_animations" rd /s /q "decompiled_fixed_animations"
exit /b


:animation_extract_error
title Fixed animations extraction failed. Aborting...
echo Fixed animations extraction failed. Aborting...
