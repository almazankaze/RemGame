if (collision_rectangle(x,y,x+15,y+15,megaman,true,true) && issolid == 1)
{
with (megaman) {if (vsp < 0) {y = yprevious; vsp=0;} }
}

if (instance_exists(megaman))
{
if (megaman.flash == 1 && issolid == 0) issolid = 1;
if (megaman.flash == 0 && issolid == 1) issolid = 0;
}
else {issolid = 0;}