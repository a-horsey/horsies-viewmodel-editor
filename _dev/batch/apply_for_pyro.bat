@echo off
title Applying Pyro Settings...
echo		 Applying Pyro Settings...
set settings_file=settings_pyro.txt
set "smd_folder=%qc_folder_temp%\c_pyro_animations_anims"
set qc_file=c_pyro_animations.qc


:flame_throwers
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::flamethrowers"

::set draw
set draw_sequence=ft_draw
::set draw smd
set draw_smd=ft_draw.smd

::set idle
set idle_sequence=ft_idle
::set idle smd
set idle_smd=ft_idle.smd

::set attack sequences
set attack_sequence_1=ft_fire

::set attack smds
set attack_smd_1=ft_fire.smd

::set secondary attack
set secondary_attack_sequence_1=ft_alt_fire
set secondary_attack_smd_1=ft_alt_fire.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=ft_idle
set sequence_2=ft_fire
set sequence_3=ft_draw
set sequence_4=ft_alt_fire

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:dragons_fury_because_weird_special_idle_and_attack
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::flamethrowers"

::set draw
set draw_sequence=none
::set draw smd
set draw_smd=none

::set idle
set idle_sequence=df_idle
::set idle smd
set idle_smd=df_idle.smd

::set attack sequences
set attack_sequence_1=df_fire

::set attack smds
set attack_smd_1=df_fire.smd

::set airblast sequence
set airblast_sequence=ft_alt_fire

::set airblast smd
set airblast_smd=ft_alt_fire.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload
::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=df_idle
set sequence_2=df_fire

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:shotguns
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::shotguns"

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
set reload_sequence_1=reload_start
set reload_sequence_2=reload_loop
set reload_sequence_3=reload_end
::set reload smds
set reload_smd_1=reload_start.smd
set reload_smd_2=reload_loop.smd
set reload_smd_3=reload_end.smd

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=draw
set sequence_2=idle
set sequence_3=fire
set sequence_4=reload_start
set sequence_5=reload_loop
set sequence_6=reload_end
::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:flare_guns
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::flareguns"

::set draw
set draw_sequence=fg_draw
::set draw smd
set draw_smd=fg_draw.smd

::set idle
set idle_sequence=fg_idle
::set idle smd
set idle_smd=fg_idle.smd

::set attack sequences
set attack_sequence_1=fg_fire

::set attack smds
set attack_smd_1=fg_fire.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=fg_draw
set sequence_2=fg_idle
set sequence_3=fg_fire

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:manmelter
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::manmelter"

::set draw
set draw_sequence=mm_draw
::set draw smd
set draw_smd=mm_draw.smd

::set idle
set idle_sequence=mm_idle
::set idle smd
set idle_smd=mm_idle.smd

::set attack sequences
set attack_sequence_1=mm_fire
::set attack smds
set attack_smd_1=mm_fire.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=mm_draw
set sequence_2=mm_idle
set sequence_3=mm_fire

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:thermal_thruster_part1_cuz_weird_anims_again
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::thermalthruster"

::set draw
set draw_sequence=rocketpack_draw
::set draw smd
set draw_smd=rocketpack_draw.smd

::set idle
set idle_sequence=rocketpack_idle
::set idle smd
set idle_smd=rocketpack_idle.smd

::set attack sequences
set attack_sequence_1=rocketpack_idle2

::set attack smds
set attack_smd_1=rocketpack_idle2.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=rocketpack_draw
set sequence_2=rocketpack_idle
set sequence_3=rocketpack_idle2

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:thermal_thruster_part2
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::thermalthruster"

::set draw
set draw_sequence=rocketpack_holster
::set draw smd
set draw_smd=rocketpack_holster.smd

::set idle
set idle_sequence=rocketpack_idle
::set idle smd
set idle_smd=rocketpack_idle.smd

::set attack sequences

::set attack smds

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=rocketpack_holster

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:gas_passer
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::gaspasser"

::set draw
set draw_sequence=gascan_draw
::set draw smd
set draw_smd=gascan_draw.smd

::set idle
set idle_sequence=gascan_idle
::set idle smd
set idle_smd=gascan_idle.smd

::set attack sequences
set attack_sequence_1=gascan_fire

::set attack smds
set attack_smd_1=gascan_fire.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload
::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=gascan_draw
set sequence_2=gascan_idle
set sequence_3=gascan_fire

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:melee
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::fireaxe"

::set draw
set draw_sequence=fa_draw
::set draw smd
set draw_smd=fa_draw.smd

::set idle
set idle_sequence=fa_idle
::set idle smd
set idle_smd=fa_idle.smd

::set attack sequences
set attack_sequence_1=fa_swing_a
set attack_sequence_2=fa_swing_b
set attack_sequence_3=fa_swing_c

::set attack smds
set attack_smd_1=fa_swing_a.smd
set attack_smd_2=fa_swing_b.smd
set attack_smd_3=fa_swing_c.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=fa_idle
set sequence_2=fa_draw
set sequence_3=fa_swing_a
set sequence_4=fa_swing_b
set sequence_5=fa_swing_c

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:hot_hand_part1_weird_stuff_again
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::hothand"

::set draw
set draw_sequence=slap_draw
::set draw smd
set draw_smd=slap_draw.smd

::set idle
set idle_sequence=slap_idle
::set idle smd
set idle_smd=slap_idle.smd

::set attack sequences
set attack_sequence_1=slap
set attack_sequence_2=slap3
set attack_sequence_3=slap2
::set attack smds
set attack_smd_1=slap.smd
set attack_smd_2=slap3.smd
set attack_smd_3=slap2.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload
::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=slap_draw
set sequence_2=slap_idle
set sequence_3=slap
set sequence_4=slap3
set sequence_5=slap2

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:hot_hand_part2
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::hothand"

::set draw

::set idle
set idle_sequence=slap_idle2
::set idle smd
set idle_smd=slap_idle2.smd

::set attack sequences

::set attack smds

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload
::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=slap_idle2

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:melee_allclass
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::meleeallclass"

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

::apply settings
cd "%batch_folder%"
call apply_settings.bat
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

::apply settings
cd "%batch_folder%"
call apply_settings.bat
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

::apply settings
cd "%batch_folder%"
call apply_settings.bat
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

::apply settings
cd "%batch_folder%"
call apply_settings.bat
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

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:flamethrowers_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::flamethrowersinspect"

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

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:dragonsfury_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::dragonsfuryinspect"

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
set other_sequence_1=dragons_fury_inspect_start
set other_sequence_2=dragons_fury_inspect_idle
set other_sequence_3=dragons_fury_inspect_end

::name all the sequences for positioning
set sequence_1=dragons_fury_inspect_start
set sequence_2=dragons_fury_inspect_idle
set sequence_3=dragons_fury_inspect_end

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:phlogistinator_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::phlogistinatorinspect"

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

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:secondaries_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::secondariesinspect"

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

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:flareguns_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::flaregunsinspect"

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

::apply settings
cd "%batch_folder%"
call apply_settings.bat
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

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:hothand_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::hothandinspect"

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
set other_sequence_1=item3_inspect_start
set other_sequence_2=item3_inspect_idle
set other_sequence_3=item3_inspect_end

::name all the sequences for positioning
set sequence_1=item3_inspect_start
set sequence_2=item3_inspect_idle
set sequence_3=item3_inspect_end

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:meleeallclass_inspect
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

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

::delete settings file 
cd %qc_folder_temp% 
del %settings_file%


