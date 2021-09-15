// Helper function to prevent image angle going beyond -360 degrees and to check win conditions
function check_status(image) {
	
	// Update image angle if needed
	if(image.image_angle == -360) image.image_angle = 0;
	
	// Update rotating flag
	image.rotating = false;
	
	// Get the name of the layer that the image came from
	var layer_name = layer_get_name(image.layer);
	
	// Check the win status based on current room
	if (layer_name == "Turkey_Tim") {
		check_win(global.turkey_tim);
	}
	else if (layer_name == "TBone_Joe") {
		check_win(global.tbone_joe);	
	}
	else {
		check_win(global.aj_chickenwing);	
	}
}

// Tween image by -90 degrees
function orient(image) {
	
	// Check if image is mid-rotation
	if (image.rotating == false) {
		
		// Update rotating flag
		image.rotating = true;
		tween = TweenFire(image, EaseInOutQuad, TWEEN_MODE_ONCE, false, 0, 22.5, "image_angle", image.image_angle, image.image_angle - 90);
		
		// Add callback to tween, preventing further tween attempts until completion
		TweenAddCallback(tween, TWEEN_EV_FINISH, image, check_status, image);	
	}
}

// Randomize the initial orientation of the sprites in a given puzzle and initialize rotating Boolean
// Note: not possible for sprites to start in their correct orientation, no need
//       to catch
function initial_setup(image_array) {
	angles = [-90, -180, -270];
	randomize();
	for(var i = 1; i < array_length_1d(image_array); i++) {
		image_array[i].object_index.rotating = false;
		image_array[i].object_index.image_angle = angles[irandom(2)];
	}
}

// Stop all audio and play "win" audio based on current room
function sound_settings(image_array) {
  audio_stop_all();
  if (image_array == global.turkey_tim || image_array == global.tbone_joe) audio_play_sound(snd_grats, 0, false);
  else audio_play_sound(snd_chicken_gratitude, 0, false);
}

// Replace the chopped up images of sprites with the full image counterpart
function replace_sprite(image_array) {
	
	// pull layer id from existing image array
	var lyr_instance_id = image_array[1].layer;
	
	// delete all spinning instances from layer
	for(var i = 1; i < array_length_1d(image_array); i++) {
	  instance_deactivate_object(image_array[i].object_index);
	}
	
	// insert full image instance
	instance_create_layer(96, 96, lyr_instance_id, image_array[0]);
}

// Helper function to check if all images are at orientation 0 and update sounds/sprites if required
function check_win(image_array) {
	
	for(var i = 1; i < array_length_1d(image_array); i++){
		var angle = image_array[i].object_index.image_angle;
		// If the angle is not zero for any given image, puzzle is not won
		if (angle != 0) {
			return;
		}
	}
  
	// Change playing sounds
	sound_settings(image_array);  
  
	// Replace the chopped up sprites with their full image counterpart
	replace_sprite(image_array);
}