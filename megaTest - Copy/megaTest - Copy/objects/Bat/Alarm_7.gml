//Hit Flashing
if (flashing == 3) {visible = 1; alarm[7] = 1; flashing -= 1; exit;}
if (flashing == 2) {visible = 0; alarm[7] = 1; flashing -= 1; exit;}
if (flashing == 1 && visible == 0) {visible = 1; alarm[7] = 1; exit;}
if (flashing == 1) {flashing -= 1; exit;}