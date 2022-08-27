@echo off

:check_setting_idle
IF NOT %•More_static_idle(y/n)%==y goto :EOF
IF NOT %•Hidden(y/n)%==y goto :process_idle
IF %•Hidden(y/n)%==y IF NOT %Keep_idle_visible(y/n)%==y goto :EOF
IF %•Hidden(y/n)%==y IF %Keep_idle_visible(y/n)%==y goto :process_idle

:process_idle
cd "%smd_folder%"

:count_frames_idle
IF NOT EXIST %idle_smd% goto :count_frames_idle_done
set smd_to_count=%idle_smd%
  for /f "usebackq" %%b in (`type %smd_to_count% ^| find "time" /c`) do (
    set /A idle_smd_frames=%%b
    )
  )
:count_frames_idle_done

::add frame numbers for idle
cd "%qc_folder_temp%"
:add_frames_idle
IF NOT %idle_sequence%==none echo $append %idle_sequence% frame 0 0 numframes %idle_smd_frames% fadein 0.2 fadeout 0.2 >> %qc_file%
