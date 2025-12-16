// Alarm 0 (Ciclo)
if (state == 0) {
    state = 1; // Avisar (vibrar o cambiar color)
    alarm[0] = 30; 
} else if (state == 1) {
    state = 2; // ARRIBA (Daña)
    image_index = 1; 
    alarm[0] = 60; // Se queda arriba 1 seg
} else {
    state = 0; // ABAJO (Seguro)
    image_index = 0;
    alarm[0] = 120; // Se queda abajo 2 segs
}