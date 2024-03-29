::This script extracts and decompiles all the viewmodel animations straight from TF2's files
::Will only run if there are no animations extracted already

@echo OFF
title Checking extracted animations...

cd "%dev_folder%"
IF NOT EXIST "decompiled_animations" mkdir "decompiled_animations"
set animations_folder=%dev_folder%\decompiled_animations
cd "%animations_folder%"
IF NOT EXIST c_scout_animations.qc goto :extract_animations
IF NOT EXIST c_soldier_animations.qc goto :extract_animations
IF NOT EXIST c_pyro_animations.qc goto :extract_animations
IF NOT EXIST c_demo_animations.qc goto :extract_animations
IF NOT EXIST c_heavy_animations.qc goto :extract_animations
IF NOT EXIST c_engineer_animations.qc goto :extract_animations
IF NOT EXIST c_medic_animations.qc goto :extract_animations
IF NOT EXIST c_sniper_animations.qc goto :extract_animations
IF NOT EXIST c_spy_animations.qc goto :extract_animations
IF EXIST "animations_already_extracted.txt" goto :animations_already_extracted

:extract_animations
::make sure animations_folder is empty
cd "%animations_folder%"
del /Q "%animations_folder%\*"
cd "%dev_folder%"
echo First script run detected...

::Extract the MDLs for the viewmodels straight from tf_misc_dir
title Extracting animations...
echo Extracting animations...
HLExtract.exe -s -p "%tf_folder%\tf2_misc_dir.vpk" -d "%animations_folder%" -e "models\weapons\c_models\c_scout_animations.mdl"
HLExtract.exe -s -p "%tf_folder%\tf2_misc_dir.vpk" -d "%animations_folder%" -e "models\weapons\c_models\c_soldier_animations.mdl"
HLExtract.exe -s -p "%tf_folder%\tf2_misc_dir.vpk" -d "%animations_folder%" -e "models\weapons\c_models\c_pyro_animations.mdl"
HLExtract.exe -s -p "%tf_folder%\tf2_misc_dir.vpk" -d "%animations_folder%" -e "models\weapons\c_models\c_demo_animations.mdl"
HLExtract.exe -s -p "%tf_folder%\tf2_misc_dir.vpk" -d "%animations_folder%" -e "models\weapons\c_models\c_heavy_animations.mdl"
HLExtract.exe -s -p "%tf_folder%\tf2_misc_dir.vpk" -d "%animations_folder%" -e "models\weapons\c_models\c_engineer_animations.mdl"
HLExtract.exe -s -p "%tf_folder%\tf2_misc_dir.vpk" -d "%animations_folder%" -e "models\weapons\c_models\c_medic_animations.mdl"
HLExtract.exe -s -p "%tf_folder%\tf2_misc_dir.vpk" -d "%animations_folder%" -e "models\weapons\c_models\c_sniper_animations.mdl"
HLExtract.exe -s -p "%tf_folder%\tf2_misc_dir.vpk" -d "%animations_folder%" -e "models\weapons\c_models\c_spy_animations.mdl"

::Decompile them - make sure settings stay intact
cd /d "%appdata%"
IF EXIST "CrowbarDecompiler 0.71" cd "CrowbarDecompiler 0.71"
IF EXIST "Crowbar Settings Backup.xml" (
	IF EXIST "Crowbar Settings.xml" del "Crowbar Settings.xml" && ren "Crowbar Settings Backup.xml" "Crowbar Settings.xml"
	IF NOT EXIST "Crowbar Settings.xml" ren "Crowbar Settings Backup.xml" "Crowbar Settings.xml" )
IF EXIST "Crowbar Settings.xml" ren "Crowbar Settings.xml" "Crowbar Settings Backup.xml"
::Actual decompiling
:start_decompiling
cd /d "%dev_folder%"
title Decompiling animations...
echo Decompiling animations...
CrowbarDecompiler.exe "%animations_folder%\c_scout_animations.mdl" "%animations_folder%" >nul
CrowbarDecompiler.exe "%animations_folder%\c_soldier_animations.mdl" "%animations_folder%" >nul
CrowbarDecompiler.exe "%animations_folder%\c_pyro_animations.mdl" "%animations_folder%" >nul
CrowbarDecompiler.exe "%animations_folder%\c_demo_animations.mdl" "%animations_folder%" >nul
CrowbarDecompiler.exe "%animations_folder%\c_heavy_animations.mdl" "%animations_folder%" >nul
CrowbarDecompiler.exe "%animations_folder%\c_engineer_animations.mdl" "%animations_folder%" >nul
CrowbarDecompiler.exe "%animations_folder%\c_medic_animations.mdl" "%animations_folder%" >nul
CrowbarDecompiler.exe "%animations_folder%\c_sniper_animations.mdl" "%animations_folder%" >nul
CrowbarDecompiler.exe "%animations_folder%\c_spy_animations.mdl" "%animations_folder%" >nul
::Restore settings
cd /d "%appdata%"
cd /d "%appdata%"
IF EXIST "CrowbarDecompiler 0.71" cd "CrowbarDecompiler 0.71"
IF EXIST "Crowbar Settings Backup.xml" (
	IF EXIST "Crowbar Settings.xml" del "Crowbar Settings.xml" && ren "Crowbar Settings Backup.xml" "Crowbar Settings.xml"
	IF NOT EXIST "Crowbar Settings.xml" ren "Crowbar Settings Backup.xml" "Crowbar Settings.xml" )
cd /d "%dev_folder%"

::Delete raw MDLs
del "%animations_folder%\c_scout_animations.mdl"
del "%animations_folder%\c_soldier_animations.mdl"
del "%animations_folder%\c_pyro_animations.mdl"
del "%animations_folder%\c_demo_animations.mdl"
del "%animations_folder%\c_heavy_animations.mdl"
del "%animations_folder%\c_engineer_animations.mdl"
del "%animations_folder%\c_medic_animations.mdl"
del "%animations_folder%\c_sniper_animations.mdl"
del "%animations_folder%\c_spy_animations.mdl"

::Mark them as extracted to avoid extracting on each run
cd "%animations_folder%"
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
	del "%dev_folder%\decompiled_animations\c_spy_animations_anims\acr_idle.smd" >nul
	copy "%dev_folder%\extra_animation_fixes\acr_idle.smd" "%dev_folder%\decompiled_animations\c_spy_animations_anims\acr_idle.smd" >nul )

IF EXIST "%dev_folder%\extra_animation_fixes\eternal_idle.smd" (
	del "%dev_folder%\decompiled_animations\c_spy_animations_anims\eternal_idle.smd" >nul
	copy "%dev_folder%\extra_animation_fixes\eternal_idle.smd" "%dev_folder%\decompiled_animations\c_spy_animations_anims\eternal_idle.smd" >nul )

::exit
cls
echo All animations have been extracted.
exit /b

:animations_already_extracted
cls
echo Animations already extracted. Skipping extraction...
exit /b

:animation_extract_error
cls
title Animation extraction failed. Aborting...
echo Animation extraction failed. Aborting...


