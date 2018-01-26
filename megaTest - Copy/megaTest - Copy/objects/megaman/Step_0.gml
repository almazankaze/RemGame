if (paused) {exit;}

//Alarm - End shoot
if (alarmshoot > -1) 
{
    alarmshoot -= 1;
    if (alarmshoot == -1) {shooting = 0; canwalkshoot = true; alarmwalkshoot = -1;}
}

//Alarm - Release step if cannot walk and shoot
if (alarmwalkshoot > -1) 
{
    alarmwalkshoot -= 1;
    if (alarmwalkshoot == -1) 
    {
    if (pressing_left == 1) pressing_left = 0; 
    if (pressing_right == 1) pressing_right = 0; 
    canwalk = 0;
    }
}

//Alarm - Air bubble
if (alarmbubble > -1) 
{
    alarmbubble -= 1;
    if (alarmbubble == -1) 
    {
        alarmbubble = 9; 
        if (instance_number(airbubble)==0) 
        {
            if (image_xscale == -1) {instance_create_depth(x-4,y-18,0,airbubble);}
            if (image_xscale == 1) {instance_create_depth(x-2,y-18,0,airbubble);}
            with (airbubble) depth = 1;
        }
    }
}

//Set the input variables

//if player can move
if (canmove)
{
//if there was no input from player to change controls, controls are set to defult
if (global.input == 0)
{
	//keys are set to variables here
	//global keys are made in initial room creation code
	KEYHOLD_UP = keyboard_check(global.key_up);
	KEYHOLD_DOWN = keyboard_check(global.key_down);
	KEYHOLD_LEFT = keyboard_check(global.key_left);
	KEYHOLD_RIGHT = keyboard_check(global.key_right);
	KEYHOLD_A = keyboard_check(global.key_jump);
	KEYHOLD_B = keyboard_check(global.key_shoot);
	KEYHOLD_START = keyboard_check(global.key_start);
}
}

//makes me move all around
movementScript()

//makes me climb ladders
climbScript()

///shoot my gun///

//a switch is used to have multiple cases
switch (global.currentweapon)
{
	//uses the script shootNormal()
   case "normal": ShootNormal(); break;
}


//if player stops pressing shoot
if (!KEYHOLD_B && pressing_b != 0 && sliding == 0) 
{
	
//sets all shoot variables to false
pressing_b = 0;
chargeloop = 0; 
chargeimgloop = 0;
}

//handles my gravity or when I hit a block
gravityAndFloor()

//enemies and stuff
otherCollisions()

//changes my sprites
spriteChange()
