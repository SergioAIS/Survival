/// @description Interact

ds_queue_enqueue(global.chat_list, "Hola, usa la tecla ESPACIO para avanzar el diálogo")
ds_queue_enqueue(global.chat_list, "Hola Mundo!")
ds_queue_enqueue(global.chat_list, "Adiós Mundo!")

instance_create_layer(0, 0, "GUI", o_chat)