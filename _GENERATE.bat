SETLOCAL ENABLEDELAYEDEXPANSION
@echo off
color E0
title Horsie's Viewmodel Editor
cls 

:check_and_set_folders
::Check folders
set vm_customizer_folder=%~dp0
cd "%vm_customizer_folder%"
set vm_customizer_folder=%cd%
cd "%vm_customizer_folder%"
for %%I in (.) do set base_folder=%%~nxI
cd ..\
for %%I in (.) do set check_folder=%%~nxI
cd "%base_folder%"
set "base_folder=%base_folder: =%"
set "check_folder=%check_folder: =%"
IF /I %check_folder%==custom goto :custom_folder
IF /I %check_folder%==tf goto :tf_folder

:wrong_folder
color 4f
echo Wrong folder!
echo Please make sure the program is placed inside your game's "custom" folder or "tf" folder.
echo.
pause
endlocal
goto :eof

:custom_folder
::Set folders
cd "%vm_customizer_folder%"
set vm_customizer_folder=%cd%
cd ..\
set custom_folder=%cd%
set dev_folder=%vm_customizer_folder%\_dev
set batch_folder=%dev_folder%\batch
set animations_folder=%dev_folder%\decompiled_animations
cd ..\
set tf_folder=%cd%
cd ..\
cd bin
set bin_folder=%cd%
cd "%tf_folder%"
cls
IF NOT EXIST tf2_misc_dir.vpk goto :wrong_folder
IF NOT EXIST gameinfo.txt goto :wrong_folder
cd "%vm_customizer_folder%"
goto :check_and_set_folders_done

:tf_folder
::Set folders
cd "%vm_customizer_folder%"
set vm_customizer_folder=%cd%
set dev_folder=%vm_customizer_folder%\_dev
set animations_folder=%dev_folder%\decompiled_animations
set batch_folder=%dev_folder%\batch
cd ..\
set tf_folder=%cd%
set custom_folder=%tf_folder%\custom
cd ..\
cd bin
set bin_folder=%cd%
cd "%tf_folder%"
cls
IF NOT EXIST tf2_misc_dir.vpk goto :wrong_folder
IF NOT EXIST gameinfo.txt goto :wrong_folder
cd "%vm_customizer_folder%"
cd "%vm_customizer_folder%"
goto :check_and_set_folders_done
:check_and_set_folders_done

:check_if_vpk_is_in_use
set vpk_name=_Horsie'sViewmodelEditor
cd %custom_folder%
IF NOT EXIST "%vpk_name%.vpk" goto :del_temp
2>nul (
	>>%vpk_name%.vpk echo off
 )	&& (goto :del_temp) || (goto :vpk_in_use)
goto :del_temp

:vpk_in_use
color 4f
echo Error! Game is currently running.
echo Please close the game and try again.
echo.
endlocal
pause
goto :eof


:del_temp
::delete temp just in case
cd "%dev_folder%"
IF EXIST "decompiled_animations_temp" rd /s /q "decompiled_animations_temp"
::delete custom anims temp too
IF EXIST "decompiled_custom_animations_temp" rd /s /q "decompiled_custom_animations_temp"
::delete custom animations folder if no vpks detected
IF NOT EXIST "%vm_customizer_folder%\custom animations\*.vpk" IF EXIST "%dev_folder%\decompiled_custom_animations" rd /s /q "decompiled_custom_animations"

