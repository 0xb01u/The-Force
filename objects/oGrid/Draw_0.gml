/// @description Grid drawing.
	//draw_self();	
// Important parts of the grid (for optimization):
var _zoom = global.zoom;
var left = camera_get_view_x(view_camera[0]);	// Leftest pixels that are seen.
var right = left + window_get_width();	// Rightest pixels that are seen.
var top = camera_get_view_y(view_camera[0]);	// Highest pixels that are seen.
var bottom = top + window_get_height();	// Lowest pixels that are seen.

// Ox and Oy axis:
draw_set_color(c_white);
draw_arrow(left, y, right, y, 10);
draw_arrow(x, bottom, x, top, 10);

// "Echo" axis:
draw_set_color(c_gray);
for (var i = step; i < room_width/2; i += step)
{
	var num = string(rInt(i/step)/global.zoom);
	if (x - i > left - 15*string_length("-" + num)) && (x - i < right)
		// if this x-negative y axis is within the game window (with some extra margin)...
	{
		draw_line(x - i, top, x - i, bottom);
		
		if (top < y) && (y < bottom - 20) draw_text_transformed(x - i, y, "-" + num, 1, 1, 0);
			// if the origin axis are shown, draw the numbers by their side.
		else if (top >= y) draw_text_transformed(x - i, top, "-" + num, 1, 1, 0);
			// if the origin axis is higher than the top of the window, draw the numbers on the top.
		else draw_text_transformed(x - i, bottom - 20, "-" + num, 1, 1, 0);
			// if the origin axis is lower than the bottom of the window, draw the numbers on the bottom.
	}
	if (x + i > left - 15*string_length(num)) && (x + i < right)
		// if this x-positive y axis is within the game window (with some extra margin)...
	{
		if (num == "1" && _zoom = 1) num = "i";
		draw_line(x + i, top, x + i, bottom);
		
		if (top < y) && (y < bottom - 20) draw_text_transformed(x + i, y, num, 1, 1, 0);
			// if the origin axis are shown, draw the numbers by their side.
		else if (top >= y) draw_text_transformed(x + i, top, num, 1, 1, 0);
			// if the origin axis is higher than the top of the window, draw the numbers on the top.
		else draw_text_transformed(x + i, bottom - 20, num, 1, 1, 0);
			// if the origin axis is lower than the bottom of the window, draw the numbers on the bottom.
	}
	if (y - i > top - 15) && (y - i < bottom)
		// if this y-positive x axis is within the game window (with some extra margin)...
	{
		if (num == "i" || num == "1") num = "j";
		draw_line(left, y - i, right, y - i);
		
		if ((left < x) && (x < right - 10 - 10*string_length(num))) draw_text_transformed(x + 4, y - i, num, 1, 1, 0);
			// if the origin axis are shown, draw the numbers by their side.
		else if (left >= x) draw_text_transformed(left, y - i, num, 1, 1, 0);
			// if the origin axis are lefter than the left of the window, draw the numbers on the left.
		else draw_text_transformed(right - 10 - 10*string_length(num), y - i, num, 1, 1, 0);
			// if the origin axis are righter than the right of the window, draw the numbers on the right.
	}
	if (y + i > top - 15*_zoom) && (y + i < bottom)
		// if this y-negative x axis is within the game window (with some extra margin)...
	{
		if ((num == "j") || (num == "i")) num = "1";
		draw_line(left, y + i, right, y + i);
		
		if ((left < x) && (x < right - 10 - 10*string_length("-" + num))) draw_text_transformed(x + 4 , y + i, "-" + num, 1, 1, 0);
			// if the origin axis are shown, draw the numbers by their side.
		else if (left >= x) draw_text_transformed(left, y + i, "-" + num, 1, 1, 0);
			// if the origin axis are lefter than the left of the window, draw the numbers on the left.
		else draw_text_transformed(right - 10 - 10*string_length("-" + num), y + i, "-" + num, 1, 1, 0);
			// if the origin axis are righter than the right of the window, draw the numbers on the right.
	}
	
}