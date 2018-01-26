if (x-xv > view_x+view_w || x+xv < view_x || y-20 > view_y+view_h || y-4 < view_y) 
{event_user(15); }
else if (onscreen == 0) {onscreen = 1; visible = 1; froze = 0; }

if (paused) exit;

if (myhealth <= 0)
{
event_user(15);
instance_create_depth(x-2,y+4,0,itemexplosion);
exit;
}

if (paused == 0 && froze == 0)
{

x+=hsp;
y+=vsp;

}