@echo off

:check_setting_draw
IF NOT %•Static_draw(y/n)%==y goto :EOF
IF NOT %•Hidden(y/n)%==y goto :process_draw
IF %•Hidden(y/n)%==y IF NOT %Keep_draw_visible(y/n)%==y goto :EOF
IF %•Hidden(y/n)%==y IF %Keep_draw_visible(y/n)%==y goto :process_draw

:process_draw
IF %draw_smd%==none goto :EOF
IF %idle_smd%==none goto :EOF

:extract_nodes
cd "%smd_folder%"
IF EXIST nodes del nodes >nul
FOR /F "tokens=*" %%A IN (%idle_smd%) DO (
	echo %%A
	IF %%A==skeleton goto :nodes_extracted ) >> nodes
:nodes_extracted

:static_draw
set smd_to_make_static=%draw_smd%
call :smd_statinator

:apply_fade_values
cd "%qc_folder_temp%"
set fade_values=fadein 0.2 fadeout 0.2
echo $append %draw_sequence% %fade_values% >> %qc_file%

:remove_snap
set sequence_to_remove_snap_from=%idle_sequence%
call :snap_remover
	
::special check for scout to remove buggy particle if the weapon is a drink
IF %draw_sequence%==ed_draw goto :remove_drink_particle
goto :delete_temp_and_exit
:remove_drink_particle
cd "%qc_folder_temp%"
findstr /i /v /l "AE_CL_CREATE_PARTICLE_EFFECT" %qc_file% >> temp_draw_idle_drinks_special
move temp_draw_idle_drinks_special %qc_file% >nul

:delete_temp_and_exit
cd "%smd_folder%"
IF EXIST nodes del nodes >nul
goto :EOF

:smd_statinator
cd "%smd_folder%"
::delete temp - except nodes
IF EXIST first_frame del first_frame >nul
IF EXIST framecount del framecount >nul
IF EXIST addedframes del addedframes >nul
IF EXIST static.smd del static.smd >nul
::extract first frame of idle
set echo_now=off
FOR /F "tokens=*" %%A IN (%idle_smd%) DO (
	IF "%%A" EQU "time 0" set echo_now=on
	IF NOT "%%A" EQU "time 0" IF NOT "%%A" EQU "time 1" IF !echo_now!==on ECHO %%A
	IF "%%A" EQU "time 1" goto :first_frame_extracted ) >> first_frame
:first_frame_extracted
::extract number of frames
findstr /i /c:"time" "%smd_to_make_static%" > framecount
::add frames
FOR /F "tokens=*" %%A IN (framecount) DO (
	echo %%A
	type first_frame ) >> addedframes
::build file and replace original
copy "nodes" + "addedframes" "static.smd" >nul
echo end >> static.smd
move "static.smd" "%smd_to_make_static%" >nul
::delete temp
IF EXIST first_frame del first_frame >nul
IF EXIST framecount del framecount >nul
IF EXIST addedframes del addedframes >nul
IF EXIST static.smd del static.smd >nul
::exit call
exit /b

goto :EOF
:snap_remover
cd "%qc_folder_temp%"
::del temp first
IF EXIST "removed_snap.qc" del "removed_snap.qc" >nul
::remove snap from sequence
set start_removal=off
FOR /F "tokens=*" %%A IN (%qc_file%) DO (
	IF "%%A" EQU "$sequence "%sequence_to_remove_snap_from%" {" set start_removal=on
	IF "%%A" EQU "}" set start_removal=off
	IF !start_removal!==on IF NOT "%%A" EQU "snap" echo.%%A
	IF !start_removal!==off echo.%%A ) >> removed_snap.qc
::replace qc
IF EXIST "removed_snap.qc" move "removed_snap.qc" "%qc_file%" >nul
::exit call
exit /b