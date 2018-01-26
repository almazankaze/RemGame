///Zoom window
if(keyboard_check_pressed(ord("Z")))
{
  zoom++;
  
  if(zoom>max_zoom)
    zoom=1;
  
  window_set_size(ideal_width*zoom,ideal_height*zoom);
  surface_resize(application_surface,ideal_width*zoom,ideal_height*zoom);
  alarm[0]=1;
}

//Follow Player
view_x = megaman.x - view_w/2;
//view_y = megaman.y - view_h/2;

view_x=clamp(view_x,0,room_width-view_w);
view_y=clamp(view_y,0,room_height-view_h);


//work in progress
//Stop at section borders
if (instance_exists(borderparent)) {
	
	//if player is close to the right border, camera stops
	//the 128 is there to have camera move ab bit more past the border
	if view_x > sectionRight.x - view_w + 128
		view_x = sectionRight.x - view_w;
}

/*
//Stop at section borders
if global.viewX > sectionRight - global.viewWidth
    global.viewX = sectionRight - global.viewWidth;
else if global.viewX < sectionLeft
    global.viewX = sectionLeft;
    
if global.viewY > sectionBottom - global.viewHeight
    global.viewY = sectionBottom - global.viewHeight
else if global.viewY < sectionTop
    global.viewY = sectionTop;
    
    
//Stop at room borders
if global.viewX > room_width - global.viewWidth
    global.viewX = room_width - global.viewWidth;
else if global.viewX < 0
    global.viewX = 0;
    
if global.viewY > room_height - global.viewHeight
    global.viewY = room_height - global.viewHeight;
else if global.viewY < 0
    global.viewY = 0;
