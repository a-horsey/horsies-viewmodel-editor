@echo off
title Applying Demoman Settings...
echo		 Applying Demoman Settings...
set settings_file=settings_demoman.txt
set "smd_folder=%qc_folder_temp%\c_demo_animations_anims"
set qc_file=c_demo_animations.qc
::replace snap
cd "%batch_folder%"
call replace_snap.bat

:grenade_launchers
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::grenadelaunchers"

::set draw
set draw_sequence=g_draw
::set draw smd
set draw_smd=g_draw.smd

::set idle
set idle_sequence=g_idle
::set idle smd
set idle_smd=g_idle.smd

::set attack sequences
set attack_sequence_1=g_fire
set attack_sequence_2=g_auto_fire

::set attack smds
set attack_smd_1=g_fire.smd
set attack_smd_2=g_auto_fire.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=true
::seq_1 should be reload_start or the unique reload
set reload_sequence_1=g_reload_start
set reload_sequence_2=loch_reload_start
set reload_sequence_3=g_reload_loop
set reload_sequence_4=g_reload_end
set reload_sequence_5=loch_reload_loop
set reload_sequence_6=loch_reload_end

::set reload smds
set reload_smd_1=g_reload_start.smd
set reload_smd_2=loch_reload_start.smd
set reload_smd_3=g_reload_loop.smd
set reload_smd_4=g_reload_end.smd
set reload_smd_5=loch_reload_loop.smd
set reload_smd_6=loch_reload_end.smd

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=g_draw
set sequence_2=g_idle
set sequence_3=g_fire
set sequence_4=g_auto_fire
set sequence_5=g_reload_start
set sequence_6=g_reload_loop
set sequence_7=g_reload_end
set sequence_8=loch_reload_start
set sequence_9=loch_reload_loop
set sequence_10=loch_reload_end

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:stickybomb_launchers
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::stickybomblaunchers"

::set draw
set draw_sequence=sb_draw
::set draw smd
set draw_smd=sb_draw.smd

::set idle
set idle_sequence=sb_idle
::set idle smd
set idle_smd=sb_idle.smd

::set attack sequences
set attack_sequence_1=sb_fire
set attack_sequence_2=sb_autofire

::set attack smds
set attack_smd_1=sb_fire.smd
set attack_smd_2=sb_autofire.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload
set reload_sequence_1=sb_reload_start
set reload_sequence_2=sb_reload_loop
set reload_sequence_3=sb_reload_end

::set reload smds
set reload_smd_1=sb_reload_start.smd
set reload_smd_2=sb_reload_loop.smd
set reload_smd_3=sb_reload_end.smd

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=sb_idle
set sequence_2=sb_fire
set sequence_3=sb_draw
set sequence_4=sb_autofire
set sequence_5=sb_reload_start
set sequence_6=sb_reload_loop
set sequence_7=sb_reload_end

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
set draw_sequence=b_draw
::set draw smd
set draw_smd=b_draw.smd

::set idle
set idle_sequence=b_idle
::set idle smd
set idle_smd=b_idle.smd

::set attack sequences
set attack_sequence_1=b_swing_a
set attack_sequence_2=b_swing_b
set attack_sequence_3=b_swing_c

::set attack smds
set attack_smd_1=b_swing_a.smd
set attack_smd_2=b_swing_b.smd
set attack_smd_3=b_swing_c.smd


::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=b_draw
set sequence_2=b_idle
set sequence_3=b_swing_a
set sequence_4=b_swing_b
set sequence_5=b_swing_c

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:swords
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::swords"

::set draw
set draw_sequence=cm_draw
::set draw smd
set draw_smd=cm_draw.smd

::set idle
set idle_sequence=cm_idle
::set idle smd
set idle_smd=cm_idle.smd

::set attack sequences
set attack_sequence_1=cm_swing_a
set attack_sequence_2=cm_swing_b
set attack_sequence_3=cm_swing_c

::set attack smds
set attack_smd_1=cm_swing_a.smd
set attack_smd_2=cm_swing_b.smd
set attack_smd_3=cm_swing_c.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=cm_draw
set sequence_2=cm_idle
set sequence_3=cm_swing_a
set sequence_4=cm_swing_b
set sequence_5=cm_swing_c

::apply settings
cd "%batch_folder%"
call apply_settings.bat
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
set sequence_1=melee_allclass_draw
set sequence_2=melee_allclass_idle
set sequence_3=melee_allclass_swing_a
set sequence_4=melee_allclass_swing_b
set sequence_5=melee_allclass_swing_c

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

:grenade_launchers_inspects
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::glaunchersinspects"

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

:lnl_ironbomber_loosecannon_inspects
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::lochnload_inspects"

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

:stickybomb_inspects
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::sblaunchersinspects"

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
set other_sequence_3=claymore_inspect_end

::name all the sequences for positioning
set sequence_1=melee_inspect_start
set sequence_2=melee_inspect_idle
set sequence_3=melee_inspect_end

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:swords_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::claidinspect"

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
set other_sequence_1=claymore_inspect_start
set other_sequence_2=claymore_inspect_idle
set other_sequence_3=claymore_inspect_end

::name all the sequences for positioning
set sequence_1=claymore_inspect_start
set sequence_2=claymore_inspect_idle
set sequence_3=claymore_inspect_end

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:melee_allclass_inspects
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::allclassmeleeinspect"

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
