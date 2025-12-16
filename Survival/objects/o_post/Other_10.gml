/// @description Interact
if (text1 != "")
{
	ds_queue_enqueue(global.list_chat, text1)
}
if (text2 != "")
{
	ds_queue_enqueue(global.list_chat, text2)
}
if (text3 != "")
{
	ds_queue_enqueue(global.list_chat, text3)
}

instance_create_layer(0, 0, "GUI", o_chat)