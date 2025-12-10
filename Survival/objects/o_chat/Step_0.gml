if (keyboard_check_pressed(vk_space))
{
	if (!ds_queue_empty(global.chat_list))	
	{
		chat = ds_queue_head(global.chat_list)
		ds_queue_dequeue(global.chat_list)
	}
	else
	{
		sprite_delete(s_screen)
		instance_activate_all()
		instance_destroy()
	}
}