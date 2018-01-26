
//turns this object into a solid if player is above it
if (instance_exists(megaman))
{
    if (y+2 > megaman.y) {issolid = 1;}
    else {issolid = 0;}
}