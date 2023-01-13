@echo off

:check_setting_draw
IF NOT %•Static_draw(y/n)%==y goto :EOF
IF NOT %•Hidden(y/n)%==y goto :process_draw
IF %•Hidden(y/n)%==y IF NOT %Keep_draw_visible(y/n)%==y goto :EOF
IF %•Hidden(y/n)%==y IF %Keep_draw_visible(y/n)%==y goto :process_draw

:process_draw
IF %draw_smd%==none goto :EOF
IF %idle_smd%==none goto :EOF

:apply_fade_values
cd "%qc_folder_temp%"
set fade_values=snap fadein 0.0 fadeout 0.2
echo $append %draw_sequence% %fade_values% >> %qc_file%

:drink_check
::special check for scout to remove buggy particle if the weapon is a drink
IF %draw_sequence%==ed_draw goto :remove_drink_particle
goto :drink_check_done
:remove_drink_particle
cd "%qc_folder_temp%"
findstr /i /v /l "AE_CL_CREATE_PARTICLE_EFFECT" %qc_file% >> temp_draw_idle_drinks_special
move temp_draw_idle_drinks_special %qc_file% >nul
:drink_check_done

:turn_static
set operating_smd_1=%draw_smd%
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
set operating_sequence_1=%draw_sequence%
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
