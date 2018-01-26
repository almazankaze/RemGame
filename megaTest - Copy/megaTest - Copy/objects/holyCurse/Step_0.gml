//The bare bones step event for an enemy. This deals with its on screen functionality, its pausing,
//and what to do when it runs out of health. You'll usually find this code separated as below for all enemies.

if (x-xv > view_x+view_w || x+xv < view_x || y > view_y+view_h || y < view_y) 
{event_user(15);}
else if (onscreen == 0) {onscreen = 1; visible = 1; froze = 0; }

if (paused) exit;

if (myhealth <= 0)
{
event_user(15);
//creates explosion that spawns a random item
instance_create_depth(x-1,y+16,0,itemexplosion);
exit;
}


//follows the player
if (instance_exists(megaman) && paused == 0 && froze == 0)
{
mp_linear_step(megaman.x,megaman.y-16,1.0,false);
}