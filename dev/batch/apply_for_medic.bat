@echo off
title Applying Medic Settings...
echo		 Applying Medic Settings...
set settings_file=settings_medic.txt
set "smd_folder=%qc_folder_temp%\c_medic_animations_anims"
set qc_file=c_medic_animations.qc
cd "%batch_folder%"
call replace_snap.bat

:syringe_guns
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::syringecrossbow"

::set draw
set draw_sequence=sg_draw
::set draw smd
set draw_smd=sg_draw.smd

::set idle
set idle_sequence=sg_idle
::set idle smd
set idle_smd=sg_idle.smd

::set attack sequences
set attack_sequence_1=sg_fire
::set attack smds
set attack_smd_1=sg_fire.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload
set reload_sequence_1=sg_reload
::set reload smds
set reload_smd_1=sg_reload.smd

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=sg_draw
set sequence_2=sg_idle
set sequence_3=sg_fire
set sequence_4=sg_reload

::call files
cd "%batch_folder%"
call extract_settings.bat
cd "%batch_folder%"
call hide_weapon.bat
cd "%batch_folder%"
call apply_position_and_rotation.bat
cd "%batch_folder%"
call remove_reload.bat
cd "%batch_folder%"
call static_draw_idle_attack.bat
cd "%batch_folder%"
call remove_shells.bat
cd "%batch_folder%"
call snap_to_draws.bat
endlocal

:mediguns
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::mediguns"

::set draw
set draw_sequence=draw
::set draw smd
set draw_smd=draw.smd

::set idle
set idle_sequence=idle
::set idle smd
set idle_smd=idle.smd

::set attack sequences
set attack_sequence_1=fire_on
set attack_sequence_2=fire_loop
set attack_sequence_3=fire_off
::set attack smds
set attack_smd_1=fire_on.smd
set attack_smd_2=fire_loop.smd
set attack_smd_3=fire_off.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=draw
set sequence_2=idle
set sequence_3=fire_on
set sequence_4=fire_loop
set sequence_5=fire_off

::call files
cd "%batch_folder%"
call extract_settings.bat
cd "%batch_folder%"
call hide_weapon.bat
cd "%batch_folder%"
call apply_position_and_rotation.bat
cd "%batch_folder%"
call remove_reload.bat
cd "%batch_folder%"
call static_draw_idle_attack.bat
cd "%batch_folder%"
call remove_shells.bat
cd "%batch_folder%"
call snap_to_draws.bat
endlocal

:melee
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::melee"

::set draw
set draw_sequence=bs_draw
::set draw smd
set draw_smd=bs_draw.smd

::set idle
set idle_sequence=bs_idle
::set idle smd
set idle_smd=bs_idle.smd

::set attack sequences
set attack_sequence_1=bs_swing_a
set attack_sequence_2=bs_swing_b
set attack_sequence_3=bs_swing_c

::set attack smds
set attack_smd_1=bs_swing_a.smd
set attack_smd_2=bs_swing_b.smd
set attack_smd_3=bs_swing_c.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=bs_draw
set sequence_2=bs_idle
set sequence_3=bs_swing_a
set sequence_4=bs_swing_b
set sequence_5=bs_swing_c

::call files
cd "%batch_folder%"
call extract_settings.bat
cd "%batch_folder%"
call hide_weapon.bat
cd "%batch_folder%"
call apply_position_and_rotation.bat
cd "%batch_folder%"
call remove_reload.bat
cd "%batch_folder%"
call static_draw_idle_attack.bat
cd "%batch_folder%"
call remove_shells.bat
cd "%batch_folder%"
call snap_to_draws.bat
endlocal

:allclass_melee
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::allclassmelee"

::set draw
set draw_sequence=melee_allclass_draw
::set draw smd
set draw_smd=melee_allclass_draw.smd

::set idle
set idle_sequence=melee_allclass_idle
::set idle smd
set idle_smd=melee_allclass_idle.smd

::set attack sequences
set attack_sequence_1=melee_allclass_swing

::set attack smds
set attack_smd_1=melee_allclass_swing.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=melee_allclass_draw
set sequence_2=melee_allclass_idle
set sequence_3=melee_allclass_swing

