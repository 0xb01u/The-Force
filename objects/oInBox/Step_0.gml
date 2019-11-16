/// @description InBox tasks.
if !(active) line = false;
// Activation:
if (mouse_check_button_pressed(mb_left)) && (point_in_rectangle(mouse_x, mouse_y, x, y, x + 100, y + 19))
	// If you click on the rectangle...
{
	active = true;
	line = true;	// The cursor-line pops up instantly, indicating this Box is active.

}
else if (mouse_check_button_pressed(mb_any))
	// If you click outside the rectangle/with any other button...
	{
		active = false;
		line = false;
	}
//if (active) && !(lastActive) lastActive = true;
// Characters recognition:
if (active) && (keyboard_check_pressed(vk_anykey))
{
	var key = keyboard_lastkey;
	if ((key >= 48) && (key <= 57))			// Numbers (regular keyboard).
	{
		if (text == "0") text = chr(key);	// A single 0 is treated as an empty string (saves time).
		else text += chr(key);
	}
	else if ((key >= 96) && (key <= 105))	// Numbers (numeric keyboard);
	{
		if (text == "0") text = chr(key - 48);	// A single 0 is treated as an empty string (saves time).
		else text += chr(key - 48);
	}
	else if ((key == 109) || (key == 189)) && ((text == "") || (text == "0")) text = "-";	// Negative (only as first "digit").
	else if ((key == 110) || (key == 190)) && (string_pos(".", text) == 0) text += ".";		// Decimals (only once).
	else if (key == vk_enter) || (key == vk_escape) active = false;		// Box exit.
	else if (key == vk_tab)		// Box jump.
	{
		lastActive = true;
		active = false;
	}
	else if (key == vk_backspace)		// Eraser.
	{
		text = string_delete(text, string_length(text), 1);
		bullet_bs_ready = true;
		alarm[1] = 30;
	}
}
// Bullet eraser deactivation:
if (keyboard_check_released(vk_backspace)) bullet_bs_ready = false;
// Bullet eraser:
if (bullet_bs)
{
	if keyboard_check(vk_backspace) text = string_delete(text, string_length(text), 1);
	else bullet_bs = false;		// Bullet eraser deactivation (2.0).
}
if (text = "" && !active) text = string(defaultValue);