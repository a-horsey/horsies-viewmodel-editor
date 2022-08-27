::this script makes the backstab detections instant

@echo off

:check_instant_backstab
IF %•Static_backstab_detection(y/n)%==y goto :EOF
IF NOT %•Instant_backstab_detection(y/n)%==y goto :EOF
IF NOT %•Hidden(y/n)%==y goto :process_backstab_detections
IF %•Hidden(y/n)%==y IF NOT %Keep_backstab_detection_visible(y/n)%==y goto :EOF
IF %•Hidden(y/n)%==y IF %Keep_backstab_detection_visible(y/n)%==y goto :process_backstab_detections

:process_backstab_detections
cd "%smd_folder%"

:count_frames_backstab_up
IF NOT EXIST %backstab_detect_smd_up% goto :count_frames_backstab_det_done
set smd_to_count=%backstab_detect_smd_up%
  for /f "usebackq" %%b in (`type %smd_to_count% ^| find "time" /c`) do (
    set /A backstab_detect_smd_up_frames=%%b
    )
  )

:count_frames_backstab_down
IF NOT EXIST %backstab_detect_smd_down% goto :count_frames_backstab_det_done
set smd_to_count=%backstab_detect_smd_down%
  for /f "usebackq" %%b in (`type %smd_to_count% ^| find "time" /c`) do (
    set /A backstab_detect_smd_down_frames=%%b
    )
  )

:count_frames_backstab_idle
IF NOT EXIST %backstab_detect_smd_idle% goto :count_frames_backstab_det_done
set smd_to_count=%backstab_detect_smd_idle%
  for /f "usebackq" %%b in (`type %smd_to_count% ^| find "time" /c`) do (
    set /A backstab_detect_smd_idle_frames=%%b
    )
  )
:count_frames_backstab_det_done

::add frames to qc
cd "%qc_folder_temp%"

:add_frames_backstab_detect_smd_up
IF %backstab_detect_sequence_up%==none goto :add_frames_det_done
echo $append %backstab_detect_sequence_up% numframes %backstab_detect_smd_up_frames% snap frame 0 0 >> %qc_file%

:add_frames_backstab_detect_smd_down
IF %backstab_detect_sequence_down%==none goto :add_frames_det_done
echo $append %backstab_detect_sequence_down% numframes %backstab_detect_smd_down_frames% snap frame 0 0 >> %qc_file%

:add_frames_backstab_detect_smd_idle
IF %backstab_detect_sequence_idle%==none goto :add_frames_det_done
echo $append %backstab_detect_sequence_idle% numframes %backstab_detect_smd_idle_frames% snap frame 0 0 >> %qc_file%
:add_frames_det_done

::replace smds
cd "%smd_folder%"

IF EXIST %backstab_detect_smd_up% IF EXIST %backstab_detect_smd_idle% (
	copy %backstab_detect_smd_idle% %backstab_detect_smd_up% >nul
	)
	
IF EXIST %backstab_detect_smd_down% IF EXIST %idle_smd% (
	copy %idle_smd% %backstab_detect_smd_down% >nul
	)
