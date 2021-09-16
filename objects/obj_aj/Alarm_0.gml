/// @description say gratitude
// You can write your code in this editor
audio_play_sound(snd_token, 0, false);
audio_play_sound(snd_hand_out, 0, false);
instance_create_layer(96, 105, "Hands", obj_ranch_hold);