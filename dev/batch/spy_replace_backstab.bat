::this script is for applying the replace backstab setting for spy's knives

@echo off

:check_setting_backstab
IF NOT %•Replace_backstab_with_normal_attack(y/n)%==y goto :EOF
:check_backstab_replace_1
IF NOT %•Hidden(y/n)%==y goto :check_backstab_replace_3
IF %•Hidden(y/n)%==y goto :check_backstab_replace_2
:check_backstab_replace_2
IF NOT %Keep_backstab_visible(y/n)%==y goto :eof
:check_backstab_replace_3
IF %•Static_backstab(y/n)%==y goto :eof
IF NOT %•Static_backstab(y/n)%==y goto :check_finished
:check_finished

:process_backstab
cd "%smd_folder%"

:count_frames_backstab
IF NOT EXIST %backstab_attack_smd% goto :count_frames_backstab_done
set smd_to_count=%backstab_attack_smd%
  for /f "usebackq" %%b in (`type %smd_to_count% ^| find "time" /c`) do (
    set /A backstab_frames=%%b
    )
  )
:count_frames_backstab_done

::add frame numbers for backstab
cd "%qc_folder_temp%"
:add_frames_backstab
IF %backstab_attack_sequence%==none goto :add_frames_done
echo $append %backstab_attack_sequence% { >> %qc_file%
echo numframes %backstab_frames% >> %qc_file%
echo } >> %qc_file%
:add_frames_done

::replace smd with idle
cd "%smd_folder%"
:replace draw_smd
IF EXIST %backstab_attack_smd%  IF EXIST %diagonal_stab_smd% (
	copy %diagonal_stab_smd% %backstab_attack_smd%
	)