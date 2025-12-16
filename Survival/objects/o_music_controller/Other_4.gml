switch (room)
{
	case  r_start:
		audio_stop_all()
		audio_play_sound(snd_pantalla_inicio, 1, 1)
	break;
	
	case Room2:
		audio_stop_all()
		if (global.is_day == false) audio_play_sound(snd_night_soundtrack,1,1)
		else audio_play_sound(snd_day,1,1)
	break;
}