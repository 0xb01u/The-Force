/// @description Particle defaults.
with (oGrid) var _step = step;
// Position in grid:
xPos = -(room_width/2 - x)/_step;
yPos = (room_height/2 - y)/_step;

// Field/particle:
gPoint = false;
ePoint = false;

// Forces:
mass = 0;
charge = 0;

grav = 0;
grav_x = 0;
grav_y = 0;
elec = 0;
elec_x = 0;
elec_y = 0;
magnet = 0;
magnet_x = 0;
magnet_y = 0;

inertial_x = 0;
inertial_y = 0;
inertial = 0;

Force_x = 0;
Force_y = 0;
Force = 0;

// Movement:
movable = true;
acceleration_x = 0;
acceleration_y = 0;
velocity_x = 0;
velocity_y = 0;

// Color:
switch (global.color) {
    case 0:
        color = c_red;
		global.color++;
        break;
	case 1:
		color = c_orange;
		global.color++;
		break;
	case 2:
		color = c_yellow;
		global.color++;
		break;
	case 3:
		color = c_lime;
		global.color++;
		break;
	case 4:
		color = c_blue;
		global.color++;
		break;
	case 5:
		color = c_navy
		global.color++;
		break;
	case 6:
		color = c_purple;
		global.color = 0;
		break;
    default:
        color = white;
        
}
// Collision box:
with (oGrid) other.r = step/4;	// Radius (in function of the distance between lines).
image_xscale = (r*image_xscale + 5)/64;
image_yscale = image_xscale;

// Misc.
interactable = true;
menu_growing = true;
menu = false;
alarm[0] = 20;
dragging = false;
origin_x = x;
origin_y = y;

// Menu boxes (instances):
xBox = noone;
yBox = noone;
massBox = noone;
chargeBox = noone;
vxBox = noone;
vyBox = noone;
ifxBox = noone;
ifyBox = noone;
GfieldBox = noone;
EfieldBox = noone;

// Menu dimensions:
var growStep = 20;
menuWidth = 11*growStep;
menuHeight = 17.3*growStep;