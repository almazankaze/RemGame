//Flashing
if (paused) {exit;}

//I am invincible!!!
if (flashloop > 0)
{
alarm[1] = 1;
flashloop -= 1;
if (visible == 0) {visible = 1; exit;}
if (visible == 1) {visible = 0; exit;}
}
else 
{
flashloop = 0;
flash = 0;
visible = 1;
//death.issolid = 0;
}