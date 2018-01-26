if (paused) {exit;}
if (global.myHealth <= 0) {exit;}

//Pause
if (KEYHOLD_START && pressing_start == 0 && hurt == 0 && !paused) //&& !instance_exists(boss_energyfiller))
{
pressing_start = 1;
//sound_stop(sfx_pause); sound_play(sfx_pause);
//instance_create_depth(view_xview,view_yview,fadeout_pause);
//fadeout_pause.pausevalue = 1;
}
if (!KEYHOLD_START && pressing_start == 1) {pressing_start = 0;}