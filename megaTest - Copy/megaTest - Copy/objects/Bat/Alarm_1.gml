
//starts moving towards player if sprite animation is flying
if (instance_exists(megaman) && image_index > 2)
{
    alarm[1] = 4;
    move_towards_point(megaman.x,megaman.y,1);
    hsp = hspeed;
    vsp = vspeed;
    speed = 0;
}
else alarm[1] = 1;