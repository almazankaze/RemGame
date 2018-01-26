//Sprite Changes
if (hurt == 0)
{
if (grounded == 1)
{
    if (hsp == 0 && sliding == 0 && canwalk == 0) 
    {
        if (shooting == 0) {sprite_index = SPRITE_STAND;}
        if (shooting == 1) {sprite_index = SPRITE_STANDSHOOT;}
        image_speed = 0; 
        if (steploop == -1 && blinkloop == -1) {
            image_index=0; blinkloop = 46; 
        } 
    }
    else if (hsp == 0 && canwalk == 1 && image_index != 0 && (sprite_index == SPRITE_STAND || sprite_index == SPRITE_STANDSHOOT))
    {
        image_speed = 0; 
        if (steploop == -1 && blinkloop == -1) 
        {
            image_index=0; blinkloop = 46; 
        }
    }
    else 
    {
        image_speed = 0.3;
        if (sliding == 1) {sprite_index = SPRITE_SLIDE;}
        else 
        {
            if (shooting == 0) {sprite_index = SPRITE_WALK;}
            if (shooting == 1) {sprite_index = SPRITE_WALKSHOOT;}
        }
    }
}
else
{
    if (climbing != 0) 
    {
        if (shooting == 0) 
        {
        if (climbing == 1) {sprite_index = SPRITE_CLIMB;}
        if (climbing == 2) {sprite_index = SPRITE_BEND;}
        }
        if (shooting == 1) {sprite_index = SPRITE_CLIMBSHOOT;}
    }
    else
    {
        if (shooting == 0) {sprite_index = SPRITE_JUMP;}
        if (shooting == 1) {sprite_index = SPRITE_JUMPSHOOT;}
        image_speed = 0;
    }
}
}

//Blink
if (sprite_index == SPRITE_STAND && image_index != 2)
{
    if (blinkloop > 0) {blinkloop -= 1;}
    
    if (blinkloop == 0 && image_index == 0) {blinkloop = 4; image_index = 1;}
    if (blinkloop == 0 && image_index == 1) {blinkloop = 46; image_index = 0;}
}
else {blinkloop = -1;}
