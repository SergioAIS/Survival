if (target == global.previous_room)
{
	o_player.x = x + sprite_width/2
	o_player.y = y + sprite_height/2
	
	switch (ori)
	{
		case 0:
			o_player.x += 96
			
		break;
		
		case 90:
			o_player.y -= 96
		break;
		
		case 180:
			o_player.x -= 96
		break;
		
		case 270:
			o_player.y += 96
		break;
	}
}