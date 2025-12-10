if (active)
{
	if (keyboard_check(vk_space))
	{
		obj = instance_place(x, y, o_interactive)
		if (obj != noone)
		{
			with (obj)
			{
				event_perform(ev_other, ev_user0)
			}
			active = 0
			alarm[0] = cooldown
		}
	}
}