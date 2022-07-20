@echo off
title Applying Spy Settings...
echo Applying Spy Settings...
set settings_file=settings_spy.txt
set "smd_folder=%qc_folder_temp%\c_spy_animations_anims"
set qc_file=c_spy_animations.qc
cd "%batch_folder%"
call replace_snap.bat

:revolvers
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::revolvers"

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
set reload_sequence_2_is_alternative_start=true
::seq_1 should be reload_start or the unique reload
set reload_sequence_1=reload
set reload_sequence_2=reload2

::set reload smds
set reload_smd_1=reload.smd
set reload_smd_2=reload2.smd

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=draw
set sequence_2=idle
set sequence_3=fire
set sequence_4=reload
set sequence_5=reload2

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

:sapper
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::sapper"

::set draw
set draw_sequence=c_sapper_drawDeployed
::set draw smd
set draw_smd=c_sapper_drawDeployed.smd

::set idle
set idle_sequence=c_sapper_idle
::set idle smd
set idle_smd=c_sapper_idle.smd

::set attack sequences
::set attack smds

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=c_sapper_drawDeployed
set sequence_2=c_sapper_idle
set sequence_4=layer_eyelids
set sequence_5=layer_sapper_needle

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

:sapper_part2
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::sapper"

::set draw
set draw_sequence=c_sapper_draw
::set draw smd
set draw_smd=c_sapper_draw.smd

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

::name all the sequences for positioning
set sequence_1=c_sapper_draw

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

:red_tape_recorder
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::redtaperecorder"

::set draw
set draw_sequence=c_sd_sapper_draw
::set draw smd
set draw_smd=c_sd_sapper_draw.smd

::set idle
set idle_sequence=c_sd_sapper_idle
::set idle smd
set idle_smd=c_sd_sapper_idle.smd

::set attack sequences
::set attack smds

::set reload sequences reload sequences

::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=c_sd_sapper_draw
set sequence_2=c_sd_sapper_idle
set sequence_3=layer_sd_sapper_reels

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

:bread_sapper
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::snackattack"

::set draw
set draw_sequence=c_breadmonster_sapper_draw
::set draw smd
set draw_smd=c_breadmonster_sapper_draw.smd

::set idle
set idle_sequence=c_breadmonster_sapper_drawDeployed
::set idle smd
set idle_smd=c_breadmonster_sapper_drawDeployed.smd

::set attack sequences

::set attack smds

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=c_breadmonster_sapper_draw
set sequence_2=c_breadmonster_sapper_drawDeployed

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

:butterfly_knife
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::butterfly"

::set draw
set draw_sequence=knife_draw
::set draw smd
set draw_smd=knife_draw.smd

::set idle
set idle_sequence=knife_idle
::set idle smd
set idle_smd=knife_idle.smd

::set attack sequences
set attack_sequence_1=knife_stab_a
set attack_sequence_2=knife_stab_b
set attack_sequence_3=knife_stab_c
::set attack smds
set attack_smd_1=knife_stab_a.smd
set attack_smd_2=knife_stab_b.smd
set attack_smd_3=knife_stab_c.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding


::name all the sequences for positioning
set sequence_1=knife_draw
set sequence_2=knife_idle
set sequence_3=knife_stab_a
set sequence_4=knife_stab_b
set sequence_5=knife_stab_c
set sequence_6=knife_backstab
set sequence_7=knife_backstab_up
set sequence_8=knife_backstab_down
set sequence_9=knife_backstab_idle
set sequence_10=knife_stun

::set some spy-exclusive stuff for the backstab scripts

::backstab itself
set backstab_attack_sequence=knife_backstab
set backstab_stun_sequence=knife_stun

set backstab_attack_smd=knife_backstab.smd
set backstab_stun_smd=knife_stun.smd

::backstab detection
set backstab_detect_sequence_up=knife_backstab_up
set backstab_detect_sequence_down=knife_backstab_down
set backstab_detect_sequence_idle=knife_backstab_idle

set backstab_detect_smd_up=knife_backstab_up.smd
set backstab_detect_smd_down=knife_backstab_down.smd
set backstab_detect_smd_idle=knife_backstab_idle.smd

::diagonal stabs
set diagonal_stab_smd=knife_stab_c.smd

::call files
cd "%batch_folder%"
call extract_settings.bat
cd "%batch_folder%"
call hide_weapon.bat
::call spy exclusive files
cd "%batch_folder%"
call spy_hide_backstabs.bat
cd "%batch_folder%"
call spy_replace_backstab.bat
cd "%batch_folder%"
call spy_static_backstabs.bat
::::::::::::::::::::::::::::::::::::
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

:kunai_yer_big_earner
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::kunaiyerbigearner"

::set draw
set draw_sequence=eternal_draw
::set draw smd
set draw_smd=eternal_draw.smd

::set idle
set idle_sequence=eternal_idle
::set idle smd
set idle_smd=eternal_idle.smd

::set attack sequences
set attack_sequence_1=eternal_stab_a
set attack_sequence_2=eternal_stab_b
set attack_sequence_3=eternal_stab_c