::restore default settings files if they are missing
cd "%vm_customizer_folder%"
IF NOT EXIST settings_scout.txt copy "%dev_folder%\default_settings\settings_scout.txt" "%vm_customizer_folder%\settings_scout.txt" >nul
IF NOT EXIST settings_soldier.txt copy "%dev_folder%\default_settings\settings_soldier.txt" "%vm_customizer_folder%\settings_soldier.txt" >nul
IF NOT EXIST settings_pyro.txt copy "%dev_folder%\default_settings\settings_pyro.txt" "%vm_customizer_folder%\settings_pyro.txt" >nul
IF NOT EXIST settings_demoman.txt copy "%dev_folder%\default_settings\settings_demoman.txt" "%vm_customizer_folder%\settings_demoman.txt" >nul
IF NOT EXIST settings_heavy.txt copy "%dev_folder%\default_settings\settings_heavy.txt" "%vm_customizer_folder%\settings_heavy.txt" >nul
IF NOT EXIST settings_engineer.txt copy "%dev_folder%\default_settings\settings_engineer.txt" "%vm_customizer_folder%\settings_engineer.txt" >nul
IF NOT EXIST settings_medic.txt copy "%dev_folder%\default_settings\settings_medic.txt" "%vm_customizer_folder%\settings_medic.txt" >nul
IF NOT EXIST settings_sniper.txt copy "%dev_folder%\default_settings\settings_sniper.txt" "%vm_customizer_folder%\settings_sniper.txt" >nul
IF NOT EXIST settings_spy.txt copy "%dev_folder%\default_settings\settings_spy.txt" "%vm_customizer_folder%\settings_spy.txt" >nul

::set default options
set automatic_preloading=on
set fixed_vm_addon=on
set disable_tracers=off
set hide_errors=on
set custom_vm=on
set apply_for_specific_classes=false

::fixed viewmodels files check
IF NOT EXIST "%vm_customizer_folder%\fixed viewmodels addon\*.vpk" IF NOT EXIST "%dev_folder%\decompiled_fixed_animations\animations_already_extracted.txt" set fixed_vm_addon=off


:main_menu
::set some menu variables
IF %automatic_preloading%==on set toggle_preloading=goto :preloading_off
IF %automatic_preloading%==on set automatic_preloading_status=X
IF %automatic_preloading%==off set automatic_preloading_status=_

IF %disable_tracers%==on set toggle_tracers=goto :disable_tracers_off
IF %disable_tracers%==off set toggle_tracers=goto :disable_tracers_on
IF %disable_tracers%==on set disable_tracers_status=X
IF %disable_tracers%==off set disable_tracers_status=_

IF %hide_errors%==on set toggle_errors=goto :hide_errors_off
IF %hide_errors%==on set hide_errors_status=X
IF %hide_errors%==off set hide_errors_status=_

IF %fixed_vm_addon%==on set toggle_fixed_vm_addon=goto :fixed_vm_addon_off
IF %fixed_vm_addon%==off set toggle_fixed_vm_addon=goto :fixed_vm_addon_on
IF %fixed_vm_addon%==on set fixed_vm_addon_status=X
IF %fixed_vm_addon%==off set fixed_vm_addon_status=_

IF %custom_vm%==on set toggle_custom_vm=goto :custom_vm_off%
IF %custom_vm%==off set toggle_custom_vm=goto :custom_vm_on%
IF %custom_vm%==on set custom_vm_status=X
IF %custom_vm%==off set custom_vm_status=_

set apply_for_specific_classes=false
set apply_per_class_scout=false
set apply_per_class_soldier=false
set apply_per_class_pyro=false
set apply_per_class_demoman=false
set apply_per_class_heavy=false
set apply_per_class_engineer=false
set apply_per_class_medic=false
set apply_per_class_sniper=false
set apply_per_class_spy=false

cls
echo.                       ~~%%%%%%%%_,_,
echo.                  ~~%%%%%%%%%-"/./
echo.                 ~~%%%%%%%-'   /  `.
echo.               ~~%%%%%%%%'  .     ,__;
echo.             ~~%%%%%%%%'   :       \O\
echo.          ~~%%%%%%%%'    :          `.
echo.        ~~%%%%%%%%'       `. _,        '
echo.     ~~%%%%%%%%'          .'`-._        `.
echo.  ~~%%%%%%%%%'           :     `-.     (,;
echo. ~~%%%%%%%%'             :         `._\_.'
echo. ~~%%%%%%' Welcome to Horsie's Viewmodel Editor!
echo.
echo.Install: 
echo.	1. Install for all classes
echo.	2. Install for specific classes
echo.
echo.Options:
echo. 	3. [%automatic_preloading_status%] Include automatic preloading
echo. 	4. [%disable_tracers_status%] Remove 1st person bullet tracers
echo.	5. [%hide_errors_status%] Hide console errors
echo. 	0. Developer settings
set custom_or_fixed_vm_present=false
IF EXIST "%vm_customizer_folder%\fixed viewmodels addon\*.vpk" set custom_or_fixed_vm_present=true
IF EXIST "%dev_folder%\decompiled_fixed_animations\animations_already_extracted.txt" set custom_or_fixed_vm_present=true
IF EXIST "%vm_customizer_folder%\custom animations\*vpk" set custom_or_fixed_vm_present=true
IF %custom_or_fixed_vm_present%==true (
	echo.
	echo Toggle animations: )
