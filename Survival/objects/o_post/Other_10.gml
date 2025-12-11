/// @description Interact

ds_queue_enqueue(global.list_chat, "Hola, usa la tecla ESPACIO para avanzar el diálogo")
ds_queue_enqueue(global.list_chat, "Hola Mundo!")
ds_queue_enqueue(global.list_chat, "Adiós Mundo!")

instance_create_layer(0, 0, "GUI", o_chat)