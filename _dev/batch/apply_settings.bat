::this file is used by the apply_for_class scripts to call all the settings scripts at once
::saves some space and makes it easy to edit when updating
@echo off

::call scripts
cd "%batch_folder%"
call extract_settings.bat
cd "%batch_folder%"
call snap_to_draws.bat
cd "%batch_folder%"
call hide_weapon.bat

cd "%batch_folder%"
IF %qc_file%==c_spy_animations.qc call spy_hide_backstabs.bat
cd "%batch_folder%"
IF %qc_file%==c_spy_animations.qc call spy_instant_backstab_detection.bat
cd "%batch_folder%"
IF %qc_file%==c_spy_animations.qc call spy_replace_backstab.bat
cd "%batch_folder%"
IF %qc_file%==c_spy_animations.qc call spy_static_backstab.bat
cd "%batch_folder%"
IF %qc_file%==c_spy_animations.qc call spy_static_backstab_detection.bat

cd "%batch_folder%"
call change_position_and_rotation.bat
cd "%batch_folder%"
call static_reload.bat
cd "%batch_folder%"
call static_draw.bat
cd "%batch_folder%"
call static_idle.bat
cd "%batch_folder%"
call static_attack.bat
cd "%batch_folder%"
call static_secondary_attack.bat

cd "%batch_folder%"
IF NOT %qc_file%==c_demo_animations.qc IF NOT %qc_file%==c_medic_animations.qc IF NOT %qc_file%==c_spy_animations.qc call remove_shells.bat

cd "%batch_folder%"
call remove_left_arm.bat