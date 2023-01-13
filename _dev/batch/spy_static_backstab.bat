@echo off

:check_setting_backstab
IF NOT %•Static_backstab(y/n)%==y goto :EOF
IF NOT %•Hidden(y/n)%==y goto :process_backstab
IF %•Hidden(y/n)%==y IF NOT %Keep_backstab_visible(y/n)%==y goto :EOF
IF %•Hidden(y/n)%==y IF %Keep_backstab_visible(y/n)%==y goto :process_backstab

:process_backstab
IF %idle_smd%==none goto :EOF

:apply_fade_values
cd "%qc_folder_temp%"
set fade_values=fadein 0.2 fadeout 0.2

IF %backstab_attack_sequence%==none goto :apply_fade_values_done
echo $append %backstab_attack_sequence% %fade_values% >> %qc_file%

IF %backstab_stun_sequence%==none goto :apply_fade_values_done
echo $append %backstab_stun_sequence% %fade_values% >> %qc_file%
:apply_fade_values_done

:turn_static
set operating_smd_1=%backstab_attack_smd%
set operating_smd_2=%backstab_stun_smd%
set operating_smd_3=none
set operating_smd_4=none
set operating_smd_5=none
set operating_smd_6=none
set operating_smd_7=none
set operating_smd_8=none
set operating_smd_9=none
set operating_smd_10=none
call "%dev_folder%\batch\smd_operations\smd_statinator.bat"

::blend removal disabled for now, causes issues with some animations that use blends for fixing positions
goto :EOF

::delete blends only if using custom animations - wastes time otherwise
IF %custom_vm%==on IF EXIST "%dev_folder%\decompiled_custom_animations\%qc_file%" goto :delete_blends
goto :EOF
:delete_blends
set operating_sequence_1=%backstab_attack_sequence%
set operating_sequence_2=%backstab_stun_sequence%
set operating_sequence_3=none
set operating_sequence_4=none
set operating_sequence_5=none
set operating_sequence_6=none
set operating_sequence_7=none
set operating_sequence_8=none
set operating_sequence_9=none
set operating_sequence_10=none
call "%dev_folder%\batch\sequence_operations\remove_blend_from_sequences.bat"


