/// @description Insert description here
// You can write your code in this editor

if (tileX == obj_player.tileX && tileY == obj_player.tileY) {
	// Collision!
	instance_destroy();
	if(lives < 6){
		lives = lives + 1;
	}
}