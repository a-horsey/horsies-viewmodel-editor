::this script compiles all the animations
::creates a vpk with the animations and other files (such as preloading files)

::check_if_vpk_is_in_use
cd "%custom_folder%"
IF NOT EXIST "%vpk_name%.vpk" goto :start_compiling
2>nul (
	>>%vpk_name%.vpk echo off
 )	&& (goto :start_compiling) || (goto :vpk_in_use)
goto :start_compiling

:vpk_in_use
cd "%dev_folder%"
IF EXIST "decompiled_animations_temp" rd /s /q "decompiled_animations_temp"
cls
color 4f
echo Error! Game is currently running.
echo Please close the game and try again.
echo.
endlocal
pause
exit

:start_compiling
::make backup if models folder first, in case user has any custom files in there
cd "%tf_folder%"
IF EXIST "models" ren "models" "models_backup" 

::check if per-class or for all
IF %apply_for_specific_classes%==true goto :compile_per_class
IF NOT %apply_for_specific_classes%==true goto :compile_for_all

:compile_per_class
cd "%bin_folder%"

IF %apply_per_class_scout%==true (
	title Compiling Scout Animations...
	echo		 Compiling Scout Animations...
	studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_scout_animations.qc" )

IF %apply_per_class_soldier%==true (
	title Compiling Soldier Animations...
	echo		 Compiling Soldier Animations...
	studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_soldier_animations.qc" )

IF %apply_per_class_pyro%==true (
	title Compiling Pyro Animations...
	echo		 Compiling Pyro Animations...
	studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_pyro_animations.qc" )

IF %apply_per_class_demoman%==true (
	title Compiling Demoman Animations...
	echo		 Compiling Demoman Animations...
	studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_demo_animations.qc" )

IF %apply_per_class_heavy%==true (
	title Compiling Heavy Animations...
	echo		 Compiling Heavy Animations...
	studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_heavy_animations.qc" )

IF %apply_per_class_engineer%==true (
	title Compiling Engineer Animations...
	echo		 Compiling Engineer Animations...
	studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_engineer_animations.qc" )

IF %apply_per_class_medic%==true (
	title Compiling Medic Animations...
	echo		 Compiling Medic Animations...
	studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_medic_animations.qc" )

IF %apply_per_class_sniper%==true (
	title Compiling Sniper Animations...
	echo		 Compiling Sniper Animations...
	studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_sniper_animations.qc" )

IF %apply_per_class_spy%==true (
	title Compiling Spy Animations...
	echo		 Compiling Spy Animations...
	studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_spy_animations.qc" )
goto :compile_done

:compile_for_all
::compile everything in the temp folder
cd "%bin_folder%"

title Compiling Scout Animations...
echo		 Compiling Scout Animations...
studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_scout_animations.qc"

title Compiling Soldier Animations...
echo		 Compiling Soldier Animations...
studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_soldier_animations.qc"

title Compiling Pyro Animations...
echo		 Compiling Pyro Animations...
studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_pyro_animations.qc"

title Compiling Demoman Animations...
echo		 Compiling Demoman Animations...
studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_demo_animations.qc"

title Compiling Heavy Animations...
echo		 Compiling Heavy Animations...
studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_heavy_animations.qc"

title Compiling Engineer Animations...
echo		 Compiling Engineer Animations...
studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_engineer_animations.qc"

title Compiling Medic Animations...
echo		 Compiling Medic Animations...
studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_medic_animations.qc"

title Compiling Sniper Animations...
echo		 Compiling Sniper Animations...
studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_sniper_animations.qc"

title Compiling Spy Animations...
echo		 Compiling Spy Animations...
studiomdl -quiet -fastbuild -nop4 "%qc_folder_temp%\c_spy_animations.qc"
:compile_done

cd "%dev_folder%"
IF EXIST "create_vpk_temp"  rd /s /q "create_vpk_temp"
mkdir create_vpk_temp
cd "%tf_folder%"
move "models" "%dev_folder%\create_vpk_temp\models" >nul

::restore models folder if needed
cd "%tf_folder%"
IF EXIST "models_backup" ren "models_backup" "models"

::set vpk package name - not needed, set in generate.bat now
::set vpk_name=_Horsie'sViewmodelEditor

::rename temp vpk folder
cd "%dev_folder%"
IF EXIST %vpk_name% rd /s /q "%vpk_name%"
IF EXIST "create_vpk_temp" ren "create_vpk_temp" "%vpk_name%"

::remove existing vpk from dev if needed
cd "%dev_folder%"
IF EXIST "%vpk_name%.vpk" del "%vpk_name%.vpk"

::remove existing vpk from custom if needed
cd "%custom_folder%"
IF EXIST "%vpk_name%.vpk.sound.cache" del "%vpk_name%.vpk.sound.cache"
IF EXIST "%vpk_name%.vpk" del "%vpk_name%.vpk"

::copy preload files
cd "%dev_folder%"
xcopy "preload_files" "%vpk_name%" /e /q >nul
cd "%dev_folder%\%vpk_name%"
IF NOT EXIST "cfg" mkdir "cfg"

:automatic_preloading
IF %automatic_preloading%==off IF %disable_tracers%==off IF %hide_errors%==off goto :automatic_preloading_end

::add automatic preloading
::extract and rename valve.rc
cd "%dev_folder%"
HLExtract.exe -s -p "%tf_folder%\tf2_misc_dir.vpk" -d "%vpk_name%\cfg" -e "cfg\valve.rc"
cd "%dev_folder%\%vpk_name%\cfg"
IF EXIST valve.rc ren "valve.rc" "valve_rc_temp"

::scan for other valve.rc files in custom
cd "%dev_folder%\%vpk_name%"
IF EXIST preloading_temp del preloading_temp
dir "%custom_folder%" /s /b | find /i "valve.rc" >> preloading_temp
set "custom_valve_rc=""
for /f "delims=*" %%f in (preloading_temp) do set custom_valve_rc=%%f

::replace valve.rc based on files found
IF EXIST preloading_temp del preloading_temp
IF EXIST "%custom_valve_rc%" copy "%custom_valve_rc%" "%dev_folder%\%vpk_name%\cfg\valve_rc_temp"  >nul
cd "%dev_folder%\%vpk_name%\cfg"
IF EXIST valve_rc_temp ren "valve_rc_temp" "valve.rc"

::add preloading, tracer disabling and error hiding
IF %automatic_preloading%==on echo exec preloading.cfg >> valve.rc
IF %disable_tracers%==on echo r_drawtracers_firstperson 0 >> valve.rc
IF %hide_errors%==on echo con_filter_enable 1; con_filter_text_out "particle" >> valve.rc


:automatic_preloading_end

::create vpks
cd "%bin_folder%" 
VPK "%dev_folder%\%vpk_name%" >nul

::delete temp folder
cd "%dev_folder%" 
rd /s /q "%vpk_name%"

::delete old legacy split vpks if they exist, added after I changed packaging method
::should remove this part of code at some point 
cd "%custom_folder%"
IF EXIST "_Horsie'sViewmodelEditor.vpk.sound.cache" del "_Horsie'sViewmodelEditor.vpk.sound.cache"
IF EXIST "_Horsie'sViewmodelEditor_dir.vpk" del "_Horsie'sViewmodelEditor_dir.vpk"
IF EXIST "_Horsie'sViewmodelEditor_000.vpk" del "_Horsie'sViewmodelEditor_000.vpk"
IF EXIST "_Horsie'sViewmodelEditor_001.vpk" del "_Horsie'sViewmodelEditor_001.vpk"
IF EXIST "_Horsie'sViewmodelEditor_002.vpk" del "_Horsie'sViewmodelEditor_002.vpk"
IF EXIST "_Horsie'sViewmodelEditor_003.vpk" del "_Horsie'sViewmodelEditor_003.vpk"
IF EXIST "_Horsie'sViewmodelEditor_004.vpk" del "_Horsie'sViewmodelEditor_004.vpk"

::move vpks
cd "%dev_folder%" 
IF EXIST "%vpk_name%.vpk" move "%vpk_name%.vpk" "%custom_folder%\%vpk_name%.vpk" >nul