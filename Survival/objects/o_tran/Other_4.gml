if (target == global.previous_room)
{
	o_players.x = x + sprite_width/2
	o_players.y = y + sprite_height/2
	
	switch (ori)
	{
		case 0:
			o_players.x += 150
			
		break;
		
		case 90:
			o_players.y -= 150
		break;
		
		case 180:
			o_players.x -= 150
		break;
		
		case 270:
			o_players.y += 150
		break;
	}
}