@echo off
title Applying Engineer Settings...
echo Applying Engineer Settings...
set settings_file=settings_engineer.txt
set "smd_folder=%qc_folder_temp%\c_engineer_animations_anims"
set qc_file=c_engineer_animations.qc
cd "%batch_folder%"
call replace_snap.bat

:shotguns
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::shotguns"

::set draw
set draw_sequence=fj_draw
::set draw smd
set draw_smd=fj_draw.smd

::set idle
set idle_sequence=fj_idle
::set idle smd
set idle_smd=fj_idle.smd

::set attack sequences
set attack_sequence_1=fj_fire
set attack_sequence_2=fj_fire_alt
::set attack smds
set attack_smd_1=fj_fire.smd
set attack_smd_2=fj_fire_alt.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload
set reload_sequence_1=fj_reload_start
set reload_sequence_2=fj_reload_loop
set reload_sequence_3=fj_reload_end

::set reload smds
set reload_smd_1=fj_reload_start.smd
set reload_smd_2=fj_reload_loop.smd
set reload_smd_3=fj_reload_end.smd

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=fj_idle
set sequence_2=fj_fire
set sequence_3=fj_reload_start
set sequence_4=fj_reload_loop
set sequence_5=fj_reload_end
set sequence_6=fj_fire_alt
set sequence_7=fj_draw


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

:weapon_name
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::pomson"

::set draw
set draw_sequence=pomson_draw
::set draw smd
set draw_smd=pomson_draw.smd

::set idle
set idle_sequence=pomson_idle
::set idle smd
set idle_smd=pomson_idle.smd

::set attack sequences
set attack_sequence_1=pomson_fire

::set attack smds
set attack_smd_1=pomson_fire.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload
set reload_sequence_1=pomson_reload_start
set reload_sequence_2=pomson_reload_loop
set reload_sequence_3=pomson_reload_end

::set reload smds
set reload_smd_1=pomson_reload_start.smd
set reload_smd_2=pomson_reload_loop.smd
set reload_smd_3=pomson_reload_end.smd

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=pomson_draw
set sequence_2=pomson_idle
set sequence_3=pomson_fire
set sequence_4=pomson_reload_start
set sequence_5=pomson_reload_loop
set sequence_6=pomson_reload_end

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

:pistols
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::pistols"

::set draw
set draw_sequence=pstl_draw
::set draw smd
set draw_smd=pstl_draw.smd

::set idle
set idle_sequence=pstl_idle
::set idle smd
set idle_smd=pstl_idle.smd

::set attack sequences
set attack_sequence_1=pstl_fire

::set attack smds
set attack_smd_1=pstl_fire.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload
set reload_sequence_1=pstl_reload

::set reload smds
set reload_smd_1=pstl_reload.smd

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=pstl_draw
set sequence_2=pstl_idle
set sequence_3=pstl_fire
set sequence_4=pstl_reload

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

:wrangler
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::wrangler"

::set draw
set draw_sequence=wgl_draw
::set draw smd
set draw_smd=wgl_draw.smd

::set idle
set idle_sequence=wgl_idle
::set idle smd
set idle_smd=wgl_idle.smd

::set attack sequences - this is not a mistake, reloads are actually attack animations for wrangler
set attack_sequence_1=wgl_reload_start
set attack_sequence_2=wgl_reload_loop
set attack_sequence_3=wgl_reload_end

::set attack smds
set attack_smd_1=wgl_reload_start.smd
set attack_smd_2=wgl_reload_loop.smd
set attack_smd_3=wgl_reload_end.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=wgl_draw
set sequence_2=wgl_idle
set sequence_3=wgl_reload_start
set sequence_4=wgl_reload_loop
set sequence_5=wgl_reload_end

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

:wrangler_part2
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::wrangler"

::set draw

::set draw smd

::set idle
set idle_sequence=wgl_idle_rare
::set idle smd
set idle_smd=wgl_idle_rare.smd

::set attack sequences - this is not a mistake, reloads are actually attack animations for wrangler

::set attack smds

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=wgl_idle_rare

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

:wrenches
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::wrenches"

::set draw
set draw_sequence=pdq_draw
::set draw smd
set draw_smd=pdq_draw.smd

::set idle
set idle_sequence=pdq_idle_tap
::set idle smd
set idle_smd=pdq_idle_tap.smd

