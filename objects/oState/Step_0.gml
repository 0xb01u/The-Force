/// @description Position.
var offset = 20;

x = oCamera.x + window_get_width()/2 - offset;
y = oCamera.y - window_get_height()/2 + offset;

// Checkboxes position:
gravityOption.y = y;
electricOption.y = y;
decomposeOption.y = y;
sumOption.y = y;
inertialOption.y = y;
velocityOption.y = y;
var sector = window_get_width()/20;
gravityOption.x = x + offset - 17*sector;
electricOption.x = x + offset - 14*sector;
decomposeOption.x = x + offset - 11*sector;
sumOption.x = x + offset - 8*sector;
inertialOption.x = x + offset - 5*sector;
velocityOption.x = x + offset - 2*sector;

// Magnitude units position:
massUnits.x = x - (window_get_width() - 220);
electricUnits.x = massUnits.x;
massUnits.y = y + (window_get_height() - 100);
electricUnits.y = massUnits.y + 30;

// Checkboxes modifiers (global constants for option tweaking):
global.graviational = gravityOption.tick;
global.electric = electricOption.tick;
global.decompose = decomposeOption.tick;
global.resulting = sumOption.tick;
global.inertial = inertialOption.tick;
global.velocity = velocityOption.tick;

// Inboxes modifiers (global constants for option tweaking):
global.massUnits = num(massUnits.text);
global.elecUnits = num(electricUnits.text);