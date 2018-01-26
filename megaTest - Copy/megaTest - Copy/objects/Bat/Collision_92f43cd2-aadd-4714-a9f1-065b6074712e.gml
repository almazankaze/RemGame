
//hitting player activates all of this objects alarms where variables are reset
if (image_index > 2 && canup == 0)
{
    canup = 0;
    vsp = -2; 
    hsp = 0;
    alarm[1] = 0;
    alarm[3] += 6;
    alarm[2] = 30;
}