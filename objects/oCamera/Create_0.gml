/// @description Positioning.
alarm[0] = 1;

// Dimensions of the screen:
screen_w = display_get_width();
screen_h = display_get_height();

// Dimensions of the window:
width = screen_w/1.5;
height = screen_h/1.5;

window_set_size(width, height);	// Resize window.
camera_set_view_size(view_camera[0], width, height);	// Resize camera.
view_set_wport(0, width);		// Resize camera port (needed).
view_set_hport(0, height);		// Resize camera port (needed).
surface_resize(application_surface, width, height);		// Resize game dimensions (needed).
camera_set_view_speed(view_camera[0], room_width, room_height);	// Change camera speed ("instant").
camera_set_view_border(view_camera[0], width, height);	// Change camera border ("always centered").

//zoom = 1/1.5;	// Proportion of the screen that is showed when you zoom (inverted?).
//total_zoom = 1;	// Total amount of zoom of the camera (default: 1). Used when drawing the lines.

Anchor = false;

global.zoom = 1;