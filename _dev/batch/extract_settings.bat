@echo off
::extract settings file
cd "%decompiled_animations_temp%"
IF EXIST %settings_file% goto :extract_settings
cd "%vm_customizer_folder%"
::extract without spaces/tabs
FOR /F "tokens=1 delims=" %%A IN (%settings_file%) DO (
	set "space_remover=%%A"
	set "space_remover=!space_remover: =!"
	set "space_remover=!space_remover:	=!"
	echo.!space_remover! 
) >> "%decompiled_animations_temp%\%settings_file%"

:extract_settings
::set all possible settings to default values before - prevents crashes
set X_position=0
set Y_position=0
set Z_position=0
set X_rotation=0
set Y_rotation=0
set Z_rotation=0
set •Hidden(y/n)=n
set Keep_draw_visible(y/n)=n
set Keep_reload_visible(y/n)=n
set Keep_idle_visible(y/n)=n
set Keep_attack_visible(y/n)=n
set Keep_flames_visible(y/n)=n
set Keep_beam_visible(y/n)=n
set Keep_backstab_detection_visible(y/n)=n
set Keep_tracers_visible(y/n)=y
set •Static_draw(y/n)=n
set •Static_reload(y/n)=n
set •Static_attack(y/n)=n
set •More_static_idle(y/n)=n
set •Remove_shells(y/n)=n
set •Remove_left_arm(y/n)=n
set •Remove_right_arm(y/n)=n
 ::spy stuff
set Keep_backstab_detection_visible(y/n)=n
set Keep_backstab_visible(y/n)=n
set •Instant_backstab_detection(y/n)=n
set •Replace_backstab_with_normal_attack(y/n)=n
set Choose_normal_attack(poke/horizontal_swipe/diagonal_swipe)=horizontal_swipe
set •Static_backstab_detection(y/n)=n
set •Static_backstab(y/n)=n
 ::secondary attack
set Keep_secondary_attack_visible(y/n)=n
set •Static_secondary_attack(y/n)=n
 ::hidden settings
set •Turn_beam_into_trail_when_hidden(y/n)=n

::delete temp files just in case
cd "%qc_folder_temp%"
IF EXIST settings_temp del settings_temp >nul

::extract settings and turn into bat - automatically removes useless lines
set start_echo=off
set echod_once=off
set two_labels_found=no
FOR /F "tokens=1" %%A IN (%settings_file%) DO (
	set "echo_this=%%A"
	IF "!echo_this!" EQU "%settings_label%" set start_echo=on
	IF NOT "!echo_this!" EQU "•Position:" IF NOT "!echo_this!" EQU "•Rotation:" IF NOT "!echo_this!" EQU "%settings_label%" IF !start_echo!==on echo. set "!echo_this!" && set echod_once=on
	IF "!echo_this!" EQU "%settings_label%" IF !echod_once!==on (
		set two_labels_found=yes
		goto :settings_extracted )
) >>settings_temp	
::check for missing labels
IF NOT %two_labels_found%==yes (
	echo 		^%settings_label% label missing, skipping weapon...
	goto :process_settings )

:settings_extracted
more +1 settings_temp > extracted_settings.bat
::delete temp
IF EXIST settings_temp del settings_temp >nul

::apply settings variables
call extracted_settings.bat

::delete bat after applying
del extracted_settings.bat >nul

:process_settings
::reset not defined variables
IF NOT DEFINED •Hidden(y/n) set •Hidden(y/n)=n
IF NOT DEFINED Keep_draw_visible(y/n) set Keep_draw_visible(y/n)=n
IF NOT DEFINED Keep_reload_visible(y/n) set Keep_reload_visible(y/n)=n
IF NOT DEFINED Keep_idle_visible(y/n) set Keep_idle_visible(y/n)=n
IF NOT DEFINED Keep_attack_visible(y/n) set Keep_attack_visible(y/n)=n
IF NOT DEFINED Keep_flames_visible(y/n) set Keep_flames_visible(y/n)=n
IF NOT DEFINED Keep_beam_visible(y/n) set Keep_beam_visible(y/n)=n
IF NOT DEFINED Keep_tracers_visible(y/n) set Keep_tracers_visible(y/n)=y
IF NOT DEFINED •Static_draw(y/n) set •Static_draw(y/n)=n
IF NOT DEFINED •Static_reload(y/n) set •Static_reload(y/n)=n
IF NOT DEFINED •Static_attack(y/n) set •Static_attack(y/n)=n
IF NOT DEFINED •More_static_idle(y/n) set •More_static_idle(y/n)=n
IF NOT DEFINED •Remove_shells(y/n) set •Remove_shells(y/n)=n
IF NOT DEFINED •Remove_left_arm(y/n) set •Remove_left_arm(y/n)=n
IF NOT DEFINED •Remove_right_arm(y/n) set •Remove_right_arm(y/n)=n
IF NOT DEFINED •Replace_reload_sound_with_stock(y/n) set •Replace_reload_sound_with_stock(y/n)=n
 ::spy stuff 
