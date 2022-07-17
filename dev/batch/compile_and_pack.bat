::this script compiles all the animations
::creates a vpk with the animations and other files (such as preloading files)

::make backup if models folder first, in case user has any custom files in there
cd %tf_folder%
IF EXIST "models" ren "models" "models_backup" 

::check for dev settings
cd %bin_folder%
IF %apply_only_for_scout%==true (
	title Compiling Scout Animations...
	echo Compiling Scout Animations...
	studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_scout_animations.qc"
	goto :compile_done )

IF %apply_only_for_soldier%==true (
	title Compiling Soldier Animations...
	echo Compiling Soldier Animations...
	studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_soldier_animations.qc"
	goto :compile_done )

IF %apply_only_for_pyro%==true (
	title Compiling Pyro Animations...
	echo Compiling Pyro Animations...
	studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_pyro_animations.qc"
	goto :compile_done )

IF %apply_only_for_demoman%==true (
	title Compiling Demoman Animations...
	echo Compiling Demoman Animations...
	studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_demo_animations.qc"
	goto :compile_done )

IF %apply_only_for_heavy%==true (
	title Compiling Heavy Animations...
	echo Compiling Heavy Animations...
	studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_heavy_animations.qc"
	goto :compile_done )

IF %apply_only_for_engineer%==true (
	title Compiling Engineer Animations...
	echo Compiling Engineer Animations...
	studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_engineer_animations.qc"
	goto :compile_done )

IF %apply_only_for_medic%==true (
	title Compiling Medic Animations...
	echo Compiling Medic Animations...
	studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_medic_animations.qc"
	goto :compile_done )

IF %apply_only_for_sniper%==true (
	title Compiling Sniper Animations...
	echo Compiling Sniper Animations...
	studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_sniper_animations.qc"
	goto :compile_done )

IF %apply_only_for_spy%==true (
	title Compiling Spy Animations...
	echo Compiling Spy Animations...
	studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_spy_animations.qc"
	goto :compile_done )

:compile_start
::compile everything in the temp folder
cd %bin_folder%

title Compiling Scout Animations...
echo Compiling Scout Animations...
studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_scout_animations.qc"

title Compiling Soldier Animations...
echo Compiling Soldier Animations...
studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_soldier_animations.qc"

title Compiling Pyro Animations...
echo Compiling Pyro Animations...
studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_pyro_animations.qc"

title Compiling Demoman Animations...
echo Compiling Demoman Animations...
studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_demo_animations.qc"

title Compiling Heavy Animations...
echo Compiling Heavy Animations...
studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_heavy_animations.qc"

title Compiling Engineer Animations...
echo Compiling Engineer Animations...
studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_engineer_animations.qc"

title Compiling Medic Animations...
echo Compiling Medic Animations...
studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_medic_animations.qc"

title Compiling Sniper Animations...
echo Compiling Sniper Animations...
studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_sniper_animations.qc"

title Compiling Spy Animations...
echo Compiling Spy Animations...
studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_spy_animations.qc"
:compile_done

cd %dev_folder%
IF EXIST "create_vpk_temp"  rd /s /q "create_vpk_temp"
mkdir create_vpk_temp
cd %tf_folder%
move "models" "%dev_folder%\create_vpk_temp\models"

::restore models folder if needed
cd %tf_folder%
IF EXIST "models_backup" ren "models_backup" "models"

::set vpk package name
set vpk_name=_Horsie'sViewmodelEditor

::rename temp vpk folder
cd %dev_folder%
IF EXIST %vpk_name% rd /s /q "%vpk_name%"
IF EXIST "create_vpk_temp" ren "create_vpk_temp" "%vpk_name%"

::remove existing vpk from dev if needed
cd %dev_folder%
IF EXIST "%vpk_name%_dir.vpk" del "%vpk_name%_dir.vpk"
IF EXIST "%vpk_name%_000.vpk" del "%vpk_name%_000.vpk"
IF EXIST "%vpk_name%_001.vpk" del "%vpk_name%_001.vpk"
IF EXIST "%vpk_name%_002.vpk" del "%vpk_name%_002.vpk"
IF EXIST "%vpk_name%_003.vpk" del "%vpk_name%_003.vpk"
IF EXIST "%vpk_name%_004.vpk" del "%vpk_name%_004.vpk"

::remove existing vpk from custom if needed
cd %custom_folder%
IF EXIST "%vpk_name%.vpk.sound.cache" del "%vpk_name%.vpk.sound.cache"
IF EXIST "%vpk_name%_dir.vpk" del "%vpk_name%_dir.vpk"
IF EXIST "%vpk_name%_000.vpk" del "%vpk_name%_000.vpk"
IF EXIST "%vpk_name%_001.vpk" del "%vpk_name%_001.vpk"
IF EXIST "%vpk_name%_002.vpk" del "%vpk_name%_002.vpk"
IF EXIST "%vpk_name%_003.vpk" del "%vpk_name%_003.vpk"
IF EXIST "%vpk_name%_004.vpk" del "%vpk_name%_004.vpk"

:automatic_preloading
::copy preload files
cd %dev_folder%
xcopy "preload_files" "%vpk_name%" /e /q
cd %dev_folder%\%vpk_name%
IF NOT EXIST "cfg" mkdir "cfg"

::check main menu setting
IF %automatic_preloading%==off goto :automatic_preloading_end

::add automatic preloading
::extract and rename valve.rc
cd %dev_folder%
HLExtract.exe -s -p "%tf_folder%\tf2_misc_dir.vpk" -d "%vpk_name%\cfg" -e "cfg\valve.rc"
cd %dev_folder%\%vpk_name%\cfg
IF EXIST valve.rc ren "valve.rc" "valve_rc_temp"
::scan for other valve.rc files in custom
cd %dev_folder%\%vpk_name%
IF EXIST preloading_temp del preloading_temp
dir "%custom_folder%" /s /b | find /i "valve.rc" >> preloading_temp
set "custom_valve_rc=""
for /f "delims=*" %%f in (preloading_temp) do set custom_valve_rc=%%f
::replace valve.rc based on files found
IF EXIST preloading_temp del preloading_temp
IF EXIST "%custom_valve_rc%" copy "%custom_valve_rc%" "%dev_folder%\%vpk_name%\cfg\valve_rc_temp"
cd %dev_folder%\%vpk_name%\cfg
IF EXIST valve_rc_temp ren "valve_rc_temp" "valve.rc"
::add preloading
echo exec preloading.cfg >> valve.rc
:automatic_preloading_end

::create vpks
cd %bin_folder% 
VPK -M "%dev_folder%\%vpk_name%"

::delete temp folder
cd %dev_folder% 
rd /s /q "%vpk_name%"

::move vpks
cd %dev_folder% 
IF EXIST "%vpk_name%_dir.vpk" move "%vpk_name%_dir.vpk" "%custom_folder%\%vpk_name%_dir.vpk"
IF EXIST "%vpk_name%_000.vpk" move "%vpk_name%_000.vpk" "%custom_folder%\%vpk_name%_000.vpk"
IF EXIST "%vpk_name%_001.vpk" move "%vpk_name%_001.vpk" "%custom_folder%\%vpk_name%_001.vpk"
IF EXIST "%vpk_name%_001.vpk" move "%vpk_name%_002.vpk" "%custom_folder%\%vpk_name%_002.vpk"
IF EXIST "%vpk_name%_003.vpk" move "%vpk_name%_003.vpk" "%custom_folder%\%vpk_name%_003.vpk"
IF EXIST "%vpk_name%_004.vpk" move "%vpk_name%_004.vpk" "%custom_folder%\%vpk_name%_004.vpk"





 






