//Collision - Enemy
if (collision_rectangle(x-7,y-2,x+7,bbox_top,enemyparent,true,true) && flash == 0)
{
    enemylist = collision_rectangle_list(x-7,y-2,x+7,bbox_top,enemyparent,true,true);

    elc=-1;
    repeat(ds_list_size(enemylist))
    {
    elc+=1;
    ENEMY=ds_list_find_value(enemylist,elc);
    
    if (ENEMY.paused == 0 && ENEMY.froze == 0 && ENEMY.canhit == 0)
    {
    x=floor(x);
    flash = 1;
    hurt = 1;
    climbing = 0;
    canwalkshoot = true; alarmwalkshoot = -1;
    image_index = 0;
    image_speed = 0.95;
    if !(sliding == 0 && alarm[0] > 0) mask_index = mskMega;
    global.myHealth -= ENEMY.mypower;
    if (global.myHealth > 0)
    {
        sprite_index = SPRITE_HURT;
        //instance_create(x,y-23,proto_hitspark);
        audio_play_sound(sndHit, 5, false);
    }
    if (grounded == 0 && vsp < -1) {vsp = -1;}
    canwalk = 0;
    if (image_xscale == -1) {hsp=1;}
    if (image_xscale == 1) {hsp=-1;}
    
    //death.issolid = 1;
    charge = 0;
    chargeloop = 0;
    chargeimgloop = 0;
    //sound_stop(sfx_charging1); sound_stop(sfx_charging2);
    
    //if (ENEMY.object_index == napalmman_bullet1 || ENEMY.object_index == napalmman_bullet2) {with (ENEMY) event_user(1); }
    //break;
    }
    }
}


//Collision - Water
WTR_T = collision_rectangle(x-7,y-14,x+7,y-28,water,true,true);
WTR_F = collision_rectangle(x-7,y+14,x+7,y-12,water,true,true);

if (WTR_T && inwater == 0) 
{
    inwater = 1; 
    jumpsp = jsp2;
    grav = grv2;
    alarmbubble = 9;
    with (splash) {instance_destroy();} 
    instance_create_depth(x,WTR_T.y,0,splash);
}
if (!WTR_T && WTR_F && inwater == 1) 
{
    inwater = 0; 
    jumpsp = jsp1;
    grav = grv1;
    alarmbubble = -1;
    with (splash) {instance_destroy();} 
    instance_create_depth(x,WTR_F.y,0,splash);
}

//Collision - Death
SPIKE = collision_rectangle(x-7,y-2,x+7,bbox_top,death,true,true);

if (SPIKE) {if (flash == 0) {global.myHealth = 0;} }

if (global.myHealth <= 0) 
{
    global.myHealth = 0;
    global.myLives -= 1;
    audio_stop_sound(sndDeath); audio_play_sound(sndDeath,5,false);
    stop_music();
    charge = 0; chargeloop = 0; chargeimgloop = 0;
    //sound_stop(sfx_charging1); sound_stop(sfx_charging2);
    if !(y-28 > view_yview+view_hview)
    {
    dexpcount = 0;
    repeat(8) {
        dexpcount+=45;
        dexp = instance_create_depth(x,y,0,mega_explosion); 
        with (dexp) {motion_set(megaman.dexpcount,1.4); }
    }
    dexpcount = 0;
    repeat(8) {
        dexpcount+=45;
        dexp = instance_create_depth(x,y,0,mega_explosion); 
        with (dexp) {motion_set(megaman.dexpcount,2.8); }
    }
    }
    paused = 1; visible = 0;
    //objMegaEnergy.alarm[0] = room_speed*5;
}

//Holes
if (collision_rectangle(x-7,y-2,x+7,y-28,holedoor,true,true)) {holeshift = 1;}
else {holeshift = 0;}
if (y-28 > view_yview+view_hview && holeshift == 0) {global.myHealth = 0;}