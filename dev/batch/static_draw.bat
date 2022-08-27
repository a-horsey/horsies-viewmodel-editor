@echo off

:check_setting_draw
IF NOT %•Static_draw(y/n)%==y goto :EOF
IF NOT %•Hidden(y/n)%==y goto :process_draw
IF %•Hidden(y/n)%==y IF NOT %Keep_draw_visible(y/n)%==y goto :EOF
IF %•Hidden(y/n)%==y IF %Keep_draw_visible(y/n)%==y goto :process_draw

:process_draw
cd "%smd_folder%"

:count_frames_draw
IF NOT EXIST %draw_smd% goto :count_frames_draw_done
set smd_to_count=%draw_smd%
  for /f "usebackq" %%b in (`type %smd_to_count% ^| find "time" /c`) do (
    set /A draw_smd_frames=%%b
    )
  )
:count_frames_draw_done

::add frame numbers for draw
cd "%qc_folder_temp%"
IF NOT %draw_sequence%==none echo $append %draw_sequence% frame 0 0 numframes %draw_smd_frames% fadeout 0.1 >> %qc_file%

::replace smd with idle
cd "%smd_folder%"
:replace draw_smd
IF EXIST %draw_smd% IF EXIST %idle_smd% (
	copy %idle_smd% %draw_smd% >nul
	)
	
::special check for scout to remove buggy particle if the weapon is a drink
IF %draw_sequence%==ed_draw goto :remove_drink_particle
goto :EOF
:remove_drink_particle
cd "%qc_folder_temp%"
findstr /i /v /l "AE_CL_CREATE_PARTICLE_EFFECT" %qc_file% >> temp_draw_idle_drinks_special
move temp_draw_idle_drinks_special %qc_file% >nul

