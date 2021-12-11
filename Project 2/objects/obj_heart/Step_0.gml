/// @description Insert description here
// You can write your code in this editor

if (tileX == obj_player.tileX && tileY == obj_player.tileY) {
	// Collision!
	if(lives < 6){
		lives = lives + 1;
	}
	audio_play_sound(sound_Collectible, 2, false);
	instance_destroy();
}