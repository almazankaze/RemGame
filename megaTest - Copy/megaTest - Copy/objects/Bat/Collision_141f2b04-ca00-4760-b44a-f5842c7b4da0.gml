if (froze == 0 && onscreen == 1 && canhit == 0 && other.ricochet == 0)
{
	
	//if sprite is not flying, bullet will bounce off
	if !(image_index > 2) {with (other) {event_user(0); exit; } }

	audio_stop_sound(sndEnemyHit); audio_play_sound(sndEnemyHit, 5, false); 
	audio_stop_sound(sndShoot1);

	if (flashing == 0)
	{
		flashing = 3;
		visible = 0;
		alarm[7] = 2;
		
		switch (other.object_index)
		{
			case proto_bullet1:		myhealth -= 1; break;
		}
	}
	
	//Destroy Bullet
	switch (other.object_index)
	{
		case proto_bullet1:
		
			with (other) instance_destroy(); break;
	}
}