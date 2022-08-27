@echo off
title Applying Soldier Settings...
echo		 Applying Soldier Settings...
set settings_file=settings_soldier.txt
set "smd_folder=%qc_folder_temp%\c_soldier_animations_anims"
set qc_file=c_soldier_animations.qc
cd "%batch_folder%"
call replace_snap.bat

:rocket_launchers
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::rocketlaunchers"

::set draw
set draw_sequence=dh_draw
::set draw smd
set draw_smd=dh_draw.smd

::set idle
set idle_sequence=dh_idle
::set idle smd
set idle_smd=dh_idle.smd

::set attack sequences
set attack_sequence_1=dh_fire

::set attack smds
set attack_smd_1=dh_fire.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=true
::seq_1 should be reload_start or the unique reload
set reload_sequence_1=dh_reload_start
set reload_sequence_2=dh_reload_start_alt
set reload_sequence_3=dh_reload_loop
set reload_sequence_4=dh_reload_finish
set reload_sequence_5=dh_reload_loop_alt
set reload_sequence_6=dh_reload_finish_alt

::set reload smds
set reload_smd_1=dh_reload_start.smd
set reload_smd_2=dh_reload_start_alt.smd
set reload_smd_3=dh_reload_loop.smd
set reload_smd_4=dh_reload_finish.smd
set reload_smd_5=dh_reload_loop_alt.smd
set reload_smd_6=dh_reload_finish_alt.smd

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=dh_idle
set sequence_2=dh_fire
set sequence_3=dh_draw
set sequence_4=dh_reload_start
set sequence_5=dh_reload_loop
set sequence_6=dh_reload_finish
set sequence_7=dh_reload_start_alt
set sequence_8=dh_reload_loop_alt
set sequence_9=dh_reload_finish_alt

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:mangler_extras
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::rocketlaunchers"

::set draw

::set draw smd

::set idle
set idle_sequence=dh_idle
::set idle smd
set idle_smd=dh_idle.smd

::set attack sequences
set attack_sequence_1=mangler_fire_super

::set attack smds
set attack_smd_1=mangler_fire_super.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload
set reload_sequence_1=mangler_reload_start
set reload_sequence_2=mangler_reload_loop
set reload_sequence_3=mangler_reload_finish

::set reload smds
set reload_smd_1=mangler_reload_start.smd
set reload_smd_2=mangler_reload_loop.smd
set reload_smd_3=mangler_reload_finish.smd

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=mangler_fire_super
set sequence_2=mangler_reload_start
set sequence_3=mangler_reload_loop
set sequence_4=mangler_reload_finish

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:original
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::original"

::set draw
set draw_sequence=bet_draw
::set draw smd
set draw_smd=bet_draw.smd

::set idle
set idle_sequence=bet_idle
::set idle smd
set idle_smd=bet_idle.smd

::set attack sequences
set attack_sequence_1=bet_fire

::set attack smds
set attack_smd_1=bet_fire.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload
set reload_sequence_1=bet_reload_start
set reload_sequence_2=bet_reload_loop
set reload_sequence_3=bet_reload_finish

::set reload smds
set reload_smd_1=bet_reload_start.smd
set reload_smd_2=bet_reload_loop.smd
set reload_smd_3=bet_reload_finish.smd

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=bet_idle
set sequence_2=bet_fire
set sequence_3=bet_draw
set sequence_4=bet_reload_start
set sequence_5=bet_reload_loop
set sequence_6=bet_reload_finish

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

:bison
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::bison"

::set draw
set draw_sequence=bison_draw
::set draw smd
set draw_smd=bison_draw.smd

::set idle
set idle_sequence=bison_idle
::set idle smd
set idle_smd=bison_idle.smd

::set attack sequences
set attack_sequence_1=bison_fire

::set attack smds
set attack_smd_1=bison_fire.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload
set reload_sequence_1=bison_reload_start
set reload_sequence_2=bison_reload_loop
set reload_sequence_3=bison_reload_end

::set reload smds
set reload_smd_1=bison_reload_start.smd
set reload_smd_2=bison_reload_loop.smd
set reload_smd_3=bison_reload_end.smd

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=bison_draw
set sequence_2=bison_idle
set sequence_3=bison_fire
set sequence_4=bison_reload_start
set sequence_5=bison_reload_loop
set sequence_6=bison_reload_end

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:buffbanner_battalions
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::buffbannerbb"

::set draw
set draw_sequence=bb_draw
::set draw smd
set draw_smd=bb_draw.smd

::set idle
set idle_sequence=bb_idle
::set idle smd
set idle_smd=bb_idle.smd

::set attack sequences
set attack_sequence_1=bb_fire_red
set attack_sequence_2=bb_fire_blue

::set attack smds
set attack_smd_1=bb_fire_red.smd
set attack_smd_2=bb_fire_blue.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=bb_draw
set sequence_2=bb_idle
set sequence_3=bb_fire_red
set sequence_4=bb_fire_blue

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:concheror
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::concheror"

::set draw
set draw_sequence=wh_draw
::set draw smd
set draw_smd=wh_draw.smd

::set idle
set idle_sequence=wh_idle
::set idle smd
set idle_smd=wh_idle.smd

::set attack sequences
set attack_sequence_1=wh_fire_red
set attack_sequence_2=wh_fire_blue

::set attack smds
set attack_smd_1=wh_fire_red.smd
set attack_smd_2=wh_fire_blue.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload
::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=wh_draw
set sequence_2=wh_idle
set sequence_3=wh_fire_red
set sequence_4=wh_fire_blue

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:melee
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::melee"

::set draw
set draw_sequence=s_draw
::set draw smd
set draw_smd=s_draw.smd

::set idle
set idle_sequence=s_idle
::set idle smd
set idle_smd=s_idle.smd

::set attack sequences
set attack_sequence_1=s_swing_a
set attack_sequence_2=s_swing_b
set attack_sequence_3=s_swing_c

::set attack smds
set attack_smd_1=s_swing_a.smd
set attack_smd_2=s_swing_b.smd
set attack_smd_3=s_swing_c.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload
::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=s_draw
set sequence_2=s_idle
set sequence_3=s_swing_a
set sequence_4=s_swing_b
set sequence_5=s_swing_c

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:melee_allclass
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

:rockets_inspects
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

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:original_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::originalinspect"

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

:secondary_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::secondaryinspect"

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

:bison_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::bisoninspect"

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

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:buffbanner_battalions_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::bufbannerbbinspect"

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

:concheror_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::concherorinspect"

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

:melee_allclass_inspect
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

:zatoichi_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::zatoichiinspect"

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
set other_sequence_1=special_inspect_start
set other_sequence_2=special_inspect_idle
set other_sequence_3=special_inspect_end

::name all the sequences for positioning
set sequence_1=special_inspect_start
set sequence_2=special_inspect_idle
set sequence_3=special_inspect_end

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

::delete settings file 
cd %qc_folder_temp% 
del %settings_file%