::call files
cd "%batch_folder%"
call extract_settings.bat
cd "%batch_folder%"
call hide_weapon.bat
cd "%batch_folder%"
call apply_position_and_rotation.bat
cd "%batch_folder%"
call remove_reload.bat
cd "%batch_folder%"
call static_draw_idle_attack.bat
cd "%batch_folder%"
call remove_shells.bat
cd "%batch_folder%"
call snap_to_draws.bat
endlocal

:grappling_hook
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::grapplehook"

::set draw
::set draw_sequence=grapple_draw

::set idle

::set idle smd

::set attack sequences

::set attack smds

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding
set other_sequence_1=grapple_draw
set other_sequence_2=grapple_idle
set other_sequence_3=grapple_fire_start
set other_sequence_4=grapple_fire_idle
set other_sequence_5=grapple_pull_start
set other_sequence_6=grapple_pull_idle
set other_sequence_7=grapple_pull_end

::name all the sequences for positioning
set sequence_1=grapple_draw
set sequence_2=grapple_idle
set sequence_3=grapple_fire_start
set sequence_4=grapple_fire_idle
set sequence_5=grapple_pull_start
set sequence_6=grapple_pull_idle
set sequence_7=grapple_pull_end

::call files
cd "%batch_folder%"
call extract_settings.bat
cd "%batch_folder%"
call hide_weapon.bat
cd "%batch_folder%"
call apply_position_and_rotation.bat
cd "%batch_folder%"
call remove_reload.bat
cd "%batch_folder%"
call static_draw_idle_attack.bat
cd "%batch_folder%"
call remove_shells.bat
cd "%batch_folder%"
call snap_to_draws.bat
endlocal

:passtime_ball
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::passtimeball"

::set draw
::set draw_sequence=PASSTIME_ball_pickup

::set idle

::set idle smd

::set attack sequences

::set attack smds

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding
set other_sequence_1=PASSTIME_ball_pickup
set other_sequence_2=PASSTIME_ball_idle
set other_sequence_3=PASSTIME_ball_catch1
set other_sequence_4=PASSTIME_ball_catch2
set other_sequence_5=PASSTIME_ball_throw_end
set other_sequence_6=PASSTIME_ball_throw_start
set other_sequence_7=PASSTIME_ball_throw_loop

::name all the sequences for positioning
set sequence_1=PASSTIME_ball_pickup
set sequence_2=PASSTIME_ball_idle
set sequence_3=PASSTIME_ball_catch1
set sequence_4=PASSTIME_ball_catch2
set sequence_5=PASSTIME_ball_throw_end
set sequence_6=PASSTIME_ball_throw_start
set sequence_7=PASSTIME_ball_throw_loop

::call files
cd "%batch_folder%"
call extract_settings.bat
cd "%batch_folder%"
call hide_weapon.bat
cd "%batch_folder%"
call apply_position_and_rotation.bat
cd "%batch_folder%"
call remove_reload.bat
cd "%batch_folder%"
call static_draw_idle_attack.bat
cd "%batch_folder%"
call remove_shells.bat
cd "%batch_folder%"
call snap_to_draws.bat
endlocal

:spell_cast
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::spellcast"

::set draw

::set idle
::set idle smd

::set attack sequences

::set attack smds

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload
::set reload smds

::set extra sequences for hiding
set other_sequence_1=spell_draw
set other_sequence_2=spell_fire

::name all the sequences for positioning
set sequence_1=spell_draw
set sequence_2=spell_fire

::call files
cd "%batch_folder%"
call extract_settings.bat
cd "%batch_folder%"
call hide_weapon.bat
cd "%batch_folder%"
call apply_position_and_rotation.bat
cd "%batch_folder%"
call remove_reload.bat
cd "%batch_folder%"
call static_draw_idle_attack.bat
cd "%batch_folder%"
call remove_shells.bat
cd "%batch_folder%"
call snap_to_draws.bat
endlocal

:throw
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::throw"

::set draw
set draw_sequence=throw_draw
::set draw smd
set draw_smd=throw_draw.smd

::set idle
set idle_sequence=throw_idle
::set idle smd
set idle_smd=throw_idle.smd

