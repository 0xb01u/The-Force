/// @description Text for the Checkboxes.
draw_self();

// Text:
draw_set_color(c_white);
draw_text_ext_transformed(x - (20 + 19.2*window_get_width()/20), y - 5,
"Gravitational force:      Electric force:    Decompose forces:       Sum of forces:       Inertial force:            Velocity:",
0, window_get_width(), 1, 1, 0);
draw_text_ext_transformed(x - (window_get_width() - 30), y + (window_get_height() - 100),
"Mass units:  kg * 10^\nCharge units: C * 10^",
30, window_get_width(), 1, 1, 0);
