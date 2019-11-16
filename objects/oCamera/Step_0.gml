/// @description Space management.
// Movement:
if (mouse_check_button_pressed(mb_left) && position_empty(mouse_x, mouse_y))
{
	Anchor = true;
    xAnchor = mouse_x;	// x coord where the left button was pressed.
    yAnchor = mouse_y;	// y coord where the left button was pressed.
}

if (mouse_check_button(mb_left) && Anchor)
{
	if (abs(xAnchor - mouse_x) > 2) && (x + xAnchor - mouse_x - window_get_width()/2 >= 0) && (x + xAnchor - mouse_x + window_get_width()/2 <= room_width)
	// Avoids the twitch/stutter effect; avoids going outside the left side of the room; avoids going outside the right side of the room.
		x += (xAnchor - mouse_x);
    if (abs(yAnchor - mouse_y) > 2) && (y + yAnchor - mouse_y - window_get_height()/2 >= 0) && (y + yAnchor - mouse_y + window_get_height()/2 <= room_height)
	// Avoids the twitch/stutter effect; avoids going outside the top of the room; avoids going outside the bottom of the room.
		y += (yAnchor - mouse_y);
}
else Anchor = false;
// Thanks to YellowAfterlife.
// At least you tried, GM Wolf. (Why?) <- Investigate event_data.

// Zoom:
if (keyboard_check(vk_control) && (mouse_wheel_up() || keyboard_check_pressed(vk_add)))
	// if ctrl + *wheel up* or ctrl + "+" is pressed...
{
	if (global.zoom <= 16)
	{
		var dx = x - mouse_x;
		var dy = y - mouse_y;
		var _x = xGrid(mouse_x);
		var _y = yGrid(mouse_y);
		global.zoom *= 2;
		x = dx + xRoom(_x);
		y = dy + yRoom(_y);
		with (oParticle)
		{
			x = xRoom(xGrid(x)*2);
			y = yRoom(yGrid(y)*2);
		}
	}
}
else if (keyboard_check(vk_control) && (mouse_wheel_down() || keyboard_check_pressed(vk_subtract)))
	// if ctrl + *wheel down* or ctrl + "-" is pressed..
{
	if (global.zoom >= 1/16)
	{
		var dx = x - mouse_x;
		var dy = y - mouse_y;
		var _x = xGrid(mouse_x);
		var _y = yGrid(mouse_y);
		global.zoom /= 2;
		x = dx + xRoom(_x);
		y = dy + yRoom(_y);
		with (oParticle)
		{
			x = xRoom(xGrid(x)/2);
			y = yRoom(yGrid(y)/2);
		}
	}
}
	
/// OBSOLETE VERSION:
//{
//	if (width*zoom > screen_w/10) && (height*zoom > screen_h/10)	// Zoom in restrictions.
//	{
//		total_zoom *= zoom;
//		width *= zoom;
//		height *= zoom;
//		// Resize de camera (maybe some of these aren't needed?):
//		camera_set_view_size(view_camera[0], width, height);
//		camera_set_view_border(view_camera[0], width, height);
//		view_set_wport(0, width);
//		view_set_hport(0, height);
//	}
//}
//else if (keyboard_check(vk_control) && (mouse_wheel_down() || keyboard_check_pressed(vk_subtract))).
//{
//	if (width/zoom < room_width/5) && (height/zoom < room_height/5)	// Zoom out restrictions.
//	{
//		total_zoom /= zoom;
//		width /= zoom;
//		height /= zoom;
//		// Resize the camera (maybe some of these aren't needed?):
//		camera_set_view_size(view_camera[0], width, height);
//		camera_set_view_border(view_camera[0], width, height);
//		view_set_wport(0, width);
//		view_set_hport(0, height);
//	}
//}