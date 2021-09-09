// Script to check win conditions for current puzzle

// Rotates image by -90 degrees
// If image has made a full rotation, set orientation back to 0
function orient(image){
  image.image_angle -= 90;
  if (image.image_angle == -360) image.image_angle = 0;
}

// Randomize the initial orientation of the sprites in a given puzzle
// Note: not possible for sprites to start in their correct orientation, no need
//       to catch
function initial_setup(image_array){
	angles = [-90, -180, -270];
	randomize();
	for(var i = 1; i < array_length_1d(image_array); i++){
		image_array[i].object_index.image_angle = angles[irandom(2)];
	}
}

// Replace the chopped up images of sprites with the full image counterpart
function replace_sprite(image_array){
	// pull layer id from existing image array
	var lyr_instance_id = image_array[1].layer;
	
	// delete all spinning instances from layer
	for(var i = 1; i < array_length_1d(image_array); i++){
	  instance_deactivate_object(image_array[i].object_index);
	}
	
	// insert full image instance
	instance_create_layer(96, 96, lyr_instance_id, image_array[0]);
}

// Check if all images are at orientation 0, puzzle is solved
function check_win(image_array){
  for(var i = 1; i < array_length_1d(image_array); i++){
	  var angle = image_array[i].object_index.image_angle;
	  if (angle != 0) return;
  }
  
  // replace the chopped up sprites with their full image counterpart
  replace_sprite(image_array);
}