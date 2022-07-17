setlocal
@echo off
color E0
title Horsie's Viewmodel Editor
cls 

:check_and_set_folders
::Check folders
set vm_customizer_folder=%~dp0
cd %vm_customizer_folder%
set vm_customizer_folder=%cd%
cd %vm_customizer_folder%
for %%I in (.) do set base_folder=%%~nxI
cd ..\
for %%I in (.) do set check_folder=%%~nxI
cd %base_folder%
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
goto :eof
endlocal

:custom_folder
::Set folders
cd %vm_customizer_folder%
set vm_customizer_folder=%cd%
cd ..\
set custom_folder=%cd%
set dev_folder=%vm_customizer_folder%\dev
set batch_folder=%dev_folder%\batch
set animations_folder=%dev_folder%\decompiled_animations
cd ..\
set tf_folder=%cd%
echo %tf_folder%
cd ..\
cd bin
set bin_folder=%cd%
cd %tf_folder%
cls
IF NOT EXIST tf2_misc_dir.vpk goto :wrong_folder
IF NOT EXIST gameinfo.txt goto :wrong_folder
cd %vm_customizer_folder%
goto :check_and_set_folders_done

:tf_folder
::Set folders
cd %vm_customizer_folder%
set vm_customizer_folder=%cd%
set dev_folder=%vm_customizer_folder%\dev
set animations_folder=%dev_folder%\decompiled_animations
set batch_folder=%dev_folder%\batch
cd ..\
set tf_folder=%cd%
set custom_folder=%tf_folder%\custom
cd ..\
cd bin
set bin_folder=%cd%
cd %tf_folder%
cls
IF NOT EXIST tf2_misc_dir.vpk goto :wrong_folder
IF NOT EXIST gameinfo.txt goto :wrong_folder
cd %vm_customizer_folder%
cd %vm_customizer_folder%
goto :check_and_set_folders_done
:check_and_set_folders_done

::delete temp just in case
cd %dev_folder%
IF EXIST "decompiled_animations_temp" rd /s /q "decompiled_animations_temp"

::set default options
set automatic_preloading=on
set fixed_vm_addon=on

set apply_only_for_scout=false
set apply_only_for_soldier=false
set apply_only_for_pyro=false
set apply_only_for_demoman=false
set apply_only_for_heavy=false
set apply_only_for_engineer=false
set apply_only_for_medic=false
set apply_only_for_sniper=false
set apply_only_for_spy=false

:main_menu
::set some menu variables
IF %automatic_preloading%==on set toggle_preloading=goto :preloading_off
IF %automatic_preloading%==on set automatic_preloading_status=ON
IF %automatic_preloading%==off set automatic_preloading_status=OFF

IF %fixed_vm_addon%==on set toggle_fixed_vm_addon=goto :fixed_vm_addon_off
IF %fixed_vm_addon%==on set fixed_vm_addon_status=ON
IF %fixed_vm_addon%==off set fixed_vm_addon_status=OFF

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
echo. Options: 
echo.	1. Start
echo. 	2. Toggle automatic preloading (currently %automatic_preloading_status%)
echo. 	3. Toggle fixed viewmodels support (currently %fixed_vm_addon_status%)
echo. 	4. Developer settings
echo.	5. Exit

SET /P M=Choose an option: 
IF %M%==1 goto :exit_menu
IF %M%==2 %toggle_preloading%
IF %M%==3 %toggle_fixed_vm_addon%
IF %M%==4 goto :dev_menu
IF %M%==5 goto :eof
IF NOT %M%==1 IF NOT %M%==2 goto :main_menu IF NOT %M%==3 goto :main_menu IF NOT %M%==4 goto :main_menu IF NOT %M%==5 goto :main_menu

:preloading_off
cls
echo Warning: Automatic preloading is highly recommended.
echo The edited viewmodels will not work in most servers without it.
echo If you do disable it, you can add "exec preloading" to your autoexec to bring it back without reapplying settings.
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

:fixed_vm_addon_off
cls
echo Fixed viewmodels support does nothing if you do not extract the VPK in the "fixed viewmodels addon" folder.
echo More instructions are in that folder.
echo.
pause
set fixed_vm_addon=off
set toggle_fixed_vm_addon=goto :fixed_vm_addon_on
goto :main_menu

