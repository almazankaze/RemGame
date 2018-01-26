alarm[3] = 90;
alarm[1] = 30

//throws weapon at player
if (instance_exists(megaman))
{
if (x > megaman.x && image_index == 1 && megaman.y-128 <= y && megaman.y > y-256)
{
    image_index = 2;
    instance_create_depth(x-21,y-18,0,Bone);
    //sound_play(sfx_enemyshoot);
}
if (x < megaman.x && image_index == 4 && megaman.y-128 <= y && megaman.y > y-256)
{
    image_index = 5;
   instance_create_depth(x+21,y-18,0,Bone);
   //sound_play(sfx_enemyshoot);
}
}