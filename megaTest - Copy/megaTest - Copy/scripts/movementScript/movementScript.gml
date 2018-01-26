///time to jump!///

//any time player presses jump, sets if player currently is pressing jump to 
//true and player is not currently climbing a ladder.
if (KEYHOLD_A && pressing_a == 0 && climbing != 0 && !KEYHOLD_UP && !KEYHOLD_DOWN) 
{
	climbing = 0; 
	pressing_a = 1;
}

//same as above except checks to see if player is also on the ground.
if (KEYHOLD_A && pressing_a == 0 && !KEYHOLD_DOWN && grounded == 1 && hurt == 0 && climbing == 0) 
{
	//if on the ground, sets if player currently is pressing jump to true
    pressing_a = 1;
	
	//if player was sliding, stops the slide and jumps
	//see alarm[0] of object to see how it stops the slide
    if (sliding != 0) 
	{
		alarm[0]=0; 
		event_perform(ev_alarm,0);
	}
	
	//if not sliding, player jumps and grounded is set to false
    if (sliding == 0) 
	{
		vsp=jumpsp; 
		grounded = 0;
	}
}

//if player stops pressing jump while in the air, player will start coming down and
//pressing jump is set to false
if (!KEYHOLD_A && pressing_a == 1 && grounded == 0 && vsp < -1 && climbing == 0) 
{
	vsp = -1; 
	pressing_a = 0;
}

//any time player stops pressing jump, pressing jump is set to false
if (!KEYHOLD_A && pressing_a == 1) 
{
	pressing_a = 0;
}

///makes me slide///

//if player presses jump and player pressing jump is false and slide is false and hurt is false
if (KEYHOLD_A && pressing_a == 0 && sliding == 0 && hurt == 0)
{
	//player pressing currrently pressing jump is set to true
    pressing_a = 1;
	
	//if player presses down and is on the ground and can slide is set to true
    if (KEYHOLD_DOWN && grounded == 1 && canslide == 1)
    {
		
		//here player will slide if everything above checks out
		
		//returns the given number rounded down to the nearest integer
		//makes sure the value for x is always a whole number
        x=floor(x);
		
		//sets values to variables
        sliding = 1;
        canslide = 0;
        shooting = 0; alarmshoot = -1;
        canwalkshoot = true; alarmwalkshoot = -1;
        image_speed = 0.3;
		
		//player slides while checking for a wall in front of it. Also creates a puff of smoke behind the player
		//collision_line Checks whether any instances of a given object collide with a given line, and if 
		//there is it returns the id of one of those instances.
		
		//if facing left
        if (image_xscale == -1) 
		{
			hsp = -slidesp; 
			
			if (!collision_line(x-15,y-4,x+15,y-4,block,true,true)) 
			{
				instance_create_depth(x+0,y,0,slidedust);
			} 
		}
		
		//if facing right
        if (image_xscale == 1)
		{
			hsp = slidesp; 
			
			if (!collision_line(x-15,y-4,x+15,y-4,block,true,true)) 
			{
				instance_create_depth(x-8,y,0,slidedust);
			} 
		}
		
		//changes the mask of the player to the first sliding one to go through small spaces
        if (!collision_line(x-14,y-4,x+14,y-4,block,true,true)) 
		{
			mask_index = sprMegaSlideMask;
		}
		
		//else if player is just sliding and not going through a small space, second slide mask is used
        else if (collision_line(x-14,y-4,x+0,y-4,block,true,true) || collision_line(x-0,y-4,x+14,y-4,block,true,true)) {
            
			mask_index = sprMegaSlideMask2; 
			
			//if facing left 
            if (image_xscale == -1 && !collision_line(x-15,y-4,x+0,y-4,block,true,true)) 
			{
				instance_create_depth(x+0,y,0,slidedust); 
			}
			
			//if facing right
            if (image_xscale == 1 && !collision_line(x-0,y-4,x+15,y-4,block,true,true)) 
			{
				instance_create_depth(x-8,y,0,slidedust); 
			}
        }
		
		//ctivates the alarm of the object to stop the slide
        alarm[0] = 13;
    }
}

