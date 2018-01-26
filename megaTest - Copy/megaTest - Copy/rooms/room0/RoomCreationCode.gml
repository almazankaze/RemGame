init_music();

global.currentlevel = room;
play_music(global.music_testRoom,"mp3","loop");

//sets the controls
global.input = 0;
global.key_up = ord("W");
global.key_down = ord("S");
global.key_right = ord("D");
global.key_left = ord("A");
global.key_jump = ord("K");
global.key_shoot = ord("J");
global.key_start = vk_enter;

global.myHealth = 28;
global.myLives = 2;

//sets current weapon at start of game
global.currentweapon = "normal";