IF EXIST "%vm_customizer_folder%\fixed viewmodels addon\*.vpk" echo. 	6. [%fixed_vm_addon_status%] Include Fixed Viewmodels
IF NOT EXIST "%vm_customizer_folder%\fixed viewmodels addon\*.vpk" IF EXIST "%dev_folder%\decompiled_fixed_animations\animations_already_extracted.txt" echo. 	5. [%fixed_vm_addon_status%] Include Fixed Viewmodels
IF EXIST "%vm_customizer_folder%\custom animations\*vpk" echo. 	7. [%custom_vm_status%] Include Custom Animations
echo.
SET /P M=Choose an option: 
IF %M%==0 goto :dev_menu
IF %M%==1 goto :install_for_all_classes_prompt
IF %M%==2 goto :pick_classes_menu
IF %M%==3 %toggle_preloading%
IF %M%==4 %toggle_tracers%
IF %M%==5 %toggle_errors%
IF %M%==6 %toggle_fixed_vm_addon%
IF %M%==7 %toggle_custom_vm%
IF NOT %M%==0 IF NOT %M%==1 IF NOT %M%==2 IF NOT %M%==3  IF NOT %M%==4 IF NOT %M%==5 IF NOT %M%==6 IF NOT %M%==7 goto :main_menu
IF NOT EXIST "%vm_customizer_folder%\fixed viewmodels addon\*.vpk" IF NOT EXIST "%dev_folder%\decompiled_fixed_animations\animations_already_extracted.txt" set toggle_fixed_vm_addon=goto :main_menu
IF NOT EXIST "%vm_customizer_folder%\custom animations\*vpk" set toggle_custom_vm=goto :main_menu

:install_for_all_classes_prompt
cls 
echo You're about to install the mod for all the classes.
echo.
SET /P M=Proceed (Y/N):
IF /i %M%==y (
	set apply_for_specific_classes=false
	goto :exit_menu )
IF /i %M%==n goto :main_menu
IF /i NOT %M%==y IF /i NOT %M%==n goto :install_for_all_classes_prompt
goto :main_menu

:preloading_off
cls
echo Warning: Automatic preloading is highly recommended.
echo The edited viewmodels will not work in most servers without it.
echo.
SET /P M=Are you sure that you want to proceed (Y/N):
IF /i %M%==n goto :main_menu
IF /i NOT %M%==y IF /i NOT %M%==n goto :preloading_off
set automatic_preloading=off
set toggle_preloading=goto :preloading_on
goto :main_menu

:preloading_on
set automatic_preloading=on
set toggle_preloading=goto :preloading_off
goto :main_menu

:disable_tracers_off
set disable_tracers=off
set toggle_tracers=goto :disable_tracers_on
goto :main_menu

:disable_tracers_on
set disable_tracers=on
set toggle_tracers=goto :disable_tracers_off
goto :main_menu

:hide_errors_off
cls
echo This option hides the console errors caused by some of the mod's options.
echo Without it, the console might be hard to read due to spam.
echo.
SET /P M=Are you sure that you want to proceed (Y/N):
IF /i %M%==n goto :main_menu
IF /i NOT %M%==y IF /i NOT %M%==n goto :hide_errors_off
set hide_errors=off
set toggle_errors=goto :hide_errors_on
goto :main_menu

:hide_errors_on
set hide_errors=on
set toggle_errors=goto :hide_errors_off
goto :main_menu

:fixed_vm_addon_off
set fixed_vm_addon=off
set toggle_fixed_vm_addon=goto :fixed_vm_addon_on
goto :main_menu