:fixed_vm_addon_on
cls
echo Fixed viewmodels support does nothing if you do not extract the VPK in the "fixed viewmodels addon" folder.
echo More instructions are in that folder.
pause
set fixed_vm_addon=on
set toggle_fixed_vm_addon=goto :fixed_vm_addon_off
goto :main_menu

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
echo 	0. Go back
echo. 	1. Remove all extracted animations
echo. 	2. Restore settings files to default
echo. 	3. Start and apply only Scout
echo.	4. Start and apply only Soldier
echo.	5. Start and apply only Pyro
echo.	6. Start and apply only Demoman
echo.	7. Start and apply only Heavy
echo.	8. Start and apply only Engineer
echo.	9. Start and apply only Medic
echo.	10. Start and apply only Sniper
echo.	11. Start and apply only Spy
SET /P M=Choose dev option:
IF NOT %M%==0 IF NOT %M%==1 IF NOT %M%==2 IF NOT %M%==3 IF NOT %M%==4 IF NOT %M%==5 IF NOT %M%==6 IF NOT %M%==7 IF NOT %M%==8 IF NOT %M%==9 IF NOT %M%==10 IF NOT %M%==11 goto :dev_menu

IF %M%==0 goto :main_menu
IF %M%==1 goto :remove_extracted_animations_prompt
IF %M%==2 goto :restore_settings_prompt
IF %M%==3 goto :apply_only_for_scout_prompt
IF %M%==4 goto :apply_only_for_soldier_prompt
IF %M%==5 goto :apply_only_for_pyro_prompt
IF %M%==6 goto :apply_only_for_demoman_prompt
IF %M%==7 goto :apply_only_for_heavy_prompt
IF %M%==8 goto :apply_only_for_engineer_prompt
IF %M%==9 goto :apply_only_for_medic_prompt
IF %M%==10 goto :apply_only_for_sniper_prompt
IF %M%==11 goto :apply_only_for_spy_prompt

:remove_extracted_animations_prompt
cls
echo This removes all the files extracted from the game and the fixed viewmodels pack (if present).
echo They will be extracted again when you press start.
echo Only recommended if something is really wrong or the game got updated.
echo.
SET /P M=Do you want to proceed (Y/N):
IF /i %M%==y (
	echo Removing all extracted animations...
	IF EXIST  "%dev_folder%\decompiled_animations" rd /s /q "%dev_folder%\decompiled_animations"
	IF EXIST  "%dev_folder%\decompiled_fixed_animations" rd /s /q "%dev_folder%\decompiled_fixed_animations"
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
	xcopy /y "%dev_folder%\default_settings" "%vm_customizer_folder%" /e /q
	goto :dev_menu )
IF /i %M%==n goto :dev_menu
IF /i NOT %M%==y IF /i NOT %M%==n goto :restore_settings_prompt

:apply_only_for_scout_prompt
cls
echo If you proceed, this will only apply and include the Scout settings.
echo.
SET /P M=Do you want to proceed (Y/N): 
IF /i NOT %M%==y IF /i NOT %M%==n goto :apply_only_for_scout_prompt
IF /i %M%==n goto :dev_menu
IF /i %M%==y (
	set apply_only_for_scout=true
	goto :exit_menu )
	
:apply_only_for_soldier_prompt
cls
echo If you proceed, this will only apply and include the Soldier settings.
echo.
SET /P M=Do you want to proceed (Y/N): 
IF /i NOT %M%==y IF /i NOT %M%==n goto :apply_only_for_soldier_prompt
IF /i %M%==n goto :dev_menu
IF /i %M%==y (
	set apply_only_for_soldier=true
	goto :exit_menu )
	
:apply_only_for_pyro_prompt
cls
echo If you proceed, this will only apply and include the Pyro settings.
echo.
SET /P M=Do you want to proceed (Y/N): 
IF /i NOT %M%==y IF /i NOT %M%==n goto :apply_only_for_pyro_prompt
IF /i %M%==n goto :dev_menu
IF /i %M%==y (
	set apply_only_for_pyro=true
	goto :exit_menu )

	
:apply_only_for_demoman_prompt
cls
echo If you proceed, this will only apply and include the Demoman settings.
echo.
SET /P M=Do you want to proceed (Y/N): 
IF /i NOT %M%==y IF /i NOT %M%==n goto :apply_only_for_demoman_prompt
IF /i %M%==n goto :dev_menu
IF /i %M%==y (
	set apply_only_for_demoman=true
	goto :exit_menu )

	
:apply_only_for_heavy_prompt
cls
echo If you proceed, this will only apply and include the Heavy settings.
echo.
SET /P M=Do you want to proceed (Y/N): 
IF /i NOT %M%==y IF /i NOT %M%==n goto :apply_only_for_heavy_prompt
IF /i %M%==n goto :dev_menu
IF /i %M%==y (
	set apply_only_for_heavy=true
	goto :exit_menu )

	
