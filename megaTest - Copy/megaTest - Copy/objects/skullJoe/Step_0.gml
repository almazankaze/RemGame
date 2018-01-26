if (x-xv > view_x+view_w || x+xv < view_x || y > view_y+view_h || y < view_y) 
{event_user(15);}
else if (onscreen == 0) {onscreen = 1; visible = 1; froze = 0; }

if (paused) exit;

if (myhealth <= 0)
{
event_user(15);
instance_create_depth(x-1,y+8,0,itemexplosion);
exit;
}

if (instance_exists(megaman) && paused == 0 && froze == 0)
{

//makes me spin to face player
if (canspin == 1 && megaman.y-128 <= y && megaman.y > y-256)
{
    if ( (x < megaman.x && (image_index == 0 ||image_index == 1)) || (x > megaman.x && (image_index == 3 ||image_index == 4)) )
    {
        image_index = 3;
        alarm[2] = 3;
        canspin = 0;
    }
}

}