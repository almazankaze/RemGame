//Flashing
if (canfreeze == false)
{
if (flashloop > 0)
{
alarm[0] = 1;
flashloop -= 1;
if (visible == 0) //&& !camera.shift > 0)
{visible = 1; exit;}

if (visible == 1) {visible = 0; exit;}
}
else 
{
instance_destroy();
}
}