@echo off
title Applying Sniper Settings...
echo		 Applying Sniper Settings...
set settings_file=settings_sniper.txt
set "smd_folder=%qc_folder_temp%\c_sniper_animations_anims"
set qc_file=c_sniper_animations.qc
cd "%batch_folder%"
call replace_snap.bat

:sniper_rifles
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::sniperrifles"

::set draw
set draw_sequence=draw
::set draw smd
set draw_smd=draw.smd

::set idle
set idle_sequence=idle
::set idle smd
set idle_smd=idle.smd

::set attack sequences
set attack_sequence_1=fire
::set attack smds
set attack_smd_1=fire.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=draw
set sequence_2=fire
set sequence_3=idle

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

:huntsman
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::huntsman"

::set draw
set draw_sequence=bw_draw
::set draw smd
set draw_smd=bw_draw.smd

::set idle
set idle_sequence=bw_idle
::set idle smd
set idle_smd=bw_idle.smd

::set attack sequences
set attack_sequence_1=bw_charge
set attack_sequence_2=bw_fire
set attack_sequence_3=bw_shake
set attack_sequence_4=bw_dryfire
set attack_sequence_5=bw_idle2
set attack_sequence_6=bw_noammo

::set attack smds
set attack_smd_1=bw_charge.smd
set attack_smd_2=bw_fire.smd
set attack_smd_3=bw_shake.smd
set attack_smd_4=bw_dryfire.smd
set attack_smd_5=bw_idle2.smd
set attack_smd_6=bw_noammo.smd

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=bw_draw
set sequence_2=bw_idle
set sequence_3=bw_charge
set sequence_4=bw_fire
set sequence_5=bw_noammo
set sequence_6=bw_shake
set sequence_7=bw_dryfire
set sequence_8=bw_idle2

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

:huntsman_part2
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::huntsman"

::set draw

::set draw smd

::set idle
set idle_sequence=bw_idle
::set idle smd
set idle_smd=bw_idle.smd

::set attack sequences
set attack_sequence_1=bw_idle3

::set attack smds
set attack_smd_1=bw_idle3.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=bw_idle3
set sequence_2=none

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

:smgs
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::smgs"

::set draw
set draw_sequence=smg_draw
::set draw smd
set draw_smd=smg_draw.smd

::set idle
set idle_sequence=smg_idle
::set idle smd
set idle_smd=smg_idle.smd

::set attack sequences
set attack_sequence_1=smg_fire

::set attack smds
set attack_smd_1=smg_fire.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload
set reload_sequence_1=smg_reload
::set reload smds
set reload_smd_1=smg_reload.smd

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=smg_draw
set sequence_2=smg_idle
set sequence_3=smg_fire
set sequence_4=smg_reload

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

:jarate
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::jarate"

::set draw
set draw_sequence=pj_draw
::set draw smd
set draw_smd=pj_draw.smd

::set idle
set idle_sequence=pj_idle
::set idle smd
set idle_smd=pj_idle.smd

::set attack sequences
set attack_sequence_1=pj_fire

::set attack smds
set attack_smd_1=pj_fire.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=pj_draw
set sequence_2=pj_idle
set sequence_3=pj_fire

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

:bread_jarate
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::breadjar"

::set draw
set draw_sequence=bm_draw
::set draw smd
set draw_smd=bm_draw.smd

::set idle
set idle_sequence=bm_idle
::set idle smd
set idle_smd=bm_idle.smd

::set attack sequences
set attack_sequence_1=bm_fire
::set attack smds
set attack_smd_1=bm_fire.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=bm_fire
set sequence_2=bm_draw
set sequence_3=bm_idle

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
set draw_sequence=m_draw
::set draw smd
set draw_smd=m_draw.smd

::set idle
set idle_sequence=m_idle
::set idle smd
set idle_smd=m_idle.smd

::set attack sequences
set attack_sequence_1=m_swing_a
set attack_sequence_2=m_swing_b
set attack_sequence_3=m_swing_c
::set attack smds
set attack_smd_1=m_swing_a.smd
set attack_smd_2=m_swing_b.smd
set attack_smd_3=m_swing_c.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=m_idle
set sequence_2=m_draw
set sequence_3=m_swing_a
set sequence_4=m_swing_b
set sequence_5=m_swing_c

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
set attack_sequence_1=melee_allclass_swing_a
set attack_sequence_2=melee_allclass_swing_b
set attack_sequence_3=melee_allclass_swing_c
::set attack smds
set attack_smd_1=melee_allclass_swing_a.smd
set attack_smd_2=melee_allclass_swing_b.smd
set attack_smd_3=melee_allclass_swing_c.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=melee_allclass_idle
set sequence_2=melee_allclass_draw
set sequence_3=melee_allclass_swing_a
set sequence_4=melee_allclass_swing_b
set sequence_5=melee_allclass_swing_c

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

:snipers_inspects
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::primaryinspect"

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

:sydney_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::sydneysleeperinspect"

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
set other_sequence_1=primary_alt1_inspect_start
set other_sequence_2=primary_alt1_inspect_idle
set other_sequence_3=primary_alt1_inspect_end

::name all the sequences for positioning
set sequence_1=primary_alt1_inspect_start
set sequence_2=primary_alt1_inspect_idle
set sequence_3=primary_alt1_inspect_end

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

:huntsman_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::huntsmaninspect"

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
set other_sequence_1=item2_inspect_start
set other_sequence_2=item2_inspect_idle
set other_sequence_3=item2_inspect_end

::name all the sequences for positioning
set sequence_1=item2_inspect_start
set sequence_2=item2_inspect_idle
set sequence_3=item2_inspect_end

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

:smgs_inspects
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::smgsinspects"

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

:jarate_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::jarateinspects"

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
set other_sequence_1=item1_inspect_start
set other_sequence_2=item1_inspect_idle
set other_sequence_3=item1_inspect_end

::name all the sequences for positioning
set sequence_1=item1_inspect_start
set sequence_2=item1_inspect_idle
set sequence_3=item1_inspect_end

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

:bread_jarate_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::breadjarinspect"

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
set other_sequence_1=breadjar_inspect_start
set other_sequence_2=breadjar_inspect_idle
set other_sequence_3=breadjar_inspect_end

::name all the sequences for positioning
set sequence_1=breadjar_inspect_start
set sequence_2=breadjar_inspect_idle
set sequence_3=breadjar_inspect_end

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

:melee_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::meleeinspect"

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

:melee_allclass_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::meleeallclassinspect"

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