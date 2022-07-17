::This script extracts and applies animations from the fixed viewmodels vpk if it exist

@echo OFF
title Checking for fixed viewmodels files...
echo Checking for fixed viewmodels files...

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
HLExtract.exe -s -p "%fixed_vm_vpk%" -d "%dev_folder%\decompiled_fixed_animations" -e "models\weapons\c_models\c_scout_animations.mdl"
HLExtract.exe -s -p "%fixed_vm_vpk%" -d "%dev_folder%\decompiled_fixed_animations" -e "models\weapons\c_models\c_soldier_animations.mdl"
HLExtract.exe -s -p "%fixed_vm_vpk%" -d "%dev_folder%\decompiled_fixed_animations" -e "models\weapons\c_models\c_pyro_animations.mdl"
HLExtract.exe -s -p "%fixed_vm_vpk%" -d "%dev_folder%\decompiled_fixed_animations" -e "models\weapons\c_models\c_demo_animations.mdl"
HLExtract.exe -s -p "%fixed_vm_vpk%" -d "%dev_folder%\decompiled_fixed_animations" -e "models\weapons\c_models\c_heavy_animations.mdl"
HLExtract.exe -s -p "%fixed_vm_vpk%" -d "%dev_folder%\decompiled_fixed_animations" -e "models\weapons\c_models\c_engineer_animations.mdl"
HLExtract.exe -s -p "%fixed_vm_vpk%" -d "%dev_folder%\decompiled_fixed_animations" -e "models\weapons\c_models\c_medic_animations.mdl"
HLExtract.exe -s -p "%fixed_vm_vpk%" -d "%dev_folder%\decompiled_fixed_animations" -e "models\weapons\c_models\c_sniper_animations.mdl"
HLExtract.exe -s -p "%fixed_vm_vpk%" -d "%dev_folder%\decompiled_fixed_animations" -e "models\weapons\c_models\c_spy_animations.mdl"

::Decompile them
::Workaround for crowbar settings bug present in CrowbarCommandLine - part 1
cd %appdata%
IF EXIST "ZeqMacaw\" cd "ZeqMacaw\"
IF EXIST "Crowbar 0.68\" cd "Crowbar 0.68\"
IF EXIST "Crowbar Settings.xml_backup" goto :start_decompiling
IF EXIST "Crowbar Settings.xml" ren "Crowbar Settings.xml" "Crowbar Settings.xml_backup"
::Actual decompiling
:start_decompiling
cd "%dev_folder%"
title Decompiling fixed animations...
echo Decompiling fixed animations...
CrowbarCommandLineDecomp.exe -p "%dev_folder%\decompiled_fixed_animations\c_scout_animations.mdl" -o "%dev_folder%\decompiled_fixed_animations"
CrowbarCommandLineDecomp.exe -p "%dev_folder%\decompiled_fixed_animations\c_soldier_animations.mdl" -o "%dev_folder%\decompiled_fixed_animations"
CrowbarCommandLineDecomp.exe -p "%dev_folder%\decompiled_fixed_animations\c_pyro_animations.mdl" -o "%dev_folder%\decompiled_fixed_animations"
CrowbarCommandLineDecomp.exe -p "%dev_folder%\decompiled_fixed_animations\c_demo_animations.mdl" -o "%dev_folder%\decompiled_fixed_animations"
CrowbarCommandLineDecomp.exe -p "%dev_folder%\decompiled_fixed_animations\c_heavy_animations.mdl" -o "%dev_folder%\decompiled_fixed_animations"
CrowbarCommandLineDecomp.exe -p "%dev_folder%\decompiled_fixed_animations\c_engineer_animations.mdl" -o "%dev_folder%\decompiled_fixed_animations"
CrowbarCommandLineDecomp.exe -p "%dev_folder%\decompiled_fixed_animations\c_medic_animations.mdl" -o "%dev_folder%\decompiled_fixed_animations"
CrowbarCommandLineDecomp.exe -p "%dev_folder%\decompiled_fixed_animations\c_sniper_animations.mdl" -o "%dev_folder%\decompiled_fixed_animations"
CrowbarCommandLineDecomp.exe -p "%dev_folder%\decompiled_fixed_animations\c_spy_animations.mdl" -o "%dev_folder%\decompiled_fixed_animations"
::Workaround - part 2 - restores user settings if they exist
cd %appdata%
IF EXIST "ZeqMacaw\" cd "ZeqMacaw\"
IF EXIST "Crowbar 0.68\" cd "Crowbar 0.68\"
IF EXIST "Crowbar Settings.xml" del "Crowbar Settings.xml"
IF EXIST "Crowbar Settings.xml_backup" ren "Crowbar Settings.xml_backup" "Crowbar Settings.xml"
cd "%dev_folder%"

::Delete raw MDLs
del "%dev_folder%\decompiled_fixed_animations\c_scout_animations.mdl"
del "%dev_folder%\decompiled_fixed_animations\c_soldier_animations.mdl"
del "%dev_folder%\decompiled_fixed_animations\c_pyro_animations.mdl"
del "%dev_folder%\decompiled_fixed_animations\c_demo_animations.mdl"
del "%dev_folder%\decompiled_fixed_animations\c_heavy_animations.mdl"
del "%dev_folder%\decompiled_fixed_animations\c_engineer_animations.mdl"
del "%dev_folder%\decompiled_fixed_animations\c_medic_animations.mdl"
del "%dev_folder%\decompiled_fixed_animations\c_sniper_animations.mdl"
del "%dev_folder%\decompiled_fixed_animations\c_spy_animations.mdl"

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
echo Fixed animations extracted...
exit /b

:no_vpk_detected
echo No fixed viewmodels VPK detected, skipping...
exit /b

:animations_already_extracted
echo Fixed animations already extracted. Skipping...
exit /b

:animation_extract_error
cls
title Animation extraction failed. Aborting...
echo Animation extraction failed. Aborting...