:fixed_vm_addon_on
set fixed_vm_addon=on
set toggle_fixed_vm_addon=goto :fixed_vm_addon_off
goto :main_menu

:custom_vm_off
set custom_vm=off
set toggle_custom_vm=goto :custom_vm_on
goto :main_menu

:custom_vm_on
set custom_vm=on
set toggle_custom_vm=goto :custom_vm_off
goto :main_menu

:pick_classes_menu
set scout_status=_
set soldier_status=_
set pyro_status=_
set demoman_status=_
set heavy_status=_
set engineer_status=_
set medic_status=_
set sniper_status=_
set spy_status=_

set toggle_scout_status=goto :scout_status_ON
set toggle_soldier_status=goto :soldier_status_ON
set toggle_pyro_status=goto :pyro_status_ON
set toggle_demoman_status=goto :demoman_status_ON
set toggle_heavy_status=goto :heavy_status_ON
set toggle_engineer_status=goto :engineer_status_ON
set toggle_medic_status=goto :medic_status_ON
set toggle_sniper_status=goto :sniper_status_ON
set toggle_spy_status=goto :spy_status_ON

set apply_per_class_scout=false
set apply_per_class_soldier=false
set apply_per_class_pyro=false
set apply_per_class_demoman=false
set apply_per_class_heavy=false
set apply_per_class_engineer=false
set apply_per_class_medic=false
set apply_per_class_sniper=false
set apply_per_class_spy=false

:pick_classes_menu_2
cls
echo.                       ~~%%%%%%%%_,_,
echo.                  ~~%%%%%%%%%-"/./
echo.                 ~~%%%%%%%-'   /  `.
echo.               ~~%%%%%%%%'  .     ,__;
echo.             ~~%%%%%%%%'   :       \O\
echo.          ~~%%%%%%%%'    :          `.
echo.        ~~%%%%%%%%'       `. _,        '
echo.     ~~%%%%%%%%'          .'`-._        `.
echo.  ~~%%%%%%%%%'           :     `-.     (,;
echo. ~~%%%%%%%%'             :         `._\_.'
echo. ~~%%%%%%' Welcome to Horsie's Viewmodel Editor!
echo.
echo Toggle classes: 
echo. 	1. [%scout_status%] Scout
echo. 	2. [%soldier_status%] Soldier
echo. 	3. [%pyro_status%] Pyro
echo.	4. [%demoman_status%] Demoman
echo.	5. [%heavy_status%] Heavy
echo.	6. [%engineer_status%] Engineer
echo.	7. [%medic_status%] Medic
echo.	8. [%sniper_status%] Sniper
echo.	9. [%spy_status%] Spy
echo.
echo Options:
echo.	10. Install for selected classes
echo.	0.  Go back
echo.
SET /P M=Choose an option:
IF NOT %M%==0 IF NOT %M%==1 IF NOT %M%==2 IF NOT %M%==3 IF NOT %M%==4 IF NOT %M%==5 IF NOT %M%==6 IF NOT %M%==7 IF NOT %M%==8 IF NOT %M%==9 IF NOT %M%==10 IF NOT %M%==0 goto :pick_classes_menu_2

IF %M%==1 %toggle_scout_status%
IF %M%==2 %toggle_soldier_status%
IF %M%==3 %toggle_pyro_status%
IF %M%==4 %toggle_demoman_status%
IF %M%==5 %toggle_heavy_status%
IF %M%==6 %toggle_engineer_status%
IF %M%==7 %toggle_medic_status%
IF %M%==8 %toggle_sniper_status%
IF %M%==9 %toggle_spy_status%

IF %M%==10 goto :apply_for_selected_classes_prompt
IF %M%==0 goto :main_menu


:scout_status_ON
set scout_status=X
set apply_per_class_scout=true
set toggle_scout_status=goto :scout_status_OFF
goto :pick_classes_menu_2

:soldier_status_ON
set soldier_status=X
set apply_per_class_soldier=true
set toggle_soldier_status=goto :soldier_status_OFF
goto :pick_classes_menu_2

:pyro_status_ON
set pyro_status=X
set apply_per_class_pyro=true
set toggle_pyro_status=goto :pyro_status_OFF
goto :pick_classes_menu_2

