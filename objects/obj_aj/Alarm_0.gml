/// @description say gratitude
// this alarm sets after snd_chicken_gratitude,
//   to initiate the token of gratitude scene
audio_play_sound(snd_chicken_token, 0, false);
audio_play_sound(snd_chicken_hand_out, 0, false);
instance_create_layer(96, 105, "Hands", obj_ranch_hold);