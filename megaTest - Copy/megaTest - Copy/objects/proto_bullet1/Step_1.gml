//when bullet is created

//if its hprizontal speed is 0
if (hsp == 0)
{
	
//if bullet is facing left, its speed will be -movesp
if (image_xscale == -1) {hsp = -movesp;}

//if bullet is facing right, its speed will be movesp
if (image_xscale == 1) {hsp = movesp;}
}