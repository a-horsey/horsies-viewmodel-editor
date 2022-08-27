@echo off

IF %qc_file%==c_sniper_animations.qc IF %•Remove_right_arm(y/n)%==y set •Remove_left_arm(y/n)==y
IF NOT %•Remove_left_arm(y/n)%==y goto :EOF
IF %•Hidden(y/n)%==y IF NOT %Keep_draw_visible(y/n)%==y IF NOT %Keep_attack_visible(y/n)%==y IF NOT %Keep_reload_visible(y/n)%==y IF NOT %Keep_idle_visible(y/n)%==y IF NOT %Keep_secondary_attack_visible(y/n)%==y goto :EOF

:apply_weightlist_and_layer_sequence
IF %qc_file%==c_scout_animations.qc (
	cd "%smd_folder%"
	IF NOT EXIST "remove_left_arm.smd" copy "%dev_folder%\remove_left_arm_layers\layer_scout.smd" "%smd_folder%\remove_left_arm.smd" >nul
	cd "%qc_folder_temp%"
	IF NOT EXIST "%qc_file%.armremovalpresent" (
		copy /b "%qc_folder_temp%\%qc_file%" + "%dev_folder%\remove_left_arm_layers\%qc_file%_removearm" "%qc_folder_temp%\%qc_file%" >nul
		echo present > %qc_file%.armremovalpresent )
	goto :apply_weightlist_and_layer_sequence_done	)

IF %qc_file%==c_soldier_animations.qc (
	cd "%smd_folder%"
	IF NOT EXIST "remove_left_arm.smd" copy "%dev_folder%\remove_left_arm_layers\layer_soldier.smd" "%smd_folder%\remove_left_arm.smd" >nul
	cd "%qc_folder_temp%"
	IF NOT EXIST "%qc_file%.armremovalpresent" (
		copy /b "%qc_folder_temp%\%qc_file%" + "%dev_folder%\remove_left_arm_layers\%qc_file%_removearm" "%qc_folder_temp%\%qc_file%" >nul
		echo present > %qc_file%.armremovalpresent )
	goto :apply_weightlist_and_layer_sequence_done	)

IF %qc_file%==c_pyro_animations.qc (
	cd "%smd_folder%"
	IF NOT EXIST "remove_left_arm.smd" copy "%dev_folder%\remove_left_arm_layers\layer_pyro.smd" "%smd_folder%\remove_left_arm.smd" >nul
	IF NOT EXIST "remove_shell_model.smd" copy "%dev_folder%\remove_left_arm_layers\layer_pyro_shell_model.smd" "%smd_folder%\remove_shell_model.smd" >nul
	cd "%qc_folder_temp%"
	IF NOT EXIST "%qc_file%.armremovalpresent" (
		copy /b "%qc_folder_temp%\%qc_file%" + "%dev_folder%\remove_left_arm_layers\%qc_file%_removearm" "%qc_folder_temp%\%qc_file%" >nul
		echo present > %qc_file%.armremovalpresent )
	goto :apply_weightlist_and_layer_sequence_done	)

IF %qc_file%==c_demo_animations.qc (
	cd "%smd_folder%"
	IF NOT EXIST "remove_left_arm.smd" copy "%dev_folder%\remove_left_arm_layers\layer_demo.smd" "%smd_folder%\remove_left_arm.smd" >nul
	cd "%qc_folder_temp%"
	IF NOT EXIST "%qc_file%.armremovalpresent" (
		copy /b "%qc_folder_temp%\%qc_file%" + "%dev_folder%\remove_left_arm_layers\%qc_file%_removearm" "%qc_folder_temp%\%qc_file%" >nul
		echo present > %qc_file%.armremovalpresent )
	goto :apply_weightlist_and_layer_sequence_done	)

IF %qc_file%==c_heavy_animations.qc (
	cd "%smd_folder%"
	IF NOT EXIST "remove_left_arm.smd" copy "%dev_folder%\remove_left_arm_layers\layer_heavy.smd" "%smd_folder%\remove_left_arm.smd" >nul
	cd "%qc_folder_temp%"
	IF NOT EXIST "%qc_file%.armremovalpresent" (
		copy /b "%qc_folder_temp%\%qc_file%" + "%dev_folder%\remove_left_arm_layers\%qc_file%_removearm" "%qc_folder_temp%\%qc_file%" >nul
		echo present > %qc_file%.armremovalpresent )
	goto :apply_weightlist_and_layer_sequence_done	)

