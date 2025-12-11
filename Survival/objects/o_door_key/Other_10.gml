/// @description Interact

if(o_player.keys > 0)
{
	o_player.keys -= 1;
	scr_used();
	instance_destroy();
}
