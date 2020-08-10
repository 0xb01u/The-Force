/// @description Redimension and property changing.
if (creating)
{
	if (mouse_check_button_released(mb_right) || mouse_wheel_up() || mouse_wheel_down())
		creating = false;
	xVar = mouse_x;
	yVar = mouse_y;
}
else
{
	// Placeholder: destroy by clicking on them.
	if (mouse_check_button(mb_any) && point_in_rectangle(mouse_x, mouse_y, min(xFix, xVar), min(yFix, xVar), max(xFix, xVar), max(xFix, yVar)))
	{
		instance_destroy(self);
	}
}
