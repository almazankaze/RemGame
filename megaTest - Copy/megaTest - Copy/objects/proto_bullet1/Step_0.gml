if (paused) {exit;}

//has the bullet move 
x+=hsp;
y+=vsp;

//bullet is destroyed if outside camera view
if (x-2 > view_x+view_w|| x+2 < view_x || y > view_y+view_h || y < view_y)
{instance_destroy();}

//Alarm Depth
if (alarmdepth > -1) 
{
    alarmdepth -= 1;
    if (alarmdepth == -1) 
    {
    depth = -10;
    }
}