//in case player is spamming slide and goes into a small space. Changes the slide mask
//from the second one to the first
if (mask_index == sprMegaSlideMask2 && !collision_line(x-14,y-4,x+14,y-4,block,true,true)) 
{
	mask_index = sprMegaSlideMask;
}

///movement///


///pixel step///

//if player presses key to go left(starts pixel step)
if (KEYHOLD_LEFT && pressing_left == 0 && canwalk == 0 && hurt == 0) 
{
	//player is pressing left key is set to true
    pressing_left = 1;
	
	//if player is currently sliding
    if (sliding == 1) 
    {
		
		//sets the speed of the slide so the player does not go any faster
		//also goes through the slide code like above
        if (hsp == 0 || hsp > 0) 
        {
			
            if (!collision_rectangle(x-7,y-16,x+7,y-28,block,true,true)) 
			{
				alarm[0]=0; 
				event_perform(ev_alarm,0); 
				image_xscale = -1;
			}
			
            else {
				alarm[0]=1; 
				hsp = -slidesp; 
				image_xscale = -1;
				}
        } 
    }
	
	//if player is on the ground
    if (grounded == 1)
    {
		
		//changes the sprite to face left and picks the pixel step sprite
        image_xscale = -1; 
        image_index = 2; 
		
		//player steps forward one pixel while checking to see if there is a wall
        if (!instance_place(x-1,y,block) && sliding == 0) {x-=1;}
		
		//if there is a wall
        else if (instance_place(x-1,y,block) && sliding == 0) 
		{
			//if wall is not a solid, player will pixel step
			if ((instance_place(x-1,y,block)).issolid == 0) {x-=1;} 
		}
		
        steploop=2;
    }
	
	//if not sliding or starting to pixel step, player will now be able to walk normally
    else {canwalk = 1;}
}

//if player presses key to go right(starts pixel step)
if (KEYHOLD_RIGHT && pressing_right == 0 && canwalk == 0 && hurt == 0) 
{
	//player is pressing right key is set to true
    pressing_right = 1;
	
	//if player is currently sliding
    if (sliding == 1) 
    {
		//sets the speed of the slide so the player does not go any faster
		//also goes through the slide code like above
        if (hsp == 0 || hsp < 0) 
        {
            if (!collision_rectangle(x-7,y-16,x+7,y-28,block,true,true)) 
			{
				alarm[0]=0; 
				event_perform(ev_alarm,0); 
				image_xscale = 1;
			}
            else {
				alarm[0]=1; 
				hsp = slidesp; 
				image_xscale = 1;
				}
        } 
    }
	
	//if player is on the ground
    if (grounded == 1)
    {
		//changes the sprite to face right and picks the pixel step sprite
        image_xscale = 1; 
        image_index = 2; 
		
		//player steps forward one pixel while checking to see if there is a wall
        if (!instance_place(x+1,y,block) && sliding == 0) {x+=1;}
		
		//if there is a wall
        else if (instance_place(x+1,y,block) && sliding == 0) 
		{
			//if wall is not a solid, player will pixel step
			if ((instance_place(x+1,y,block)).issolid == 0) {x+=1;} 
		}
		
        steploop=2;
    }
	
	//if not sliding or starting to pixel step, player will now be able to walk normally
    else {canwalk = 1;}
}

//Walk

//lets the player walk to the left