:demoman_status_ON
set demoman_status=X
set apply_per_class_demoman=true
set toggle_demoman_status=goto :demoman_status_OFF
goto :pick_classes_menu_2

:heavy_status_ON
set heavy_status=X
set apply_per_class_heavy=true
set toggle_heavy_status=goto :heavy_status_OFF
goto :pick_classes_menu_2

:engineer_status_ON
set engineer_status=X
set apply_per_class_engineer=true
set toggle_engineer_status=goto :engineer_status_OFF
goto :pick_classes_menu_2

:medic_status_ON
set medic_status=X
set apply_per_class_medic=true
set toggle_medic_status=goto :medic_status_OFF
goto :pick_classes_menu_2

:sniper_status_ON
set sniper_status=X
set apply_per_class_sniper=true
set toggle_sniper_status=goto :sniper_status_OFF
goto :pick_classes_menu_2

:spy_status_ON
set spy_status=X
set apply_per_class_spy=true
set toggle_spy_status=goto :spy_status_OFF
goto :pick_classes_menu_2

:scout_status_OFF
set scout_status=_
set apply_per_class_scout=false
set toggle_scout_status=goto :scout_status_ON
goto :pick_classes_menu_2

:soldier_status_OFF
set soldier_status=_
set apply_per_class_soldier=false
set toggle_soldier_status=goto :soldier_status_ON
goto :pick_classes_menu_2

:pyro_status_OFF
set pyro_status=_
set apply_per_class_pyro=false
set toggle_pyro_status=goto :pyro_status_ON
goto :pick_classes_menu_2

:demoman_status_OFF
set demoman_status=_
set apply_per_class_demoman=false
set toggle_demoman_status=goto :demoman_status_ON
goto :pick_classes_menu_2

:heavy_status_OFF
set heavy_status=_
set apply_per_class_heavy=false
set toggle_heavy_status=goto :heavy_status_ON
goto :pick_classes_menu_2

:engineer_status_OFF
set engineer_status=_
set apply_per_class_engineer=false
set toggle_engineer_status=goto :engineer_status_ON
goto :pick_classes_menu_2

:medic_status_OFF
set medic_status=_
set apply_per_class_medic=false
set toggle_medic_status=goto :medic_status_ON
goto :pick_classes_menu_2

:sniper_status_OFF
set sniper_status=_
set apply_per_class_sniper=false
set toggle_sniper_status=goto :sniper_status_ON
goto :pick_classes_menu_2

:spy_status_OFF
set spy_status=_
set apply_per_class_spy=false
set toggle_spy_status=goto :spy_status_ON
goto :pick_classes_menu_2

:apply_for_selected_classes_prompt
IF %scout_status%==_ IF %soldier_status%==_ IF %pyro_status%==_ IF %demoman_status%==_ IF %heavy_status%==_ IF %engineer_status%==_ IF %medic_status%==_ IF %sniper_status%==_ IF %spy_status%==_ goto :pick_classes_menu_2
cls
echo.                       ~~%%%%%%%%_,_,
echo.                  ~~%%%%%%%%%-"/./
echo.                 ~~%%%%%%%-'   /  `.
echo.               ~~%%%%%%%%'  .     ,__;
echo.             ~~%%%%%%%%'   :       \O\
echo.          ~~%%%%%%%%'    :          `.
echo.        ~~%%%%%%%%'       `. _,        '
echo.     ~~%%%%%%%%'          .'`-._        `.
echo.  ~~%%%%%%%%%'           :     `-.     (,;
echo. ~~%%%%%%%%'             :         `._\_.'
echo. ~~%%%%%%' Welcome to Horsie's Viewmodel Editor!
echo.
echo You're about install the mod for: 
IF %scout_status%==X echo  - Scout
IF %soldier_status%==X echo  - Soldier
IF %pyro_status%==X echo  - Pyro
IF %demoman_status%==X echo  - Demoman
IF %heavy_status%==X echo  - Heavy
IF %engineer_status%==X echo  - Engineer
IF %medic_status%==X echo  - Medic
IF %sniper_status%==X echo  - Sniper
IF %spy_status%==X echo  - Spy
echo.
SET /P M=Proceed (Y/N):
IF /i %M%==y (
	set apply_for_specific_classes=true
	goto :exit_menu )