:apply_only_for_engineer_prompt
cls
echo If you proceed, this will only apply and include the Engineer settings.
echo.
SET /P M=Do you want to proceed (Y/N): 
IF /i NOT %M%==y IF /i NOT %M%==n goto :apply_only_for_engineer_prompt
IF /i %M%==n goto :dev_menu
IF /i %M%==y (
	set apply_only_for_engineer=true
	goto :exit_menu )

	
:apply_only_for_medic_prompt
cls
echo If you proceed, this will only apply and include the Medic settings.
echo.
SET /P M=Do you want to proceed (Y/N): 
IF /i NOT %M%==y IF /i NOT %M%==n goto :apply_only_for_medic_prompt
IF /i %M%==n goto :dev_menu
IF /i %M%==y (
	set apply_only_for_medic=true
	goto :exit_menu )

	
:apply_only_for_sniper_prompt
cls
echo If you proceed, this will only apply and include the Sniper settings.
echo.
SET /P M=Do you want to proceed (Y/N): 
IF /i NOT %M%==y IF /i NOT %M%==n goto :apply_only_for_sniper_prompt
IF /i %M%==n goto :dev_menu
IF /i %M%==y (
	set apply_only_for_sniper=true
	goto :exit_menu )

	
:apply_only_for_spy_prompt
cls
echo If you proceed, this will only apply and include the Spy settings.
echo.
SET /P M=Do you want to proceed (Y/N): 
IF /i NOT %M%==y IF /i NOT %M%==n goto :apply_only_for_spy_prompt
IF /i %M%==n goto :dev_menu
IF /i %M%==y (
	set apply_only_for_spy=true
	goto :exit_menu )

:exit_menu
cls
color 30
::Extract default animations if needed
call "%vm_customizer_folder%\dev\batch\extract_default_animations.bat"

::Check for and extract fixed viewmodels
IF %fixed_vm_addon%==on call "%vm_customizer_folder%\dev\batch\extract_fixed_animations.bat"

::Create temp folder + set variables
title Creating temp folder...
echo Creating temp folder...
cd %dev_folder%
IF EXIST "decompiled_animations_temp" RMDIR /S /Q "decompiled_animations_temp"
IF NOT EXIST "decompiled_animations_temp" mkdir "decompiled_animations_temp"
xcopy /y "decompiled_animations" "decompiled_animations_temp" /e /q
IF %fixed_vm_addon%==on xcopy /y "decompiled_fixed_animations" "decompiled_animations_temp" /e /q
set decompiled_animations_temp=%dev_folder%\decompiled_animations_temp
set qc_folder_temp=%dev_folder%\decompiled_animations_temp

::check for dev settings
cd %batch_folder%
IF %apply_only_for_scout%==true (
	call apply_for_scout.bat
	goto :compile )

IF %apply_only_for_soldier%==true (
	call apply_for_soldier.bat
	goto :compile )

IF %apply_only_for_pyro%==true (
	call apply_for_pyro.bat
	goto :compile )

IF %apply_only_for_demoman%==true (
	call apply_for_demoman.bat
	goto :compile )

IF %apply_only_for_heavy%==true (
	call apply_for_heavy.bat
	goto :compile )

IF %apply_only_for_engineer%==true (
	call apply_for_engineer.bat
	goto :compile )

IF %apply_only_for_medic%==true (
	call apply_for_medic.bat
	goto :compile )

IF %apply_only_for_sniper%==true (
	call apply_for_sniper.bat
	goto :compile )

IF %apply_only_for_spy%==true (
	call apply_for_spy.bat
	goto :compile )
	
::call settings batch files
cd %batch_folder%
call apply_for_scout.bat
cd %batch_folder%
call apply_for_soldier.bat
cd %batch_folder%
call apply_for_pyro.bat
cd %batch_folder%
call apply_for_demoman.bat
cd %batch_folder%
call apply_for_heavy.bat
cd %batch_folder%
call apply_for_engineer.bat
cd %batch_folder%
call apply_for_medic.bat
cd %batch_folder%
call apply_for_sniper.bat
cd %batch_folder%
call apply_for_spy.bat

:compile
::compile and pack
cd %batch_folder%
call compile_and_pack.bat

:del_temp
::delete temp
cd %dev_folder%
rd /s /q "decompiled_animations_temp"

:finished
color 20
title FINISHED
cd %dev_folder%
taskbarflash --all

:horse
::cls
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

