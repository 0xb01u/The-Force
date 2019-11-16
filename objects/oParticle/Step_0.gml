/// @description Particle movement and interactions.

// Displacement:
if (interactable)
{
	// Menu and settings:
	if (menu_growing)
	{
		layer = layer_get_id("Particle_menu");	// Puts the particle higher so the menu covers other particles.
		// Menu destroying:
		if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_middle)) && (!point_in_rectangle(mouse_x, mouse_y, x, y, x + 220, y + 346) || point_in_circle(mouse_x, mouse_y, x, y, r))
		|| (mouse_check_button_pressed(mb_right)) && (!point_in_rectangle(mouse_x, mouse_y, x, y, x + 220, y + 346) && !point_in_circle(mouse_x, mouse_y, x, y, r))
		|| (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_escape)
		|| mouse_wheel_up() || mouse_wheel_down())
			// if you click out of the menu and the particle or press enter/esc...
			// (or use the mouse's wheel).
		{	
			menu_growing = false;
			alarm[0] = -1;	// Interrupts the menu growing animation.
			layer = layer_get_id("Particles");	// Puts the particle back in its layer.
			// Make the overlapped particles interactable again:			
			with (oParticle)
				if ((other.x - r < x) && (x < other.x + 220) && (other.y - r < y) && (y < other.y + 346))
					// if (among all the particles) the particle is under the menu...
					interactable = true;
		}
		// Make the overlapped particles not interactable (you can't move them/open their menu...):
		else with (oParticle)
			if ((other.x - r < x) && (x < other.x + 220) && (other.y - r < y) && (y < other.y + 346)) && !(menu_growing)
				// if (among all the particles) the particle is under the menu AND is not the one showing the menu...
				interactable = false;	
	}
	if (menu)
	{
		// Correct position (if zooming):
		xBox.x = x + 115;
		yBox.x = xBox.x;
		massBox.x = xBox.x;
		chargeBox.x = xBox.x;
		vxBox.x = xBox.x;
		vyBox.x = xBox.x;
		ifxBox.x = xBox.x;
		ifyBox.x = xBox.x;
		GfieldBox.x = x + 44;
		EfieldBox.x = x + 154
		var y_zoom = 20;
		xBox.y = y + 25;
		yBox.y = xBox.y + y_zoom;
		massBox.y = xBox.y + 3*y_zoom;
		chargeBox.y = xBox.y + 4*y_zoom;
		vxBox.y = xBox.y + 6*y_zoom;
		vyBox.y = xBox.y + 7*y_zoom;
		ifxBox.y = xBox.y + 10*y_zoom;
		ifyBox.y = xBox.y + 11*y_zoom;
		GfieldBox.y = xBox.y + 15*y_zoom;
		EfieldBox.y = xBox.y + 15*y_zoom;
		// Tab function:
		if (xBox.lastActive)
		{
			xBox.lastActive = false;
			yBox.active = true;
		}
		else if (yBox.lastActive)
		{
			yBox.lastActive = false;
			massBox.active = true;
		}
		else if (massBox.lastActive)
		{
			massBox.lastActive = false;
			chargeBox.active = true;
		}
		else if (chargeBox.lastActive)
		{
			chargeBox.lastActive = false;
			vxBox.active = true;
		}
		else if (vxBox.lastActive)
		{
			vxBox.lastActive = false;
			vyBox.active = true;
		}
		else if (vyBox.lastActive)
		{
			vyBox.lastActive = false;
			ifxBox.active = true;
		}
		else if (ifxBox.lastActive)
		{
			ifxBox.lastActive = false;
			ifyBox.active = true;
		}
		// Menu destroying:
		if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_middle)) && (!point_in_rectangle(mouse_x, mouse_y, x, y, x + 220, y + 346) || point_in_circle(mouse_x, mouse_y, x, y, r))
		|| (mouse_check_button_pressed(mb_right)) && (!point_in_rectangle(mouse_x, mouse_y, x, y, x + 220, y + 346) && !point_in_circle(mouse_x, mouse_y, x, y, r))
		|| (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_escape)
		|| mouse_wheel_up() || mouse_wheel_down())
			// if you click out of the menu and the particle or press enter/tab...
			// (or use the mouse's wheel).
		{
			menu = false;
			// Deletes all the boxes (if any):
			x = xRoom(num(xBox.text));
			y = yRoom(num(yBox.text));
			instance_destroy(xBox);
			instance_destroy(yBox);
			instance_destroy(massBox);
			instance_destroy(chargeBox);
			instance_destroy(vxBox);
			instance_destroy(vyBox);
			instance_destroy(ifxBox);
			instance_destroy(ifyBox);
			instance_destroy(GfieldBox);
			instance_destroy(EfieldBox);
			layer = layer_get_id("Particles");	// Puts the particle back in its layer.
			// Make the overlapped particles interactable again:
			with (oParticle)
				if ((other.x - r < x) && (x < other.x + 220) && (other.y - r < y) && (y < other.y + 346))
					// if (among all the particles) the particle is under the menu...
					interactable = true;
		}
		// Make the overlapped particles not interactable (you can't move them/open their menu...):
		else with (oParticle)
			if ((other.x - r < x) && (x < other.x + 220) && (other.y - r < y) && (y < other.y + 346)) && !(menu)
				// if (among all the particles) the particle is under the menu AND is not the one showing the menu...
				interactable = false;	
		// Reasignation of properties (based on the text shown):
		with (massBox) other.mass = num(text);
		with (chargeBox) other.charge = num(text);
		with (vxBox) other.velocity_x = num(text);
		with (vyBox) other.velocity_y = num(text);
		with (ifxBox) other.inertial_x = num(text);
		with (ifyBox) other.inertial_y = num(text);
		with (GfieldBox) other.gPoint = tick;
		with (EfieldBox) other.ePoint = tick;	
	}
	// Menu summon:
	if (mouse_check_button_pressed(mb_right) && position_meeting(mouse_x, mouse_y, self) && (!menu))
	{
		alarm[0] = 20;
		menu_growing = true
	}	
	// Displacement start/detection:
	if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, self))
	{		
		origin_x = x;
		origin_y = y; 
		dragging = true;
	}
	// Displacement's movement:
	if (mouse_check_button(mb_left) && dragging)
	{
		x = mouse_x;
		y = mouse_y;
	}
	// Displacement's final position.
	if (mouse_check_button_released(mb_left) && position_meeting(mouse_x, mouse_y, oParticle) && dragging)
	{
		with (oGrid)
		{
			var _step = step;
			var _offset_x = offset_x;	// For correct x position on the grid.
			var _offset_y = offset_y;	// For correct y position on the grid.
			var _round_x = round_x;		// For correct x rounding when released.
			var _round_y = round_y;		// For correcty rounding when released.
		}
		var xTo = round((mouse_x + _round_x)/_step)*_step - _offset_x/2;
		var yTo = round((mouse_y - _round_y)/_step)*_step + _offset_y/2;
		if (!(place_meeting(xTo, yTo, oParticle)))
		{
			x = xTo;
			y = yTo;
		}
		else
		// if the place is occupied, go back to the previous position.
		{
			x = origin_x;
			y = origin_y;
		}
		dragging = false;
	}
	// Particle eraser:
	if (mouse_check_button_pressed(mb_middle) && position_meeting(mouse_x, mouse_y, self))
		instance_destroy(self);
}
// Update position in grid:
with (oGrid) var _step = step;
xPos = -(room_width/2 - x)/(_step*global.zoom);
yPos = (room_height/2 - y)/(_step*global.zoom);

// Update mass and charge if this is a field point:
if (gPoint) 
{
	mass = 1;
	if (menu) massBox.text = "1";
}
if (ePoint)
{
	charge = 1;
	if (menu) chargeBox.text = "1";
}