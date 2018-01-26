mypower = 2;

hsp = 0;
vsp = 0;

paused = 0;
onscreen = 1;
canhit = 0;
froze = 0;
isbullet = 1;

image_speed = 0.3;

//when created, moves towards player
if (instance_exists(megaman)) move_towards_point(megaman.x,megaman.y-16,5);
else instance_destroy();

hsp = round(hspeed);
vsp = round(vspeed);
speed = 0;