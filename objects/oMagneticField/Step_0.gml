/// @description Redimension and property changing.
if (creating)
{
	if (mouse_check_button_released(mb_right) || mouse_wheel_up() || mouse_wheel_down())
		creating = false;
	xVar = mouse_x;
	yVar = mouse_y;
}
