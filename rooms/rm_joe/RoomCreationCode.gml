var lyr_tbone_joe = layer_get_id("TBone_Joe");

global.tbone_joe = array_create(5);

// Full TBone Joe object
global.tbone_joe[0] = obj_joe;

// Top left TBone Joe
global.tbone_joe[1] = instance_create_layer(64, 64, lyr_tbone_joe, obj_joe_tl);

// Top right TBone Joe
global.tbone_joe[2] = instance_create_layer(128, 64, lyr_tbone_joe, obj_joe_tr);

// Bottom left TBone Joe
global.tbone_joe[3] = instance_create_layer(64, 128, lyr_tbone_joe, obj_joe_bl);

// Bottom right TBone Joe
global.tbone_joe[4] = instance_create_layer(128, 128, lyr_tbone_joe, obj_joe_br);

initial_setup(global.tbone_joe);