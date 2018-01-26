
//starts his animation
if (instance_exists(megaman) && froze == 0)
{
    if (canup == -1) {canup = 0; alarm[0] = 60; alarm[1] = 1; exit; }

    if (image_index == 0)
    {
        alarm[0] = 5;
        image_index = 1;
        exit;
    }
    if (image_index == 1)
    {
        alarm[0] = 5;
        image_index = 2;
        exit;
    }
	//starting here, it continues to cycle through the flying anumation
    if (image_index == 2)
    {
        alarm[0] = 5;
        image_index = 3;
        alarm[3] = 60;
        exit;
    }
    if (image_index == 3)
    {
        alarm[0] = 4;
        image_index = 4;
        exit;
    }
    if (image_index == 4)
    {
        alarm[0] = 4;
        image_index = 5;
        exit;
    }
    if (image_index == 5)
    {
        alarm[0] = 4;
        image_index = 3;
        exit;
    }
}
else alarm[0] = 1;