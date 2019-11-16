/// @description Rectangle drawing.
draw_set_color(c_silver);
draw_roundrect(xFix, yFix, xVar, yVar, false);
draw_set_color(c_gray);

// @TODO: change corner so it's always inside. Check dimensions(?)
if (in) draw_text(x, y, " +Z");
else draw_text(x, y, " -Z");