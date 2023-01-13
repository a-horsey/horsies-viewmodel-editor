@echo off

IF NOT %•Replace_reload_sound_with_stock(y/n)%==y goto :EOF
IF NOT "%settings_label%" EQU "&::original" goto :EOF

cd "%qc_folder_temp%"
::del temp just in case
IF EXIST original_sound_temp del original_sound_temp >nul
::replace event
set sequence_found=no
for /f "tokens=*" %%x in (%qc_file%) do (
	set "echo_line=%%x"
	set "check_line=!echo_line: =!"
	set "check_line=!check_line:	=!"
	IF "!check_line!" EQU "$sequence"%reload_sequence_1%"{" set "sequence_found=yes"
	IF "!check_line!" EQU "$sequence"%reload_sequence_2%"{" set "sequence_found=yes"
	IF "!check_line!" EQU "$sequence"%reload_sequence_3%"{" set "sequence_found=yes"
	IF "!check_line!" EQU "}" set "sequence_found=no"
	IF NOT !sequence_found!==yes echo !echo_line!
	IF !sequence_found!==yes (
		set "echo_line=!echo_line:Weapon_RPG.Reload=Weapon_RPG.WorldReload!"
		echo !echo_line:Weapon_QuakeRPG.Reload=Weapon_RPG.WorldReload! )
) >> original_sound_temp
::replace qc
IF EXIST original_sound_temp move "original_sound_temp" "%qc_file%" >nul