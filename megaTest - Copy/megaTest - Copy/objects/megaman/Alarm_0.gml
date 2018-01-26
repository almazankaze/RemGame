//End sliding

//if game pauses, player freezes mid slide
if (paused) {alarm[0] = 1; exit;}

if (canslide == 2) {canslide = 1; exit;}

//if player gets to the edge of the floor, stops slide
if (collision_rectangle(x-7,y-16,x+7,y-28,block,true,true) && grounded == 0 && hurt == 0)
{
sliding = 0;
if (climbing == 0 && sprite_index != SPRITE_WALK && sprite_index != SPRITE_WALKSHOOT) sprite_index = SPRITE_STAND;
hsp = 0; x=floor(x);
}

//if player player hits a wall or not 
if (hurt == 0 && (!collision_rectangle(x-7,y-16,x+7,y-28,block,true,true) || collision_rectangle(x-7,y-16,x+7,y-28,block,true,true)))
{
if (collision_rectangle(x-7,y-16,x+7,y-28,block,true,true)) 
    {if (collision_rectangle(x-7,y-16,x+7,y-28,block,true,true).issolid == 1) {alarm[0] = 1; exit;} }

//sliding stops
sliding = 0; 
if (climbing == 0 && sprite_index != SPRITE_WALK && sprite_index != SPRITE_WALKSHOOT) sprite_index = SPRITE_STAND;
hsp = 0; x=floor(x);
mask_index = mskMega; 
canslide = 2; alarm[0] = 1;
}
else
{
alarm[0] = 1;
}