IF /i %M%==n goto :pick_classes_menu_2
IF /i NOT %M%==y IF /i NOT %M%==n goto :apply_for_selected_classes_prompt


:dev_menu
cls
echo.                       ~~%%%%%%%%_,_,
echo.                  ~~%%%%%%%%%-"/./
echo.                 ~~%%%%%%%-'   /  `.
echo.               ~~%%%%%%%%'  .     ,__;
echo.             ~~%%%%%%%%'   :       \O\
echo.          ~~%%%%%%%%'    :          `.
echo.        ~~%%%%%%%%'       `. _,        '
echo.     ~~%%%%%%%%'          .'`-._        `.
echo.  ~~%%%%%%%%%'           :     `-.     (,;
echo. ~~%%%%%%%%'             :         `._\_.'
echo. ~~%%%%%%' Welcome to Horsie's Viewmodel Editor!
echo.
echo Dev Options: 
echo. 	1. Remove all extracted animations
echo. 	2. Restore settings files to default
IF EXIST "%custom_folder%\%vpk_name%.vpk" echo.	3. Remove VPK from custom
echo 	0. Go back
echo.
SET /P M=Choose dev option:
IF NOT %M%==0 IF NOT %M%==1 IF NOT %M%==2 IF NOT %M%==3 goto :dev_menu
IF NOT EXIST "%custom_folder%\%vpk_name%.vpk" IF %M%==3 goto :dev_menu

IF %M%==0 goto :main_menu
IF %M%==1 goto :remove_extracted_animations_prompt
IF %M%==2 goto :restore_settings_prompt
IF %M%==3 goto :remove_vpks_prompt

:remove_extracted_animations_prompt
cls
echo This removes all the files extracted from the game, the fixed viewmodels pack and from custom animations (if present).
echo They will be extracted again when you press start.
echo Only recommended if something is really wrong or the game got updated.
echo.
SET /P M=Do you want to proceed (Y/N):
IF /i %M%==y (
	echo Removing all extracted animations...
	IF EXIST  "%dev_folder%\decompiled_animations" rd /s /q "%dev_folder%\decompiled_animations"
	IF EXIST  "%dev_folder%\decompiled_fixed_animations" rd /s /q "%dev_folder%\decompiled_fixed_animations"
	IF EXIST  "%dev_folder%\decompiled_custom_animations" rd /s /q "%dev_folder%\decompiled_custom_animations"
	IF EXIST  "%dev_folder%\decompiled_custom_animations_temp" rd /s /q "%dev_folder%\decompiled_custom_animations_temp"
	goto :dev_menu )
IF /i %M%==n goto :dev_menu
IF /i NOT %M%==y IF /i NOT %M%==n goto :remove_extracted_animations_prompt

:restore_settings_prompt
cls
echo This restores all the settings_class.txt files to default. 
echo There is no way to recover your previous settings if you do this.
echo. 
SET /P M=Are you sure you want to proceed (Y/N):
IF /i %M%==y (
	echo Restoring settings...
	xcopy /y "%dev_folder%\default_settings" "%vm_customizer_folder%" /e /q >nul
	goto :dev_menu )
IF /i %M%==n goto :dev_menu
IF /i NOT %M%==y IF /i NOT %M%==n goto :restore_settings_prompt

:remove_vpks_prompt
cls
echo This removes the generated VPK from your custom folder.
echo You don't have to do this before applying new settings, only if you just want to remove the mod.
echo.
SET /P M=Do you want to proceed (Y/N):
IF /i %M%==y (
	echo Removing VPK...
	IF EXIST  "%custom_folder%\%vpk_name%.vpk" del "%custom_folder%\%vpk_name%.vpk"
	IF EXIST  "%custom_folder%\%vpk_name%.vpk.sound.cache" del "%custom_folder%\%vpk_name%.vpk.sound.cache"

	goto :dev_menu )
