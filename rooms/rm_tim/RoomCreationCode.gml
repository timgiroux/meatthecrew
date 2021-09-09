var lyr_turkey_tim = layer_get_id("Turkey_Tim");

global.turkey_tim = array_create(5);

// Full Turkey Tim object
global.turkey_tim[0] = obj_tim;

// Top left Turkey Tim
global.turkey_tim[1] = instance_create_layer(64, 64, lyr_turkey_tim, obj_tim_tl);

// Top right Turkey Tim
global.turkey_tim[2] = instance_create_layer(128, 64, lyr_turkey_tim, obj_tim_tr);

// Bottom left Turkey Tim
global.turkey_tim[3] = instance_create_layer(64, 128, lyr_turkey_tim, obj_tim_bl);

// Bottom right Turkey Tim
global.turkey_tim[4] = instance_create_layer(128, 128, lyr_turkey_tim, obj_tim_br);

initial_setup(global.turkey_tim);

