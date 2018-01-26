if (soundplayed == 0)
{
soundplayed = 1;
audio_stop_sound(sndEnemyHit); 
audio_stop_sound(sndShoot1);  //sound_stop(sfx_shoot2); sound_stop(sfx_shoot3);
//sound_stop(sfx_gyroattack); 

audio_stop_sound(sndExplosion1);  audio_play_sound(sndExplosion1,5,false); 
}