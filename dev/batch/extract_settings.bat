@echo off
::extract settings file
cd "%decompiled_animations_temp%"
IF EXIST %settings_file% goto :extract_settings
cd "%vm_customizer_folder%"
copy "%settings_file%" "%decompiled_animations_temp%\%settings_file%"

:extract_settings
cd "%qc_folder_temp%"
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
set •Static_draw(y/n)=n
set •Static_reload(y/n)=n
set •Static_attack(y/n)=n
set •More_static_idle(y/n)=n
set •Remove_shells(y/n)=n
 ::spy stuff
set Keep_backstab_detection_visible(y/n)=n
set Keep_backstab_visible(y/n)=n
set •Replace_backstab_with_normal_attack(y/n)=n
set •Static_backstab_detection(y/n)=n
set •Static_backstab(y/n)=n
 ::special stuff
set Keep_shove_visible(y/n)=n
set •Static_shove(y/n)=n

::delete temp files just in case
IF EXIST extract_settings_temp del extract_settings_temp
IF EXIST extract_settings_temp_2 del extract_settings_temp_2
IF EXIST extracted_settings.bat del extracted_settings.bat

::extract settings
findstr /R /C:"\<%settings_label%\>" "%settings_file%" >> extract_settings_temp

::remove spaces and tabs from settings
(for /f "tokens=1" %%a in (extract_settings_temp) do echo %%a) >> extract_settings_temp_2

::create bat to convert to variables - adds "set " in front of settings
for /f "tokens=* delims= " %%a in (extract_settings_temp_2) do (
set /a N+=1
echo ^set %%a>>extracted_settings.bat
)

::apply variables
call extracted_settings.bat

::make sure the pos and rot values are numbers
set /A X_position=%X_position%
set /A Y_position=%Y_position%
set /A Z_position=%Z_position%
set /A X_rotation=%X_rotation%
set /A Y_rotation=%Y_rotation%
set /A Z_rotation=%Z_rotation%

::reset not defined variables
IF NOT DEFINED •Hidden(y/n) set •Hidden(y/n)=n
IF NOT DEFINED Keep_draw_visible(y/n) set Keep_draw_visible(y/n)=n
IF NOT DEFINED Keep_reload_visible(y/n) set Keep_reload_visible(y/n)=n
IF NOT DEFINED Keep_idle_visible(y/n) set Keep_idle_visible(y/n)=n
IF NOT DEFINED Keep_attack_visible(y/n) set Keep_attack_visible(y/n)=n
IF NOT DEFINED Keep_flames_visible(y/n) set Keep_flames_visible(y/n)=n
IF NOT DEFINED Keep_beam_visible(y/n) set Keep_beam_visible(y/n)=n
IF NOT DEFINED Keep_beam_visible(y/n) set Keep_backstab_detection_visible(y/n)=n
IF NOT DEFINED •Static_draw(y/n) set •Static_draw(y/n)=n
IF NOT DEFINED •Static_reload(y/n) set •Static_reload(y/n)=n
IF NOT DEFINED •Static_attack(y/n) set •Static_attack(y/n)=n
IF NOT DEFINED •More_static_idle(y/n) set •More_static_idle(y/n)=n
IF NOT DEFINED •Remove_shells(y/n) set •Remove_shells(y/n)=n
 ::spy stuff 
IF NOT DEFINED Keep_backstab_detection_visible(y/n) set Keep_backstab_detection_visible(y/n)=n
IF NOT DEFINED Keep_backstab_visible(y/n) set Keep_backstab_visible(y/n)=n
IF NOT DEFINED •Replace_backstab_with_normal_attack(y/n) set •Replace_backstab_with_normal_attack(y/n)=n
IF NOT DEFINED •Static_backstab_detection(y/n) set •Static_backstab_detection(y/n)=n
IF NOT DEFINED •Static_backstab(y/n) set •Static_backstab(y/n)=n
 ::special stuff
IF NOT DEFINED Keep_shove_visible(y/n) set Keep_shove_visible(y/n)=n
IF NOT DEFINED •Static_shove(y/n) set •Static_shove(y/n)=n

::remove caps from yes values for all variables
::could just use "IF /I" to avoid this but am too big brain
SET •Hidden(y/n)=%•Hidden(y/n):Y=y%
SET Keep_draw_visible(y/n)=%Keep_draw_visible(y/n):Y=y%
SET Keep_reload_visible(y/n)=%Keep_reload_visible(y/n):Y=y%
SET Keep_idle_visible(y/n)=%Keep_idle_visible(y/n):Y=y%
SET Keep_attack_visible(y/n)=%Keep_attack_visible(y/n):Y=y%
SET Keep_flames_visible(y/n)=%Keep_flames_visible(y/n):Y=y%
SET Keep_beam_visible(y/n)=%Keep_beam_visible(y/n):Y=y%
SET Keep_backstab_detection_visible(y/n)=%Keep_backstab_detection_visible(y/n):Y=y%
SET •Static_draw(y/n)=%•Static_draw(y/n):Y=y%
SET •Static_reload(y/n)=%•Static_reload(y/n):Y=y%
SET •Static_attack(y/n)=%•Static_attack(y/n):Y=y%
SET •More_static_idle(y/n)=%•More_static_idle(y/n):Y=y%
SET •Remove_shells(y/n)=%•Remove_shells(y/n):Y=y%
 ::spy stuff
set Keep_backstab_detection_visible(y/n)=%Keep_backstab_detection_visible(y/n):Y=y%
set Keep_backstab_visible(y/n)=%Keep_backstab_visible(y/n):Y=y%
set •Replace_backstab_with_normal_attack(y/n)=%•Replace_backstab_with_normal_attack(y/n):Y=y%
set •Static_backstab_detection(y/n)=%•Static_backstab_detection(y/n):Y=y%
set •Static_backstab(y/n)=%•Static_backstab(y/n):Y=y%
 ::special  stuff
set Keep_shove_visible(y/n)=%Keep_shove_visible(y/n):Y=y%
set •Static_shove(y/n)=%•Static_shove(y/n):Y=y%

::delete temp
IF EXIST extract_settings_temp del extract_settings_temp
IF EXIST extract_settings_temp_2 del extract_settings_temp_2
IF EXIST extracted_settings.bat del extracted_settings.bat

