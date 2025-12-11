draw_set_font(f_float_text)
draw_set_halign(fa_center)

draw_set_color(c_black)
draw_text(x +3, y + 3, value)

switch (type)
{
	case "att":
		draw_set_color(c_white)		
	break;
	
	case "dmg":
		draw_set_color(c_red)
	break;
	
	case "key":
		draw_set_color(c_yellow);
	break;
	
	case "cure":
		draw_set_color(c_lime);
	break;
}


draw_text(x, y, value)
