/// @description Insert description here
// You can write your code in this editor
show_debug_message(tileX);
if (tileX == obj_player.tileX && tileY == obj_player.tileY) {
	// Collision!
	show_debug_message(tileX);
	instance_destroy();
}