/// @description Square and tick.
image_xscale = 1/4;
image_yscale = image_xscale;
draw_set_color(make_color_rgb(44, 47, 51));
draw_rectangle(x, y, x + 12, y + 12, false);
draw_set_color(make_color_rgb(153, 170, 181));
draw_rectangle(x, y, x + 12, y + 12, true);
if (tick) draw_self();