IF %qc_file%==c_engineer_animations.qc (
	cd "%smd_folder%"
	IF NOT EXIST "remove_left_arm.smd" copy "%dev_folder%\remove_left_arm_layers\layer_engineer.smd" "%smd_folder%\remove_left_arm.smd" >nul
	cd "%qc_folder_temp%"
	IF NOT EXIST "%qc_file%.armremovalpresent" (
		copy /b "%qc_folder_temp%\%qc_file%" + "%dev_folder%\remove_left_arm_layers\%qc_file%_removearm" "%qc_folder_temp%\%qc_file%" >nul
		echo present > %qc_file%.armremovalpresent )
	goto :apply_weightlist_and_layer_sequence_done	)

IF %qc_file%==c_medic_animations.qc (
	cd "%smd_folder%"
	IF NOT EXIST "remove_left_arm.smd" copy "%dev_folder%\remove_left_arm_layers\layer_medic.smd" "%smd_folder%\remove_left_arm.smd" >nul
	cd "%qc_folder_temp%"
	IF NOT EXIST "%qc_file%.armremovalpresent" (
		copy /b "%qc_folder_temp%\%qc_file%" + "%dev_folder%\remove_left_arm_layers\%qc_file%_removearm" "%qc_folder_temp%\%qc_file%" >nul
		echo present > %qc_file%.armremovalpresent )
	goto :apply_weightlist_and_layer_sequence_done	)

IF %qc_file%==c_sniper_animations.qc (
	cd "%smd_folder%"
	IF NOT EXIST "remove_left_arm.smd" copy "%dev_folder%\remove_left_arm_layers\layer_sniper.smd" "%smd_folder%\remove_left_arm.smd" >nul
	cd "%qc_folder_temp%"
	IF NOT EXIST "%qc_file%.armremovalpresent" (
		copy /b "%qc_folder_temp%\%qc_file%" + "%dev_folder%\remove_left_arm_layers\%qc_file%_removearm" "%qc_folder_temp%\%qc_file%" >nul
		echo present > %qc_file%.armremovalpresent )
	goto :apply_weightlist_and_layer_sequence_done	)

IF %qc_file%==c_spy_animations.qc (
	cd "%smd_folder%"
	IF NOT EXIST "remove_left_arm.smd" copy "%dev_folder%\remove_left_arm_layers\layer_spy.smd" "%smd_folder%\remove_left_arm.smd" >nul
	cd "%qc_folder_temp%"
	IF NOT EXIST "%qc_file%.armremovalpresent" (
		copy /b "%qc_folder_temp%\%qc_file%" + "%dev_folder%\remove_left_arm_layers\%qc_file%_removearm" "%qc_folder_temp%\%qc_file%" >nul
		echo present > %qc_file%.armremovalpresent )
	goto :apply_weightlist_and_layer_sequence_done	)
:apply_weightlist_and_layer_sequence_done


:add_layer_to_sequences
cd "%qc_folder_temp%"

:apply_for_sequence_1
IF %sequence_1%==none goto :EOF
ECHO $append %sequence_1% addlayer "remove_left_arm" >> %qc_file%
IF %qc_file%==c_pyro_animations.qc IF %draw_smd%==draw.smd IF NOT %sequence_1%==reload_loop ECHO $append %sequence_1% addlayer "remove_shell_model" >> %qc_file%
IF %qc_file%==c_pyro_animations.qc IF %draw_smd%==draw.smd IF %sequence_1%==reload_loop IF %•Static_reload(y/n)%==y ECHO $append %sequence_1% addlayer "remove_shell_model" >> %qc_file%

:apply_for_sequence_2
IF %sequence_2%==none goto :EOF
ECHO $append %sequence_2% addlayer "remove_left_arm" >> %qc_file%
IF %qc_file%==c_pyro_animations.qc IF %draw_smd%==draw.smd IF NOT %sequence_2%==reload_loop ECHO $append %sequence_2% addlayer "remove_shell_model" >> %qc_file%
IF %qc_file%==c_pyro_animations.qc IF %draw_smd%==draw.smd IF %sequence_2%==reload_loop IF %•Static_reload(y/n)%==y ECHO $append %sequence_2% addlayer "remove_shell_model" >> %qc_file%

:apply_for_sequence_3
IF %sequence_3%==none goto :EOF
ECHO $append %sequence_3% addlayer "remove_left_arm" >> %qc_file%
IF %qc_file%==c_pyro_animations.qc IF %draw_smd%==draw.smd IF NOT %sequence_3%==reload_loop ECHO $append %sequence_3% addlayer "remove_shell_model" >> %qc_file%
IF %qc_file%==c_pyro_animations.qc IF %draw_smd%==draw.smd IF %sequence_3%==reload_loop IF %•Static_reload(y/n)%==y ECHO $append %sequence_3% addlayer "remove_shell_model" >> %qc_file%

