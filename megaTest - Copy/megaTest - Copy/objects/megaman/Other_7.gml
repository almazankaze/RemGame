if (paused) {exit;}

if (hurt == 1) //Ends the hurt animation
{
hurt = 0;
alarm[1] = 1;
flashloop = 29;
hsp = 0;
if (sliding == 1) 
{
    mask_index = sprMegaSlideMask;
    if (image_xscale == 1) {hsp = slidesp;}
    if (image_xscale == -1) {hsp = -slidesp;}
}

if (KEYHOLD_LEFT) 
{
    if (sliding == 1) 
    {
        if (hsp == 0 || hsp > 0) 
        {
            if (!collision_rectangle(x-7,y-16,x+7,y-28,block,true,true)) {event_perform(ev_alarm,0); image_xscale = -1;}
            else {alarm[0]=1; hsp = -slidesp; image_xscale = -1;}
        } 
    }
    if (grounded == 1)
    {
        image_xscale = -1; 
        image_index = 2; 
        if (!place_meeting(x-1,y,block) && sliding == 0) {x-=1;}
        steploop = 2;
    }
    else {canwalk = 1;}
}
if (KEYHOLD_RIGHT) 
{
    if (sliding == 1) 
    {
        if (hsp == 0 || hsp < 0) 
        {
            if (!collision_rectangle(x-7,y-16,x+7,y-28,block,true,true)) {event_perform(ev_alarm,0); image_xscale = 1;}
            else {alarm[0]=1; hsp = slidesp; image_xscale = 1;}
        } 
    }
    if (grounded == 1)
    {
        image_xscale = 1; 
        image_index = 2; 
        if (!place_meeting(x+1,y,block) && sliding == 0) {x+=1;}
        steploop = 2;
    }
    else {canwalk = 1;}
}

}