var left = camera_get_view_x(view_camera[0]);
var top = camera_get_view_y(view_camera[0]);

draw_set_color(c_white);
if (position_meeting(mouse_x, mouse_y, oParticle)) draw_set_color(c_lime);
draw_set_color(colors[drawing]);
if (mouse_check_button(mb_left)) draw_set_color(c_red);
draw_text(mouse_x, mouse_y - 15, string(xGrid(mouse_x)) + " " + string(yGrid(mouse_y)));
//with (instance_nearest(mouse_x, mouse_y, oParticle)) draw_text(mouse_x, mouse_y, string(mouse_x) + " " + string(mouse_y) + "\n" + string(layer));
