
if(keyboard_check_pressed(vk_space) or gamepad_button_check_pressed(4, gp_face2))
{
	if(!ds_queue_empty(global.list_chat))
	{
		chat = ds_queue_head(global.list_chat);
		ds_queue_dequeue(global.list_chat);
	}
	else
	{
		sprite_delete(s_screen);
		instance_activate_all();
		instance_destroy();
	}
}
