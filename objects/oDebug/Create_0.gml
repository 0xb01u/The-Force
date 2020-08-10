/// @description What to create init.
enum phi {
	particle,
	mField
};

drawing = phi.particle;
fielding = false;

colors[phi.particle] = c_white;
colors[phi.mField] = c_teal;
