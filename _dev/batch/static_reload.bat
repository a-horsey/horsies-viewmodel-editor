@echo off

::some logic to not apply if the reload animation is hidden
IF NOT %•Static_reload(y/n)%==y goto :EOF
IF NOT %•Hidden(y/n)%==y goto :process_reload
IF %•Hidden(y/n)%==y IF NOT %Keep_reload_visible(y/n)%==y goto :EOF
IF %•Hidden(y/n)%==y IF %Keep_reload_visible(y/n)%==y goto :process_reload

:process_reload
IF %idle_smd%==none goto :EOF

:apply_fade_values
cd "%qc_folder_temp%"
set fade_values=fadein 0.2 fadeout 0.2

IF %reload_sequence_1%==none goto :apply_fade_values_done
echo $append %reload_sequence_1% %fade_values% >> %qc_file%

IF %reload_sequence_2%==none goto :apply_fade_values_done
echo $append %reload_sequence_2% %fade_values% >> %qc_file%

IF %reload_sequence_3%==none goto :apply_fade_values_done
echo $append %reload_sequence_3% %fade_values% >> %qc_file%

IF %reload_sequence_4%==none goto :apply_fade_values_done
echo $append %reload_sequence_4% %fade_values% >> %qc_file%

IF %reload_sequence_5%==none goto :apply_fade_values_done
echo $append %reload_sequence_5% %fade_values% >> %qc_file%

IF %reload_sequence_6%==none goto :apply_fade_values_done
echo $append %reload_sequence_6% %fade_values% >> %qc_file%

IF %reload_sequence_7%==none goto :apply_fade_values_done
echo $append %reload_sequence_7% %fade_values% >> %qc_file%

IF %reload_sequence_8%==none goto :apply_fade_values_done
echo $append %reload_sequence_8% %fade_values% >> %qc_file%
:apply_fade_values_done

:turn_static
set operating_smd_1=%reload_smd_1%
set operating_smd_2=%reload_smd_2%
set operating_smd_3=%reload_smd_3%
set operating_smd_4=%reload_smd_4%
set operating_smd_5=%reload_smd_5%
set operating_smd_6=%reload_smd_6%
set operating_smd_7=%reload_smd_7%
set operating_smd_8=%reload_smd_8%
set operating_smd_9=none
set operating_smd_10=none
call "%dev_folder%\batch\smd_operations\smd_statinator.bat"

::blend removal disabled for now, causes issues with some animations that use blends for fixing positions
goto :EOF

::delete blends only if using custom animations - wastes time otherwise
IF %custom_vm%==on IF EXIST "%dev_folder%\decompiled_custom_animations\%qc_file%" goto :delete_blends
goto :EOF
:delete_blends
set operating_sequence_1=%reload_sequence_1%
set operating_sequence_2=%reload_sequence_2%
set operating_sequence_3=%reload_sequence_3%
set operating_sequence_4=%reload_sequence_4%
set operating_sequence_5=%reload_sequence_5%
set operating_sequence_6=%reload_sequence_6%
set operating_sequence_7=%reload_sequence_7%
set operating_sequence_8=%reload_sequence_8%
set operating_sequence_9=none
set operating_sequence_10=none
call "%dev_folder%\batch\sequence_operations\remove_blend_from_sequences.bat"
