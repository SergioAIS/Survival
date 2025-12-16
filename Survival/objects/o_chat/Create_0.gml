// 1. CAPTURAR SUPERFICIE (La pantalla actual)
// Usamos el ancho/alto real de la surface para no recortar nada
var _surf_w = surface_get_width(application_surface);
var _surf_h = surface_get_height(application_surface);

s_screen = sprite_create_from_surface(application_surface, 0, 0, _surf_w, _surf_h, false, false, 0, 0);

// 2. GUARDAR DATOS DE LA CÁMARA (Para saber dónde y de qué tamaño dibujar después)
camera_x = camera_get_view_x(view_camera[0]);
camera_y = camera_get_view_y(view_camera[0]);
camera_w = camera_get_view_width(view_camera[0]);  // <--- NUEVO: Ancho de la vista
camera_h = camera_get_view_height(view_camera[0]); // <--- NUEVO: Alto de la vista

// 3. DESACTIVAR EL JUEGO
instance_deactivate_all(true);

// 4. PREPARAR DIÁLOGO (Tu código original)
chat = ds_queue_head(global.list_chat);
ds_queue_dequeue(global.list_chat);