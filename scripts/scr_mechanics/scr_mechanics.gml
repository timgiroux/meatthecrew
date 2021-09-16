
// Tween image by -90 degrees
function orient_pz_piece(image) {
	
	// Ignore if image is mid-rotation
	if (!image.rotating) {
		
		// Update rotating flag
		image.rotating = true;
		tween = TweenFire(image, EaseInOutQuad, TWEEN_MODE_ONCE, false, 0, 22.5,
		                  "image_angle", image.image_angle, image.image_angle - 90);
		
		// Add callback to tween, preventing further tween attempts until completion
		// (this sets image.rotating back to false)
		TweenAddCallback(tween, TWEEN_EV_FINISH, image, orient_pz_piece_callback, image);	
	}
}
	// Helper function to update to check win conditions
	// and update rotating flag
	function orient_pz_piece_callback(image) {
	
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
  if (image_array == global.turkey_tim || image_array == global.tbone_joe) {
	  audio_play_sound(snd_grats, 0, false);
  }
  else {
	  audio_play_sound(snd_chicken_gratitude, 0, false);
  }
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
	
	// If the angle of any piece is not in original position, puzzle is not won
	for(var i = 1; i < array_length_1d(image_array); i++){
		var angle = image_array[i].object_index.image_angle;
		if (angle % 360 != 0) {
			return;
		}
	}
	
	// Escaped the for-loop, puzzle is complete
	// Spawn continue button
	instance_create_layer(96, 20, image_array[1].layer, obj_continue);
  
	// Change playing sounds
	sound_settings(image_array);
  
	// Replace the chopped up sprites with their full image counterpart
	replace_sprite(image_array);
	
	return;
}