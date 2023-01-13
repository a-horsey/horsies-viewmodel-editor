@echo off

:check_instant_backstab
IF %•Static_backstab_detection(y/n)%==y goto :EOF
IF NOT %•Instant_backstab_detection(y/n)%==y goto :EOF
IF NOT %•Hidden(y/n)%==y goto :process_backstab_detections
IF %•Hidden(y/n)%==y IF NOT %Keep_backstab_detection_visible(y/n)%==y goto :EOF
IF %•Hidden(y/n)%==y IF %Keep_backstab_detection_visible(y/n)%==y goto :process_backstab_detections

:process_backstab_detections
IF %backstab_detect_smd_idle%==none goto :EOF

:apply_fade_values
cd "%qc_folder_temp%"
set fade_values=snap fadein 0.0 fadeout 0.0

IF %backstab_detect_sequence_up%==none goto :apply_fade_values_done
echo $append %backstab_detect_sequence_up% %fade_values% >> %qc_file%

IF %backstab_detect_sequence_down%==none goto :apply_fade_values_done
echo $append %backstab_detect_sequence_down% snap fadein 0.0 fadeout 0.1 >> %qc_file%

IF %backstab_detect_sequence_idle%==none goto :apply_fade_values_done
echo $append %backstab_detect_sequence_idle% %fade_values% >> %qc_file%
:apply_fade_values_done

:turn_instant
set extract_first_frame_from=%backstab_detect_smd_idle%
set operating_smd_1=%backstab_detect_smd_up%
set operating_smd_2=%backstab_detect_smd_idle%
set operating_smd_3=none
set operating_smd_4=none
set operating_smd_5=none
set operating_smd_6=none
set operating_smd_7=none
set operating_smd_8=none
set operating_smd_9=none
set operating_smd_10=none
call "%dev_folder%\batch\smd_operations\smd_instantinator.bat"

:turn_static
set operating_smd_1=%backstab_detect_smd_down%
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
set operating_sequence_1=%backstab_detect_sequence_up%
set operating_sequence_2=%backstab_detect_sequence_down%
set operating_sequence_3=%backstab_detect_sequence_idle%
set operating_sequence_4=none
set operating_sequence_5=none
set operating_sequence_6=none
set operating_sequence_7=none
set operating_sequence_8=none
set operating_sequence_9=none
set operating_sequence_10=none
call "%dev_folder%\batch\sequence_operations\remove_blend_from_sequences.bat"


