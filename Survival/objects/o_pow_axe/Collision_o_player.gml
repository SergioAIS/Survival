scr_change_weapon("axe")
o_player.pick_axe = 1;
	obj = instance_create_layer(x, y, "GUI", o_float_text)
	obj.type = "att"
	obj.value = "You got an Axe!"
scr_used();
instance_destroy()