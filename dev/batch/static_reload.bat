SETLOCAL ENABLEDELAYEDEXPANSION
@echo off

::some logic to not apply if the reload animation is hidden
IF NOT %•Static_reload(y/n)%==y goto :EOF
IF NOT %•Hidden(y/n)%==y goto :process_reload
IF %•Hidden(y/n)%==y IF NOT %Keep_reload_visible(y/n)%==y goto :EOF
IF %•Hidden(y/n)%==y IF %Keep_reload_visible(y/n)%==y goto :process_reload

:process_reload
IF %idle_smd%==none goto :EOF

:extract_nodes
cd "%smd_folder%"
IF EXIST nodes del nodes >nul
FOR /F "tokens=*" %%A IN (%idle_smd%) DO (
	echo %%A
	IF %%A==skeleton goto :nodes_extracted ) >> nodes
:nodes_extracted

:static_reload
IF %reload_smd_1%==none goto :static_reload_done
set smd_to_make_static=%reload_smd_1%
call :smd_statinator

IF %reload_smd_2%==none goto :static_reload_done
set smd_to_make_static=%reload_smd_2%
call :smd_statinator

IF %reload_smd_3%==none goto :static_reload_done
set smd_to_make_static=%reload_smd_3%
call :smd_statinator

IF %reload_smd_4%==none goto :static_reload_done
set smd_to_make_static=%reload_smd_4%
call :smd_statinator

IF %reload_smd_5%==none goto :static_reload_done
set smd_to_make_static=%reload_smd_5%
call :smd_statinator

IF %reload_smd_6%==none goto :static_reload_done
set smd_to_make_static=%reload_smd_6%
call :smd_statinator

IF %reload_smd_7%==none goto :static_reload_done
set smd_to_make_static=%reload_smd_7%
call :smd_statinator

IF %reload_smd_8%==none goto :static_reload_done
set smd_to_make_static=%reload_smd_8%
call :smd_statinator
:static_reload_done


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


:delete_temp_and_exit
cd "%smd_folder%"
IF EXIST nodes del nodes >nul
IF EXIST first_frame del first_frame >nul
IF EXIST framecount del framecount >nul
IF EXIST addedframes del addedframes >nul
IF EXIST static.smd del static.smd >nul
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
::exit call
exit /b