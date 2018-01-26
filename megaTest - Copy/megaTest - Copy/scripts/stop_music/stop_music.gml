/*
Put this in objects when you want the music to stop like when you die
music_stop()
*/

//stops the music
audio_pause_sound(global.bgmusic);
global.bgmusic = 0;