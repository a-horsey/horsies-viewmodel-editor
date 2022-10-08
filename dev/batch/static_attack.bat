SETLOCAL ENABLEDELAYEDEXPANSION
@echo off

:check_setting_attack
IF NOT %•Static_attack(y/n)%==y goto :EOF
IF NOT %•Hidden(y/n)%==y goto :process_attack
IF %•Hidden(y/n)%==y IF NOT %Keep_attack_visible(y/n)%==y goto :EOF
IF %•Hidden(y/n)%==y IF %Keep_attack_visible(y/n)%==y goto :process_attack

:process_attack
IF %idle_smd%==none goto :EOF

:extract_nodes
cd "%smd_folder%"
IF EXIST nodes del nodes >nul
FOR /F "tokens=*" %%A IN (%idle_smd%) DO (
	echo %%A
	IF %%A==skeleton goto :nodes_extracted ) >> nodes
:nodes_extracted

:static_attack
IF %attack_smd_1%==none goto :static_attack_done
set smd_to_make_static=%attack_smd_1%
call :smd_statinator

IF %attack_smd_2%==none goto :static_attack_done
set smd_to_make_static=%attack_smd_2%
call :smd_statinator

IF %attack_smd_3%==none goto :static_attack_done
set smd_to_make_static=%attack_smd_3%
call :smd_statinator

IF %attack_smd_4%==none goto :static_attack_done
set smd_to_make_static=%attack_smd_4%
call :smd_statinator

IF %attack_smd_5%==none goto :static_attack_done
set smd_to_make_static=%attack_smd_5%
call :smd_statinator

IF %attack_smd_6%==none goto :static_attack_done
set smd_to_make_static=%attack_smd_6%
call :smd_statinator
:static_attack_done

:apply_fade_values
cd "%qc_folder_temp%"
set fade_values=fadein 0.2 fadeout 0.2

IF %attack_sequence_1%==none goto :apply_fade_values_done
echo $append %attack_sequence_1% %fade_values% >> %qc_file%

IF %attack_sequence_2%==none goto :apply_fade_values_done
echo $append %attack_sequence_2% %fade_values% >> %qc_file%

IF %attack_sequence_3%==none goto :apply_fade_values_done
echo $append %attack_sequence_3% %fade_values% >> %qc_file%

IF %attack_sequence_4%==none goto :apply_fade_values_done
echo $append %attack_sequence_4% %fade_values% >> %qc_file%

IF %attack_sequence_5%==none goto :apply_fade_values_done
echo $append %attack_sequence_5% %fade_values% >> %qc_file%

IF %attack_sequence_6%==none goto :apply_fade_values_done
echo $append %attack_sequence_6% %fade_values% >> %qc_file%
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