/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_player)){
	if (tileX == obj_player.tileX && tileY == obj_player.tileY) {
		// Collision!
		show_debug_message(tileX);
		instance_destroy();
		global.ownedKeys += 1;
		
		room_goto_next();
	}
}