::set attack sequences
set attack_sequence_1=pdq_swing_a
set attack_sequence_2=pdq_swing_b
set attack_sequence_3=pdq_swing_c

::set attack smds
set attack_smd_1=pdq_swing_a.smd
set attack_smd_2=pdq_swing_b.smd
set attack_smd_3=pdq_swing_c.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=pdq_idle_tap
set sequence_2=pdq_draw
set sequence_3=pdq_swing_a
set sequence_4=pdq_swing_b
set sequence_5=pdq_swing_c

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

:gunslinger
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::gunslinger"

::set draw
set draw_sequence=gun_draw
::set draw smd
set draw_smd=gun_draw.smd

::set idle
set idle_sequence=gun_idle
::set idle smd
set idle_smd=gun_idle.smd

::set attack sequences
set attack_sequence_1=gun_swing_a
set attack_sequence_2=gun_swing_B

::set attack smds
set attack_smd_1=gun_swing_a.smd
set attack_smd_2=gun_swing_B.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=gun_idle
set sequence_2=gun_draw
set sequence_3=gun_swing_a
set sequence_4=gun_idle_rare
set sequence_5=gun_swing_B

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

:gunslinger_part2
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::gunslinger"

::set draw

::set draw smd

::set idle
set idle_sequence=gun_idle_rare
::set idle smd
set idle_smd=gun_idle_rare.smd

::set attack sequences

::set attack smds


::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=gun_idle_rare

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

:southern_hospitality
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::southernhospitality"

::set draw
set draw_sequence=spk_draw
::set draw smd
set draw_smd=spk_draw.smd

::set idle
set idle_sequence=spk_idle_tap
::set idle smd
set idle_smd=spk_idle_tap.smd

::set attack sequences
set attack_sequence_1=spk_swing_a
set attack_sequence_2=spk_swing_b
set attack_sequence_3=spk_swing_c
::set attack smds
set attack_smd_1=spk_swing_a.smd
set attack_smd_2=spk_swing_b.smd
set attack_smd_3=spk_swing_c.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=spk_idle_tap
set sequence_2=spk_draw
set sequence_3=spk_swing_a
set sequence_4=spk_swing_b
set sequence_5=spk_swing_c

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
set sequence_1=melee_allclass_idle
set sequence_2=melee_allclass_draw
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

:build_pda
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::buildpda"

::set draw
set draw_sequence=bld_draw
::set draw smd
set draw_smd=bld_draw.smd

::set idle
set idle_sequence=bld_idle
::set idle smd
set idle_smd=bld_idle.smd

::set attack sequences

::set attack smds

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=bld_draw
set sequence_2=bld_idle

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

:destroy_pda
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::destroypda"

::set draw
set draw_sequence=pda_draw
::set draw smd
set draw_smd=pda_draw.smd

::set idle
set idle_sequence=pda_idle
::set idle smd
set idle_smd=pda_idle.smd

::set attack sequences

::set attack smds

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=pda_draw
set sequence_2=pda_idle

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

:tool_box
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::toolbox"

::set draw
set draw_sequence=box_draw
::set draw smd
set draw_smd=box_draw.smd

::set idle
set idle_sequence=box_idle
::set idle smd
set idle_smd=box_idle.smd

::set attack sequences

::set attack smds

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=box_draw
set sequence_2=pda_idle

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

:shotguns_inspects
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::shotgunsinspects"

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

:pomson_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::pomsoninspects"

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
set other_sequence_1=secondary_alt1_inspect_start
set other_sequence_2=secondary_alt1_inspect_idle
set other_sequence_3=secondary_alt1_inspect_end

::name all the sequences for positioning
set sequence_1=secondary_alt1_inspect_start
set sequence_2=secondary_alt1_inspect_idle
set sequence_3=secondary_alt1_inspect_end

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

:pistol_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::pistolinspects"

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

:short_circuit_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::shortcircuitinspect"

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
set other_sequence_1=secondary_alt2_inspect_start
set other_sequence_2=secondary_alt2_inspect_idle
set other_sequence_3=secondary_alt2_inspect_end

::name all the sequences for positioning
set sequence_1=secondary_alt2_inspect_start
set sequence_2=secondary_alt2_inspect_idle
set sequence_3=secondary_alt2_inspect_end

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

:wrangler_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::wranglerinspect"

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

:wrench_inspects
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::wrenchinspects"

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

:gunslinger_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::gunslingerinspect"

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




