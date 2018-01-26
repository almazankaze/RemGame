//is pretty bare bones, so pretty much everything in here is 
//essential for every enemy.

depth = -90;

myhealth = 2; 
//How much damage is dealt to the player
mypower = 3; 

image_speed = 0.4;
paused = 0;
onscreen = 1;
flashing = 0;
canhit = 0;
froze = 0;
//Relates to its cutoff position, or rather, when it becomes visible in the view and such
xv = 8; 

//if (x-xv > view_x+view_w || x+xv < view_x || y > view_y+view_h || y < view_y) 
//{visible = 0; onscreen = 0;}


//Sprite Variations
//As the 'powermuscler' enemy demonstrates, this is how you would recolor enemies based on what level they're in.
/*if (global.currentlevel == level_napalm)
{
    SPRITE_NORMAL = spr_lyric1;
}
else
{
    SPRITE_NORMAL = spr_lyric1;
}
sprite_index = SPRITE_NORMAL;