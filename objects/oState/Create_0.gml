/// @description Options defaults.
// Forces' checkboxes:
gravityOption = instance_create_layer(x, y, "Particles", oCheckBox);
electricOption = instance_create_layer(x, y, "Particles", oCheckBox);
decomposeOption = instance_create_layer(x, y, "Particles", oCheckBox);
sumOption = instance_create_layer(x, y, "Particles", oCheckBox);
inertialOption = instance_create_layer(x, y, "Particles", oCheckBox);
velocityOption = instance_create_layer(x, y, "Particles", oCheckBox);

gravityOption.tick = true;
electricOption.tick = true;
decomposeOption.tick = true;
sumOption.tick = true;
inertialOption.tick = true;
velocityOption.tick = true;

// Magnitude units:
massUnits = instance_create_layer(x, y, "Particles", oInBox);
electricUnits = instance_create_layer(x, y, "Particles", oInBox);
massUnits.text = string(0);
massUnits.defaultValue = 0;
electricUnits.text = string(0);
electricUnits.defaultValue = 0;