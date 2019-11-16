/// @description Grid window good version.
// Spawn:
x = room_width/2;
y = room_height/2;

// Grid defaults:
step = (window_get_width() - 40)/10;	// Difference between 2 consecutive lines of the grid in pixels.
offset_x = (step - room_width%step);	// Difference between the largest whole width of the grid and the room's width.
	// (This way because it is substracted.)
offset_y = (room_height%step);			// Difference between the largest whole height of the grid and the room's height.
	// (This way because it is added.)
round_x = window_get_width()%step/2;
	// = -(step*10 - window_get_width())/2 = -20
round_y = window_get_height()%step/2;
