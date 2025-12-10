scr_change_weapon("axe")
	obj = instance_create_layer(x, y, "GUI", o_float_text)
	obj.type = "att"
	obj.value = "You got an Axe!"
instance_destroy()