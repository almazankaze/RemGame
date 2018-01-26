if (!collision_line(x,y,x+6,y,water,true,true) && collision_line(x,y+8,x+6,y+8,water,true,true) || 
    collision_rectangle(x,y,x+6,y+4,block,true,true) ||
    x+3 > view_x+view_w || x+3 < view_x ||
    y > view_y+view_h || y+4 < view_y)
    {instance_destroy();}