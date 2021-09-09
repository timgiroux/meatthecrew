var lyr_aj_chickenwing = layer_get_id("AJ_Chickenwing");

global.aj_chickenwing = array_create(10);

// Full AJ Chickenwing object
global.aj_chickenwing[0] = obj_aj;

// Top left AJ Chickenwing
global.aj_chickenwing[1] = instance_create_layer(32, 32, lyr_aj_chickenwing, obj_aj_tl);

// Top middle AJ Chickenwing
global.aj_chickenwing[2] = instance_create_layer(96, 32, lyr_aj_chickenwing, obj_aj_tm);

// Top right AJ Chickenwing
global.aj_chickenwing[3] = instance_create_layer(160, 32, lyr_aj_chickenwing, obj_aj_tr);

// Center left AJ Chickenwing
global.aj_chickenwing[4] = instance_create_layer(32, 96, lyr_aj_chickenwing, obj_aj_cl);

// Center middle AJ Chickenwing
global.aj_chickenwing[5] = instance_create_layer(96, 96, lyr_aj_chickenwing, obj_aj_cm);

// Center right Chickenwing
global.aj_chickenwing[6] = instance_create_layer(160, 96, lyr_aj_chickenwing, obj_aj_cr);

// Bottom left AJ Chickenwing
global.aj_chickenwing[7] = instance_create_layer(32, 160, lyr_aj_chickenwing, obj_aj_bl);

// Bottom middle AJ Chickenwing
global.aj_chickenwing[8] = instance_create_layer(96, 160, lyr_aj_chickenwing, obj_aj_bm);

// Bottom right AJ Chickenwing
global.aj_chickenwing[9] = instance_create_layer(160, 160, lyr_aj_chickenwing, obj_aj_br);

initial_setup(global.aj_chickenwing);