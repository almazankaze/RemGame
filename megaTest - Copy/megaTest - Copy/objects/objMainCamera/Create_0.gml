
//entire object is an example gotten from GMS2 Cameras - Making it work like GMS1 Views
//made by PixelatedPope on youtube

///Display Properties
ideal_width=256;
ideal_height=224;
zoom=2;
max_zoom=4;
display_width=display_get_width();
display_height=display_get_height();

aspect_ratio=display_width/display_height;
//ideal_width=round(ideal_height*aspect_ratio);
//ideal_height=round(ideal_width / aspect_ratio);

//Perfect Pixel Scaling
if(display_width mod ideal_width != 0)
{
  var d = round(display_width/ideal_width);
  ideal_width=display_width/d;
}
if(display_height mod ideal_height != 0)
{
  var d = round(display_height/ideal_height);
  ideal_height=display_height/d;
}

//Check for odd numbers
if(ideal_width & 1)
  ideal_width++;
if(ideal_height & 1)
  ideal_height++;
    
//Calculate Max Zoom
//max_zoom=floor(display_width/ideal_width)-1;  

window_set_size(ideal_width*zoom,ideal_height*zoom);
surface_resize(application_surface,ideal_width*zoom,ideal_height*zoom);
//display_set_gui_size(ideal_width,ideal_height);
  
alarm[0]=1;   //This will center the window after the initial resizing.

//these variables will count as global variables and will be scattered all over the game
//must take care not to lose them
camera = camera_create();
globalvar view_x,view_y,view_w,view_h;
view_x = 0;
view_y = 0;
view_w = ideal_width;
view_h = ideal_height;

//room_goto_next();
