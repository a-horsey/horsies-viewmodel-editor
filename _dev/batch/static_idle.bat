@echo off

:check_setting_idle
IF NOT %•More_static_idle(y/n)%==y goto :EOF
IF NOT %•Hidden(y/n)%==y goto :process_idle
IF %•Hidden(y/n)%==y IF NOT %Keep_idle_visible(y/n)%==y goto :EOF
IF %•Hidden(y/n)%==y IF %Keep_idle_visible(y/n)%==y goto :process_idle

:process_idle
IF %idle_smd%==none goto :EOF

:apply_fade_values
cd "%qc_folder_temp%"
set fade_values=fadein 0.2 fadeout 0.2
echo $append %idle_sequence% %fade_values% >> %qc_file%

:turn_static
set operating_smd_1=%idle_smd%
set operating_smd_2=none
set operating_smd_3=none
set operating_smd_4=none
set operating_smd_5=none
set operating_smd_6=none
set operating_smd_7=none
set operating_smd_8=none
set operating_smd_9=none
set operating_smd_10=none
call "%dev_folder%\batch\smd_operations\smd_statinator.bat"

::delete blends only if using custom animations - wastes time otherwise
IF %custom_vm%==on IF EXIST "%dev_folder%\decompiled_custom_animations\%qc_file%" goto :delete_blends
goto :EOF
:delete_blends
set operating_sequence_1=%idle_sequence%
set operating_sequence_2=none
set operating_sequence_3=none
set operating_sequence_4=none
set operating_sequence_5=none
set operating_sequence_6=none
set operating_sequence_7=none
set operating_sequence_8=none
set operating_sequence_9=none
set operating_sequence_10=none
call "%dev_folder%\batch\sequence_operations\remove_blend_from_sequences.bat"

