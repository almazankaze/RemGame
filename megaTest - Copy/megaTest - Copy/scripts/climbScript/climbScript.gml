//Climb

LADR1 = collision_line(x,y-20,x,y-26,ladder,true,true);
LADR2 = collision_point(x,y-14,ladder,true,true);
LADR3 = collision_point(x,y-0,ladderTop,true,true);

//Don't climb if ladder is off-screen
if (LADR1 && climbing == 0) {with (LADR1) {if (y<view_y && !instance_place(x+8,y+24,ladder)) {other.LADR1 = -4;} } }

//Climb and initiate climb up
if (LADR1 && canclimb)
{
    if (hurt == 0 && climbing == 2) {climbing = 1;}
	
	//makes player climb up
    if (KEYHOLD_UP && !KEYHOLD_DOWN && hurt == 0)
    {
        pressing_up = 1;
        if (climbing == 0) {alarm[0]=0; event_perform(ev_alarm,0);}
        climbing = 1;
        hsp = 0;
        x=LADR1.x+8;
        vsp=-climbsp;
        steploop=-1;
        alarm[0]=0; event_perform(ev_alarm,0);
        image_speed = 0.2;
        if (sprite_index = SPRITE_CLIMBSHOOT) {vsp = 0;}
    }
	
	//makes player climb down
    if (KEYHOLD_DOWN && climbing != 0 && hurt == 0)
    {
        pressing_down = 1;
        climbing = 1;
        vsp=climbsp;
        steploop=-1;
        image_speed = 0.2;
        if (sprite_index = SPRITE_CLIMBSHOOT) {vsp = 0;}
    }
}

//Bend over
if (!LADR1 && LADR2)
{
    if (hurt == 0 && climbing == 1) {climbing = 2;}
	
	//if going up
    if (KEYHOLD_UP && !KEYHOLD_DOWN && climbing != 0 && hurt == 0)
    {
        pressing_up = 1;
        hsp = 0;
        x=LADR2.x+8;
        vsp=-climbsp;
        steploop=-1;
        if (sprite_index = SPRITE_CLIMBSHOOT) {vsp = 0;}
    }
	
	//if going down
    if (KEYHOLD_DOWN && climbing != 0 && hurt == 0)
    {
        pressing_down = 1;
        vsp=climbsp;
        steploop=-1;
        if (sprite_index = SPRITE_CLIMBSHOOT) {vsp = 0;}
    }
}

//Pull yourself up
if (!LADR1 && !LADR2 && climbing == 2)
{
    y=instance_nearest(x,y,ladder).y-15;
    climbing = 0; vsp = 0; grounded = 1;
}

//Fall off ladder
if (!LADR1 && !LADR2 && !LADR3 && climbing != 0) {climbing = 0;}


//Initiate climb down
if (!LADR1 && !LADR2 && LADR3 && climbing == 0 && grounded == 1 && canclimb)
{
    if (LADR3.issolid == 1 && KEYHOLD_DOWN && hurt == 0)
    {
        pressing_down = 1;
        with (LADR3) {issolid = 0;}
        y=LADR3.y+15;
        climbing = 2;
        hsp = 0;
        x=LADR3.x+8;
        vsp=climbsp;
        steploop=-1; 
        alarm[0]=0; event_perform(ev_alarm,0);
        image_speed = 0.2;
        if (sprite_index = SPRITE_CLIMBSHOOT) {vsp = 0;}
    }
}