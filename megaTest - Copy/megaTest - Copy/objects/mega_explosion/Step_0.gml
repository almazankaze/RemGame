if (x-6 > view_x+view_w || x+6 < view_x || y-16 > view_y+view_h || y-16 < view_y)
    {instance_destroy();}

if (image_speed == 0) speed = 0;
else if (speed == 0) speed = pre_sp;