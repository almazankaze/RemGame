instance_destroy();
new = instance_create_depth(xstart,ystart,0,skullJoe);

if (froze == 0 && onscreen == 1) //&& camera.movecount == 0 && !instance_exists(fadeout_death)) 
{
    with (new) 
    {
        if (x-xv < view_x+view_w || x+xv > view_x || y > view_y+view_h || y < view_y) 
        {froze = 1; visible = 0; } 
    } 
}