::set attack smds
set attack_smd_1=eternal_stab_a.smd
set attack_smd_2=eternal_stab_b.smd
set attack_smd_3=eternal_stab_c.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=eternal_idle
set sequence_2=eternal_stab_a
set sequence_3=eternal_stab_b
set sequence_4=eternal_stab_c
set sequence_5=eternal_backstab
set sequence_6=eternal_backstab_up
set sequence_7=eternal_backstab_down
set sequence_8=eternal_backstab_idle
set sequence_9=eternal_stun
set sequence_10=eternal_draw

::set some spy-exclusive stuff for the backstab scripts

::backstab itself
set backstab_attack_sequence=eternal_backstab
set backstab_stun_sequence=eternal_stun

set backstab_attack_smd=eternal_backstab.smd
set backstab_stun_smd=eternal_stun.smd

::backstab detection
set backstab_detect_sequence_up=eternal_backstab_up
set backstab_detect_sequence_down=eternal_backstab_down
set backstab_detect_sequence_idle=eternal_backstab_idle

set backstab_detect_smd_up=eternal_backstab_up.smd
set backstab_detect_smd_down=eternal_backstab_down.smd
set backstab_detect_smd_idle=eternal_backstab_idle.smd

::diagonal stabs
set diagonal_stab_smd=eternal_stab_c.smd


::call files
cd "%batch_folder%"
call extract_settings.bat
cd "%batch_folder%"
call hide_weapon.bat
::call spy exclusive files
cd "%batch_folder%"
call spy_hide_backstabs.bat
cd "%batch_folder%"
call spy_replace_backstab.bat
cd "%batch_folder%"
call spy_static_backstabs.bat
::::::::::::::::::::::::::::::::::::
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

:sharp_dresser
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::sharpdresser"

::set draw
set draw_sequence=acr_draw
::set draw smd
set draw_smd=acr_draw.smd

::set idle
set idle_sequence=acr_idle
::set idle smd
set idle_smd=acr_idle.smd

::set attack sequences
set attack_sequence_1=acr_stab_a
set attack_sequence_2=acr_stab_b
set attack_sequence_3=acr_stab_c

::set attack smds
set attack_smd_1=acr_stab_a.smd
set attack_smd_2=acr_stab_b.smd
set attack_smd_3=acr_stab_c.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=acr_draw
set sequence_2=acr_idle
set sequence_3=acr_stab_a
set sequence_4=acr_stab_b
set sequence_5=acr_stab_c
set sequence_6=acr_backstab
set sequence_7=acr_backstab_up
set sequence_8=acr_backstab_down
set sequence_9=acr_backstab_idle
set sequence_10=acr_stun

::set some spy-exclusive stuff for the backstab scripts

::backstab itself
set backstab_attack_sequence=acr_backstab
set backstab_stun_sequence=acr_stun

set backstab_attack_smd=acr_backstab.smd
set backstab_stun_smd=acr_stun.smd

::backstab detection
set backstab_detect_sequence_up=acr_backstab_up
set backstab_detect_sequence_down=acr_backstab_down
set backstab_detect_sequence_idle=acr_backstab_idle

set backstab_detect_smd_up=acr_backstab_up.smd
set backstab_detect_smd_down=acr_backstab_down.smd
set backstab_detect_smd_idle=acr_backstab_idle.smd

::diagonal stabs
set diagonal_stab_smd=acr_stab_c.smd


::call files
cd "%batch_folder%"
call extract_settings.bat
cd "%batch_folder%"
call hide_weapon.bat
::call spy exclusive files
cd "%batch_folder%"
call spy_hide_backstabs.bat
cd "%batch_folder%"
call spy_replace_backstab.bat
cd "%batch_folder%"
call spy_static_backstabs.bat
::::::::::::::::::::::::::::::::::::
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

:revolvers_inspects
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::revolversinspects"

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

:sappers_inspects
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::sappersinspects"

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
set other_sequence_1=building_inspect_start
set other_sequence_2=building_inspect_idle
set other_sequence_3=building_inspect_end

::name all the sequences for positioning
set sequence_1=building_inspect_start
set sequence_2=building_inspect_idle
set sequence_3=building_inspect_end

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

:bread_sapper_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::snackattackinspects"

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
set other_sequence_1=breadsapper_inspect_start
set other_sequence_2=breadsapper_inspect_idle
set other_sequence_3=breadsapper_inspect_end

::name all the sequences for positioning
set sequence_1=breadsapper_inspect_start
set sequence_2=breadsapper_inspect_idle
set sequence_3=breadsapper_inspect_end

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

:butterfly_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::knivesinspects"

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

:kunai_yer_big_earner_inspects
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::kunaiyerbigearnerinspects"

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

:sharp_dresser_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::sharpdresserinspect"

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
set other_sequence_2=item1_inspect_idle_A
set other_sequence_3=item1_inspect_idle_B
set other_sequence_4=item1_inspect_end

::name all the sequences for positioning
set sequence_1=item1_inspect_start
set sequence_2=item1_inspect_idle_A
set sequence_3=item1_inspect_idle_B
set sequence_4=item1_inspect_end

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