IF /i %M%==n goto :dev_menu
IF /i NOT %M%==y IF /i NOT %M%==n goto :remove_vpks_prompt

:exit_menu
cls
color 30
::Extract default animations if needed
call "%vm_customizer_folder%\_dev\batch\extract_default_animations.bat"

::Check for and extract fixed viewmodels
IF %fixed_vm_addon%==on call "%vm_customizer_folder%\_dev\batch\extract_fixed_animations.bat"

::Check for and extract custom animations
IF %custom_vm%==on call "%vm_customizer_folder%\_dev\batch\extract_custom_animations.bat"

::Create temp folder + set variables
cd "%dev_folder%"
IF EXIST "decompiled_animations_temp" RMDIR /S /Q "decompiled_animations_temp"
IF NOT EXIST "decompiled_animations_temp" mkdir "decompiled_animations_temp"
xcopy /y "decompiled_animations" "decompiled_animations_temp" /e /q >nul
IF %fixed_vm_addon%==on IF EXIST "decompiled_fixed_animations" xcopy /y "decompiled_fixed_animations" "decompiled_animations_temp" /e /q >nul
IF %custom_vm%==on IF EXIST "decompiled_custom_animations" xcopy /y "decompiled_custom_animations" "decompiled_animations_temp" /e /q >nul
set decompiled_animations_temp=%dev_folder%\decompiled_animations_temp
set qc_folder_temp=%dev_folder%\decompiled_animations_temp

:apply settings
echo.
echo Applying the settings:

IF %apply_for_specific_classes%==true goto :apply_per_class
IF NOT %apply_for_specific_classes%==true goto :apply_for_all 


:apply_per_class
cd "%batch_folder%"
IF %apply_per_class_scout%==true call apply_for_scout.bat
cd "%batch_folder%"
IF %apply_per_class_soldier%==true call apply_for_soldier.bat
cd "%batch_folder%"
IF %apply_per_class_pyro%==true call apply_for_pyro.bat
cd "%batch_folder%"
IF %apply_per_class_demoman%==true call apply_for_demoman.bat
cd "%batch_folder%"
IF %apply_per_class_heavy%==true call apply_for_heavy.bat
cd "%batch_folder%"
IF %apply_per_class_engineer%==true call apply_for_engineer.bat
cd "%batch_folder%"
IF %apply_per_class_medic%==true call apply_for_medic.bat
cd "%batch_folder%"
IF %apply_per_class_sniper%==true call apply_for_sniper.bat
cd "%batch_folder%"
IF %apply_per_class_spy%==true call apply_for_spy.bat
goto :compile	
		
:apply_for_all
::call settings batch files
cd "%batch_folder%"
call apply_for_scout.bat
cd "%batch_folder%"
call apply_for_soldier.bat
cd "%batch_folder%"
call apply_for_pyro.bat
cd "%batch_folder%"
call apply_for_demoman.bat
cd "%batch_folder%"
call apply_for_heavy.bat
cd "%batch_folder%"
call apply_for_engineer.bat
cd "%batch_folder%"
call apply_for_medic.bat
cd "%batch_folder%"
call apply_for_sniper.bat
cd "%batch_folder%"
call apply_for_spy.bat

:compile
echo.
echo Compiling the animations:
::compile and pack
cd "%batch_folder%"
call compile_and_pack.bat
:del_temp
::delete temp
cd %dev_folder%
rd /s /q "decompiled_animations_temp"

:finished
color 20
title Done!

:horse
cls
echo                       ~~%%%%%%%%_,_,
echo                   ~~%%%%%%%%%-"/./
echo                 ~~%%%%%%%-'   /  `.
echo               ~~%%%%%%%%'  .     ,__;
echo             ~~%%%%%%%%'   :       \O\
echo           ~~%%%%%%%%'    :          `.
echo        ~~%%%%%%%%'       `. _,        '
echo     ~~%%%%%%%%'          .'`-._        `.
echo  ~~%%%%%%%%%'           :     `-.     (,;
echo ~~%%%%%%%%'             :         `._\_.'
echo ~~%%%%%%'              ;  Done! Your edited viewmodels have been installed.
pause
endlocal

