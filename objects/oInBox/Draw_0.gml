/// @description Text showing.
draw_set_color(make_color_rgb(44, 47, 51));		// Discord blacker - inner rectangle.
draw_rectangle(x, y, x + 100, y + 19, false);
draw_set_color(make_color_rgb(153, 170, 181));	// Discord light - rectangle's border.
draw_rectangle(x, y, x + 100, y + 19, true);
var txt = string(text);
txt += line ? "|" : "";							// Cursor (active) indicator.	
draw_text_transformed(x + 3, y, txt, 1, 1, 0);