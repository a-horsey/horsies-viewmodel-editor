::this script is for applying the replace backstab setting for spy's knives

@echo off

:check_setting_backstab
IF %•Static_backstab(y/n)%==y goto :EOF
IF NOT %•Replace_backstab_with_normal_attack(y/n)%==y goto :EOF
IF NOT %•Hidden(y/n)%==y goto :process_backstab
IF %•Hidden(y/n)%==y IF NOT %Keep_backstab_visible(y/n)%==y goto :EOF
IF %•Hidden(y/n)%==y IF %Keep_backstab_visible(y/n)%==y goto :process_backstab

:process_backstab
cd "%smd_folder%"

IF %Choose_normal_attack(poke/horizontal_swipe/diagonal_swipe)%==poke set normal_attack_smd=%poke_stab_smd%
IF %Choose_normal_attack(poke/horizontal_swipe/diagonal_swipe)%==horizontal_swipe set normal_attack_smd=%horizontal_stab_smd%
IF %Choose_normal_attack(poke/horizontal_swipe/diagonal_swipe)%==diagonal_swipe set normal_attack_smd=%diagonal_stab_smd%

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
echo $append %backstab_attack_sequence% numframes %backstab_frames% >> %qc_file%
:add_frames_done

::replace smd with idle
cd "%smd_folder%"
:replace draw_smd
IF EXIST %backstab_attack_smd%  IF EXIST %normal_attack_smd% (
	copy %normal_attack_smd% %backstab_attack_smd% >nul
	)