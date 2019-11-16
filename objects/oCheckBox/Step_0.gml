/// @description CheckBox tasks:
var this = instance_nearest(x, y, oCheckBox);
// Tick/untick:
if (mouse_check_button_pressed(mb_left) && point_in_rectangle(mouse_x, mouse_y, x, y, x + 15, y + 15))
	tick = !tick;