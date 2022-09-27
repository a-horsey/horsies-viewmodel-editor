@echo off
title Applying Scout Settings...
echo		 Applying Scout Settings...
set settings_file=settings_scout.txt
set "smd_folder=%qc_folder_temp%\c_scout_animations_anims"
set qc_file=c_scout_animations.qc
cd "%batch_folder%"
call replace_snap.bat

:scatterguns
setlocal
cd "%batch_folder%"
call reset_settings.bat

::settings label for this weapon
set "settings_label=&::scatterguns"

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
set reload_sequence_1=sg_reload_start
set reload_sequence_2=sg_reload_loop
set reload_sequence_3=sg_reload_end

::set reload smds
set reload_smd_1=sg_reload_start.smd
set reload_smd_2=sg_reload_loop.smd
set reload_smd_3=sg_reload_end.smd

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=sg_draw
set sequence_2=sg_idle
set sequence_3=sg_fire
set sequence_4=sg_reload_start
set sequence_5=sg_reload_loop
set sequence_6=sg_reload_end

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:double_barrels
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::doublebarrels"

::set draw
set draw_sequence=db_draw
::set draw smd
set draw_smd=db_draw.smd

::set idle
set idle_sequence=db_idle
::set idle smd
set idle_smd=db_idle.smd

::set attack sequences
set attack_sequence_1=db_fire
::set attack smds
set attack_smd_1=db_fire.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload
set reload_sequence_1=db_reload

::set reload smds
set reload_smd_1=db_reload.smd

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=db_draw
set sequence_2=db_idle
set sequence_3=db_fire
set sequence_4=db_reload

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:shortstop
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::shortstop"

::set draw
set draw_sequence=ss_draw
::set draw smd
set draw_smd=ss_draw.smd

::set idle
set idle_sequence=ss_idle
::set idle smd
set idle_smd=ss_idle.smd

::set attack sequences
set attack_sequence_1=ss_fire

::set attack smds
set attack_smd_1=ss_fire.smd

::set secondary attack
set secondary_attack_sequence_1=ss_alt_fire
set secondary_attack_smd_1=ss_alt_fire.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload
set reload_sequence_1=ss_reload

::set reload smds
set reload_smd_1=ss_reload.smd

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=ss_draw
set sequence_2=ss_idle
set sequence_3=ss_fire
set sequence_4=ss_alt_fire
set sequence_5=ss_reload

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:pistols
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::pistols"

::set draw
set draw_sequence=p_draw
::set draw smd
set draw_smd=p_draw.smd

::set idle
set idle_sequence=p_idle
::set idle smd
set idle_smd=p_idle.smd

::set attack sequences
set attack_sequence_1=p_fire

::set attack smds
set attack_smd_1=p_fire.smd


::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload
set reload_sequence_1=p_reload

::set reload smds
set reload_smd_1=p_reload.smd


::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=p_draw
set sequence_2=p_idle
set sequence_3=p_fire
set sequence_4=p_reload

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:cleaver
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::cleaver"

::set draw
set draw_sequence=cleave_draw
::set draw smd
set draw_smd=cleave_draw.smd

::set idle
set idle_sequence=cleave_idle
::set idle smd
set idle_smd=cleave_idle.smd

::set attack sequences
set attack_sequence_1=cleave_throw

::set attack smds
set attack_smd_1=cleave_throw.smd


::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding


::name all the sequences for positioning
set sequence_1=cleave_idle
set sequence_2=cleave_draw
set sequence_3=cleave_throw

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:drinks
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::drinks"

::set draw
set draw_sequence=ed_draw
::set draw smd
set draw_smd=ed_draw.smd

::set idle
set idle_sequence=ed_idle
::set idle smd
set idle_smd=ed_idle.smd

::set attack sequences
set attack_sequence_1=ed_throw

::set attack smds
set attack_smd_1=ed_throw.smd


::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding


::name all the sequences for positioning
set sequence_1=ed_draw
set sequence_2=ed_idle
set sequence_3=ed_throw

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:mutated_milk
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

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=bm_fire
set sequence_2=bm_draw
set sequence_3=bm_idle


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
set attack_sequence_4=b_throw

::set attack smds
set attack_smd_1=b_swing_a.smd
set attack_smd_2=b_swing_b.smd
set attack_smd_3=b_swing_c.smd
set attack_smd_4=b_throw.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=b_idle
set sequence_2=b_draw
set sequence_3=b_swing_a
set sequence_4=b_swing_b
set sequence_5=b_swing_c
set sequence_6=b_throw

::apply settings
cd "%batch_folder%"
call apply_settings.bat
endlocal

:sandman
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::sandman"

::set draw
set draw_sequence=wb_draw
::set draw smd
set draw_smd=wb_draw.smd

::set idle
set idle_sequence=wb_idle
::set idle smd
set idle_smd=wb_idle.smd

::set attack sequences
set attack_sequence_1=wb_swing_a
set attack_sequence_2=wb_swing_b
set attack_sequence_3=wb_swing_c

::set attack smds
set attack_smd_1=wb_swing_a.smd
set attack_smd_2=wb_swing_b.smd
set attack_smd_3=wb_swing_c.smd

::set secondary attack
set secondary_attack_sequence_1=wb_fire
set secondary_attack_smd_1=wb_fire.smd
set secondary_attack_sequence_2=wb_grab
set secondary_attack_smd_2=wb_grab.smd

::set reload sequences reload sequences
::adds snap to seq_2 for rare weapons that need it - set to "true" to use
set reload_sequence_2_is_alternative_start=false
::seq_1 should be reload_start or the unique reload

::set reload smds

::set extra sequences for hiding

::name all the sequences for positioning
set sequence_1=wb_draw
set sequence_2=wb_idle
set sequence_3=wb_swing_a
set sequence_4=wb_swing_b
set sequence_5=wb_swing_c
set sequence_6=wb_fire
set sequence_7=wb_grab

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
set sequence_1=melee_allclass_idle
set sequence_2=melee_allclass_draw
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

:primary_inspect
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

:shortstop_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::shortstopinspect"

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

:double_barrels_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::doublebarrelinspect"

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

:cleaver_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::cleaverinspect"

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

:drinks_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::drinksinspect"

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

:mutated_milk_inspect
setlocal
cd "%batch_folder%"
call reset_settings.bat
::settings label for this weapon
set "settings_label=&::mutatedmilkinspect"

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
set other_sequence_1=breadmonster_inspect_start
set other_sequence_2=breadmonster_inspect_idle
set other_sequence_3=breadmonster_inspect_end

::name all the sequences for positioning
set sequence_1=breadmonster_inspect_start
set sequence_2=breadmonster_inspect_idle
set sequence_3=breadmonster_inspect_end

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