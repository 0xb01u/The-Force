/// @description Menu boxes
menu = true;
menu_growing = false;
// Boxes creation:
var _x = x + 115;
var _y = y + 25;
var y_zoom = 20;
xBox = instance_create_layer(_x, _y, "Text", oInBox);
yBox = instance_create_layer(_x, _y + y_zoom, "Text", oInBox);
massBox = instance_create_layer(_x, _y + 3*y_zoom, "Text", oInBox);
chargeBox = instance_create_layer(_x, _y + 4*y_zoom, "Text", oInBox);;
vxBox = instance_create_layer(_x, _y + 6*y_zoom, "Text", oInBox);
vyBox = instance_create_layer(_x, _y + 7*y_zoom, "Text", oInBox);
ifxBox = instance_create_layer(_x, _y + 10*y_zoom, "Text", oInBox);
ifyBox = instance_create_layer(_x, _y + 11*y_zoom, "Text", oInBox);
GfieldBox = instance_create_layer(x + 44, _y + 15*y_zoom, "Text", oCheckBox);
EfieldBox = instance_create_layer(x + 154, _y + 15*y_zoom, "Text", oCheckBox);


// Boxes activation:
with (oGrid) var _step = step;
xBox.text = string(xPos);
yBox.text = string(yPos);
massBox.text = string(mass);
chargeBox.text = string(charge);
vxBox.text = string(velocity_x);
vyBox.text = string(velocity_y);
ifxBox.text = string(inertial_x);
ifyBox.text = string(inertial_y);
GfieldBox.tick = gPoint;
EfieldBox.tick = ePoint;

massBox.active = true;