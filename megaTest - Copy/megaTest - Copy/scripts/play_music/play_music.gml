/*
How to use:
Put in room creation code.
play_music(global.music_[name you gave song in init_music], "mp3", "loop" or "play")
argument0 = music to play
argument1 = type of music: mp3
argument2 = way to play the music: "loop" or "play"
ex:
play_music(global.music_introStage, "mp3", "loop")
*/

//bgmusic is initially set to nothing
with (system_obj)
{
	//sets type to the file type of the music
    type = argument1;
    
	//if type is "mp3"
    if (type == "mp3")
    {
		//starts checking which song to play from init_music
        global.bgmusic = argument0;
		
		//if you put "loop"
        if (argument2 == "loop") {
		
		//song will loop
		audio_play_sound(global.bgmusic, 1 , true)
		
		}
		
		//if you put "play"
        if (argument2 == "play") {
		
		//song will play only once
		audio_play_sound(global.bgmusic, 1 , false)
		
		}
    }
}