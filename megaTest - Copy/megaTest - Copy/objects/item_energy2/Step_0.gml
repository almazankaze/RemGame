if (canfreeze == false && !paused)
{
//Block collision - X
if (instance_place(x+hsp,y,block))
{
    if (hsp!=0 && (instance_place(x+hsp,y,block)).issolid == 1) 
    {
        while (!place_meeting(x+sign(hsp),y,block)) {x+=sign(hsp);}
        hsp=0; x=floor(x); 
    }
}
x+=hsp;

//Check if in air
if (!collision_rectangle(x-0,y+12,x+15,y+15,block,true,true)) {grounded=0; }

//Set gravity
if (grounded == 0) {vsp+=grav;}
if (vsp >= 14) {vsp = 14;}

//Block collision - Y
if (instance_place(x,y+vsp,block) && vsp>0)
{
    blocklist = instance_place_list(x,y+vsp,block);

    blc=-1;
    repeat(ds_list_size(blocklist))
    {
    blc+=1;
    obj=ds_list_find_value(blocklist,blc);
    if (obj.issolid == 1 || obj.object_index == death) 
    {
        y=round(y);
        while (!place_meeting(x,y+sign(vsp),obj)) {y+=sign(vsp);}
        grounded=1; vsp=0;
        hsp = 0;
        break;
    }
    }
    ds_list_destroy(blocklist);
}
y+=vsp;


if (x+8 > view_x+view_w || x+8 < view_x || y+8 > view_y+view_h || y+8 < view_y)
    {if (flashloop > -2) {instance_destroy();} }

}

//fill my health!!!
if (collision_rectangle(x+4,y+8,x+12,y+16,megaman,true,true) && visible == 1)
{
    if (megaman.paused != 1)
    {
        if (global.myHealth < 28)
        {
            visible = 0;
            alarmfill = 1;
            audio_play_sound(sndGetEnergy,5,true)
            Freeze(true);
            canfreeze = true;
        }
        else {instance_destroy();}
    }
}

if (alarmfill > -1) 
{
    alarmfill -= 1;
    if (alarmfill == -1) 
    {
        alarmfill = 1;
        if (hlth > 0 && global.myHealth < 28)
        {
            global.myHealth+=1;
            hlth-=1;
        }
        else 
        {
            instance_destroy();
            audio_stop_sound(sndGetEnergy);
            Freeze(false);
            exit;
        }
    }
}

if (canfreeze == true) {Freeze(true);}