//if not climbing
if (climbing == 0)
{

//if pressing left and not hurt
if (KEYHOLD_LEFT && hurt == 0) 
{
	//i dont know
    if (canwalkshoot == false && grounded) {if (alarmwalkshoot == -1) alarmwalkshoot = 2;}
    else
    {
    pressing_left = 1;
	
	//if currently sliding
    if (sliding == 1 && !KEYHOLD_RIGHT) 
    {
		//sliding code is done here again like above
        if (hsp == 0 || hsp > 0) 
        {
            if (!collision_rectangle(x-7,y-16,x+7,y-28,block,true,true)) 
			{
				alarm[0]=0; 
				event_perform(ev_alarm,0); 
				image_xscale = -1;
			}
            else {
				alarm[0]=1; 
				hsp = -slidesp; 
				image_xscale = -1;
				}
        } 
    }
	//if not sliding, and player has pixel stepped, player begins to walk left
    if (canwalk == 1 && sliding == 0) 
	{
		//makes you go left 
		if (mask_index != sprMegaSlideMask) {hsp = -walksp;} 
		
		image_xscale = -1;
	}
	
	//starts a pixel step "cooldown"
    else if (steploop > 0) {steploop -= 1;}
	
	//same
    else if (steploop == 0 || steploop == -1) {canwalk = 1; steploop = -1;}
    }
} 

//lets the player walk to the right

//if pressing right and not hurt
if (KEYHOLD_RIGHT && hurt == 0) 
{
	//i dont know
    if (canwalkshoot == false && grounded) {if (alarmwalkshoot == -1) alarmwalkshoot = 2;}
    else 
    {
    pressing_right = 1;
	
	//if currently sliding
    if (sliding == 1) 
    {
        if (hsp == 0 || hsp < 0) 
        {
            if (!collision_rectangle(x-7,y-16,x+7,y-28,block,true,true)) 
			{
				alarm[0]=0; 
				event_perform(ev_alarm,0); 
				image_xscale = 1;
			}
            else {
				alarm[0]=1; 
				hsp = slidesp; 
				image_xscale = 1;
				}
        } 
    }
	//if not sliding, and player has pixel stepped, player begins to walk right
    if (canwalk == 1 && sliding == 0) 
	{
		if (mask_index != sprMegaSlideMask) {hsp = walksp;} 
		
		image_xscale = 1;
	}
	
	//starts a pixel step "cooldown"
    else if (steploop > 0) {steploop -= 1;}
	
	//same
    else if (steploop == 0 || steploop == -1) {canwalk = 1; steploop = -1;}
    }
} 
}


//Key Release

//if player stops pressing the key to go right, it resets some variables 
if (!KEYHOLD_RIGHT && pressing_right == 1 && !KEYHOLD_LEFT && hurt == 0 && climbing == 0) 
{
	pressing_right = 0; 
	canwalk = 0; 
	steploop = -1; 
	
	if (sliding == 0) 
	{
		hsp = 0; 
		x=floor(x); 
		image_speed = 0; 
		image_index = 0; 
		sprite_index = SPRITE_STAND;
	} 
}

//if player stops pressing the key to go left, it resets some variables 
if (!KEYHOLD_LEFT && pressing_left == 1 && !KEYHOLD_RIGHT && hurt == 0 && climbing == 0) 
{
	pressing_left = 0; 
	canwalk = 0; 
	steploop = -1; 
	
	if (sliding == 0) 
	{
		hsp = 0; 
		x=floor(x); 
		image_speed = 0; 
		image_index = 0; 
		sprite_index = SPRITE_STAND;
	} 
}

//any time the player is not pressing the left or right key, it sets some variables to default
if (!KEYHOLD_RIGHT || !KEYHOLD_LEFT) {if (climbing != 0 && !KEYHOLD_RIGHT && !KEYHOLD_LEFT) 
    {canwalk = 0; pressing_right = 0; pressing_left = 0;} }

//if player stops pressing up
if (!KEYHOLD_UP && pressing_up == 1 && !KEYHOLD_DOWN && climbing != 0) 
{
	pressing_up = 0; 
	vsp = 0; 
	y=floor(y); 
	image_speed = 0; 
}

//if player stops pressing down
if (!KEYHOLD_DOWN && pressing_down == 1 && !KEYHOLD_UP && climbing != 0) 
{
	pressing_down = 0; 
	vsp = 0; 
	y=floor(y); 
	image_speed = 0; 
}