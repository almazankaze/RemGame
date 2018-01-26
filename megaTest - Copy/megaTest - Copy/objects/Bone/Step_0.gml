if (paused) exit;

//if outside view, destroy
if (x-2 > view_x+view_w || x+2 < view_x || 
    y > view_y+view_h || y < view_y) 
{instance_destroy();}
    
x+=hsp;
y+=vsp;