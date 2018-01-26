if (ricochet == 0) 
{
ricochet = 1;
audio_stop_sound(sndRicochet); audio_play_sound(sndRicochet,5,false)
audio_stop_sound(sndShoot1); //sound_stop(sfx_shoot2); sound_stop(sfx_shoot3);
vsp = -12;
hsp = -hsp;
image_xscale = -image_xscale;
}