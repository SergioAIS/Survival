dmg = 20

switch (o_player.ori)
{
	case 0:
	
	break;
	
	case 90:
		image_angle = 270
		image_xscale = -1
	break;
	
	case 180:
		image_xscale = -1
	break;
	
	case 270:
		image_angle = 90
		image_xscale = -1
	break;
}