/// @description Debug features.
camera_width = view_get_wport(0);
camera_height = view_get_hport(0);

// Object spawning
with (oGrid)
{
	
	var _step = step;
	var r_x = round_x;
	var r_y = round_y;
	var off_x = offset_x;
	var off_y = offset_y;
}
var particleNearby = collision_rectangle(mouse_x + _step/2.2, mouse_y + _step/2.2, mouse_x - _step/2.2, mouse_y - _step/2.2, oParticle, true, false) != noone;
var menuNearby = false;
with (oParticle)
{
	if (collision_rectangle(mouse_x - 11*20, mouse_y - 17.3*20, mouse_x, mouse_y, self, false, false) != noone)
		menuNearby |= self.menu || self.menu_growing;
}
// Creation of objects:
if (mouse_check_button_released(mb_right))
{
	switch (drawing)
	{
		case phi.particle:
			instance_create_layer(round((mouse_x + r_x)/_step)*_step - off_x/2, round((mouse_y - r_y)/_step)*_step + off_y/2, "Particles", oParticle);
																	// Nearest x-integer and nearest y-integer of the grid.
			break;
		case phi.mField:
			if (!fielding)
			{
				instance_create_layer(mouse_x, mouse_y, "Fields", oMagneticField);
				fielding = true;
			}
			else fielding = false;
			break;
	}
}
if (mouse_wheel_up()) drawing = (drawing + 1) % 2;
if (mouse_wheel_down()) drawing = ((drawing - 1) + 2) % 2;