/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_pressed(vk_enter)) {
	
	cutsceneLine += 1;

	if (cutsceneLine >= array_length(cutsceneLines)) {
		obj_player.inCutscene = false;
		instance_destroy();
	}

}
