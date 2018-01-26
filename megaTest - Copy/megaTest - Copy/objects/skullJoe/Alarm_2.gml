
//turns enemy around to face player
if (instance_exists(megaman))
{
    canspin = 1;
    if (x < megaman.x) image_index = 3;
    else image_index = 0;
}