::set attack sequences
set attack_sequence_1=throw_fire
::set attack smds
set attack_smd_1=throw_fire.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=throw_draw
set sequence_2=throw_idle
set sequence_3=throw_fire

::call files
cd "%batch_folder%"
call extract_settings.bat
cd "%batch_folder%"
call hide_weapon.bat
cd "%batch_folder%"
call apply_position_and_rotation.bat
cd "%batch_folder%"
call remove_reload.bat
cd "%batch_folder%"
call static_draw_idle_attack.bat
cd "%batch_folder%"
call remove_shells.bat
cd "%batch_folder%"
call snap_to_draws.bat
endlocal

:primary_inspects
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::syringecrossbowinspect"

::set draw

::set idle

::set idle smd

::set attack sequences

::set attack smds

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding
set other_sequence_1=primary_inspect_start
set other_sequence_2=primary_inspect_idle
set other_sequence_3=primary_inspect_end

::name all the sequences for positioning
set sequence_1=primary_inspect_start
set sequence_2=primary_inspect_idle
set sequence_3=primary_inspect_end

::call files
cd "%batch_folder%"
call extract_settings.bat
cd "%batch_folder%"
call hide_weapon.bat
cd "%batch_folder%"
call apply_position_and_rotation.bat
cd "%batch_folder%"
call remove_reload.bat
cd "%batch_folder%"
call static_draw_idle_attack.bat
cd "%batch_folder%"
call remove_shells.bat
cd "%batch_folder%"
call snap_to_draws.bat
endlocal

:medigun_inspects
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::medigunsinspects"

::set draw

::set idle

::set idle smd

::set attack sequences

::set attack smds

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding
set other_sequence_1=secondary_inspect_start
set other_sequence_2=secondary_inspect_idle
set other_sequence_3=secondary_inspect_end

::name all the sequences for positioning
set sequence_1=secondary_inspect_start
set sequence_2=secondary_inspect_idle
set sequence_3=secondary_inspect_end

::call files
cd "%batch_folder%"
call extract_settings.bat
cd "%batch_folder%"
call hide_weapon.bat
cd "%batch_folder%"
call apply_position_and_rotation.bat
cd "%batch_folder%"
call remove_reload.bat
cd "%batch_folder%"
call static_draw_idle_attack.bat
cd "%batch_folder%"
call remove_shells.bat
cd "%batch_folder%"
call snap_to_draws.bat
endlocal

:melee_inspects
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::meleeinspects"

::set draw

::set idle

::set idle smd

::set attack sequences

::set attack smds

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding
set other_sequence_1=melee_inspect_start
set other_sequence_2=melee_inspect_idle
set other_sequence_3=melee_inspect_end

::name all the sequences for positioning
set sequence_1=melee_inspect_start
set sequence_2=melee_inspect_idle
set sequence_3=melee_inspect_end

::call files
cd "%batch_folder%"
call extract_settings.bat
cd "%batch_folder%"
call hide_weapon.bat
cd "%batch_folder%"
call apply_position_and_rotation.bat
cd "%batch_folder%"
call remove_reload.bat
cd "%batch_folder%"
call static_draw_idle_attack.bat
cd "%batch_folder%"
call remove_shells.bat
cd "%batch_folder%"
call snap_to_draws.bat
endlocal

:allclass_melee_inspects
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::allclassmeleeinspects"

::set draw

::set idle

::set idle smd

::set attack sequences

::set attack smds

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding
set other_sequence_1=melee_allclass_inspect_start
set other_sequence_2=melee_allclass_inspect_idle
set other_sequence_3=melee_allclass_inspect_end

::name all the sequences for positioning
set sequence_1=melee_allclass_inspect_start
set sequence_2=melee_allclass_inspect_idle
set sequence_3=melee_allclass_inspect_end

::call files
cd "%batch_folder%"
call extract_settings.bat
cd "%batch_folder%"
call hide_weapon.bat
cd "%batch_folder%"
call apply_position_and_rotation.bat
cd "%batch_folder%"
call remove_reload.bat
cd "%batch_folder%"
call static_draw_idle_attack.bat
cd "%batch_folder%"
call remove_shells.bat
cd "%batch_folder%"
call snap_to_draws.bat
endlocal

::delete settings file 
cd %qc_folder_temp% 
del %settings_file%