IF NOT DEFINED Keep_backstab_detection_visible(y/n) set Keep_backstab_detection_visible(y/n)=n
IF NOT DEFINED Keep_backstab_visible(y/n) set Keep_backstab_visible(y/n)=n
IF NOT DEFINED •Instant_backstab_detection(y/n) set •Instant_backstab_detection(y/n)=n
IF NOT DEFINED •Replace_backstab_with_normal_attack(y/n) set •Replace_backstab_with_normal_attack(y/n)=n
IF NOT DEFINED Choose_normal_attack(poke/horizontal_swipe/diagonal_swipe) set Choose_normal_attack(poke/horizontal_swipe/diagonal_swipe)=horizontal_swipe
IF NOT DEFINED •Static_backstab_detection(y/n) set •Static_backstab_detection(y/n)=n
IF NOT DEFINED •Static_backstab(y/n) set •Static_backstab(y/n)=n
 ::secondary attack
IF NOT DEFINED Keep_secondary_attack_visible(y/n) set Keep_secondary_attack_visible(y/n)=n
IF NOT DEFINED •Static_secondary_attack(y/n) set •Static_secondary_attack(y/n)=n
 ::hidden settings
IF NOT DEFINED •Turn_beam_into_trail_when_hidden(y/n) set •Turn_beam_into_trail_when_hidden(y/n)=n
 ::positions
IF NOT DEFINED X_position set X_position=0
IF NOT DEFINED Y_position set Y_position=0
IF NOT DEFINED Z_position set Z_position=0
IF NOT DEFINED X_rotation set X_rotation=0
IF NOT DEFINED Y_rotation set Y_rotation=0
IF NOT DEFINED Z_rotation set Z_rotation=0
 ::make sure the pos and rot values are numbers
set /A X_position=%X_position%
set /A Y_position=%Y_position%
set /A Z_position=%Z_position%
set /A X_rotation=%X_rotation%
set /A Y_rotation=%Y_rotation%
set /A Z_rotation=%Z_rotation%

::remove caps from yes values for all variables
::could just use "IF /I" to avoid this but am too big brain
SET •Hidden(y/n)=%•Hidden(y/n):Y=y%
SET Keep_draw_visible(y/n)=%Keep_draw_visible(y/n):Y=y%
SET Keep_reload_visible(y/n)=%Keep_reload_visible(y/n):Y=y%
SET Keep_idle_visible(y/n)=%Keep_idle_visible(y/n):Y=y%
SET Keep_attack_visible(y/n)=%Keep_attack_visible(y/n):Y=y%
SET Keep_flames_visible(y/n)=%Keep_flames_visible(y/n):Y=y%
SET Keep_beam_visible(y/n)=%Keep_beam_visible(y/n):Y=y%
set Keep_tracers_visible(y/n)=%Keep_tracers_visible(y/n):Y=y%
set Keep_tracers_visible(y/n)=%Keep_tracers_visible(y/n):N=n%
SET •Static_draw(y/n)=%•Static_draw(y/n):Y=y%
SET •Static_reload(y/n)=%•Static_reload(y/n):Y=y%
SET •Static_attack(y/n)=%•Static_attack(y/n):Y=y%
SET •More_static_idle(y/n)=%•More_static_idle(y/n):Y=y%
SET •Remove_shells(y/n)=%•Remove_shells(y/n):Y=y%
SET •Remove_left_arm(y/n)=%•Remove_left_arm(y/n):Y=y%
SET •Remove_right_arm(y/n)=%•Remove_right_arm(y/n):Y=y%
SET •Replace_reload_sound_with_stock(y/n)=%•Replace_reload_sound_with_stock(y/n):Y=y%
 ::spy stuff
set Keep_backstab_detection_visible(y/n)=%Keep_backstab_detection_visible(y/n):Y=y%
set Keep_backstab_visible(y/n)=%Keep_backstab_visible(y/n):Y=y%
set •Instant_backstab_detection(y/n)=%•Instant_backstab_detection(y/n):Y=y%
set •Replace_backstab_with_normal_attack(y/n)=%•Replace_backstab_with_normal_attack(y/n):Y=y%
IF /I %Choose_normal_attack(poke/horizontal_swipe/diagonal_swipe)%==poke set Choose_normal_attack(poke/horizontal_swipe/diagonal_swipe)=poke
IF /I %Choose_normal_attack(poke/horizontal_swipe/diagonal_swipe)%==horizontal_swipe set Choose_normal_attack(poke/horizontal_swipe/diagonal_swipe)=horizontal_swipe
IF /I %Choose_normal_attack(poke/horizontal_swipe/diagonal_swipe)%==diagonal_swipe set Choose_normal_attack(poke/horizontal_swipe/diagonal_swipe)=diagonal_swipe
set •Static_backstab_detection(y/n)=%•Static_backstab_detection(y/n):Y=y%
set •Static_backstab(y/n)=%•Static_backstab(y/n):Y=y%
 ::secondary attack
set Keep_secondary_attack_visible(y/n)=%Keep_secondary_attack_visible(y/n):Y=y%
set •Static_secondary_attack(y/n)=%•Static_secondary_attack(y/n):Y=y%
::extra fixes
::used for other special condition settings
IF NOT %Choose_normal_attack(poke/horizontal_swipe/diagonal_swipe)%==poke IF NOT %Choose_normal_attack(poke/horizontal_swipe/diagonal_swipe)%==horizontal_swipe IF NOT %Choose_normal_attack(poke/horizontal_swipe/diagonal_swipe)%==diagonal_swipe set Choose_normal_attack(poke/horizontal_swipe/diagonal_swipe)=horizontal_swipe
 ::hidden settings
set •Turn_beam_into_trail_when_hidden(y/n)=%•Turn_beam_into_trail_when_hidden(y/n):Y=y%