:apply_for_sequence_4
IF %sequence_4%==none goto :EOF
ECHO $append %sequence_4% addlayer "remove_left_arm" >> %qc_file%
IF %qc_file%==c_pyro_animations.qc IF %draw_smd%==draw.smd IF NOT %sequence_4%==reload_loop ECHO $append %sequence_4% addlayer "remove_shell_model" >> %qc_file%
IF %qc_file%==c_pyro_animations.qc IF %draw_smd%==draw.smd IF %sequence_4%==reload_loop IF %•Static_reload(y/n)%==y ECHO $append %sequence_4% addlayer "remove_shell_model" >> %qc_file%

:apply_for_sequence_5
IF %sequence_5%==none goto :EOF
ECHO $append %sequence_5% addlayer "remove_left_arm" >> %qc_file%
IF %qc_file%==c_pyro_animations.qc IF %draw_smd%==draw.smd IF NOT %sequence_5%==reload_loop ECHO $append %sequence_5% addlayer "remove_shell_model" >> %qc_file%
IF %qc_file%==c_pyro_animations.qc IF %draw_smd%==draw.smd IF %sequence_5%==reload_loop IF %•Static_reload(y/n)%==y ECHO $append %sequence_5% addlayer "remove_shell_model" >> %qc_file%

:apply_for_sequence_6
IF %sequence_6%==none goto :EOF
ECHO $append %sequence_6% addlayer "remove_left_arm" >> %qc_file%
IF %qc_file%==c_pyro_animations.qc IF %draw_smd%==draw.smd IF NOT %sequence_6%==reload_loop ECHO $append %sequence_6% addlayer "remove_shell_model" >> %qc_file%
IF %qc_file%==c_pyro_animations.qc IF %draw_smd%==draw.smd IF %sequence_6%==reload_loop IF %•Static_reload(y/n)%==y ECHO $append %sequence_6% addlayer "remove_shell_model" >> %qc_file%

:apply_for_sequence_7
IF %sequence_7%==none goto :EOF
ECHO $append %sequence_7% addlayer "remove_left_arm" >> %qc_file%
IF %qc_file%==c_pyro_animations.qc IF %draw_smd%==draw.smd IF NOT %sequence_7%==reload_loop ECHO $append %sequence_7% addlayer "remove_shell_model" >> %qc_file%
IF %qc_file%==c_pyro_animations.qc IF %draw_smd%==draw.smd IF %sequence_7%==reload_loop IF %•Static_reload(y/n)%==y ECHO $append %sequence_7% addlayer "remove_shell_model" >> %qc_file%

:apply_for_sequence_8
IF %sequence_8%==none goto :EOF
ECHO $append %sequence_8% addlayer "remove_left_arm" >> %qc_file%
IF %qc_file%==c_pyro_animations.qc IF %draw_smd%==draw.smd IF NOT %sequence_8%==reload_loop ECHO $append %sequence_8% addlayer "remove_shell_model" >> %qc_file%
IF %qc_file%==c_pyro_animations.qc IF %draw_smd%==draw.smd IF %sequence_8%==reload_loop IF %•Static_reload(y/n)%==y ECHO $append %sequence_8% addlayer "remove_shell_model" >> %qc_file%

:apply_for_sequence_9
IF %sequence_9%==none goto :EOF
ECHO $append %sequence_9% addlayer "remove_left_arm" >> %qc_file%
IF %qc_file%==c_pyro_animations.qc IF %draw_smd%==draw.smd IF NOT %sequence_9%==reload_loop ECHO $append %sequence_9% addlayer "remove_shell_model" >> %qc_file%
IF %qc_file%==c_pyro_animations.qc IF %draw_smd%==draw.smd IF %sequence_9%==reload_loop IF %•Static_reload(y/n)%==y ECHO $append %sequence_9% addlayer "remove_shell_model" >> %qc_file%

:apply_for_sequence_10
IF %sequence_10%==none goto :EOF
ECHO $append %sequence_10% addlayer "remove_left_arm" >> %qc_file%
IF %qc_file%==c_pyro_animations.qc IF %draw_smd%==draw.smd IF NOT %sequence_10%==reload_loop ECHO $append %sequence_10% addlayer "remove_shell_model" >> %qc_file%
IF %qc_file%==c_pyro_animations.qc IF %draw_smd%==draw.smd IF %sequence_10%==reload_loop IF %•Static_reload(y/n)%==y ECHO $append %sequence_10% addlayer "remove_shell_model" >> %qc_file%