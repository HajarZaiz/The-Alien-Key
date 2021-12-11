/// @description Insert description here
// You can write your code in this editor

if (tileX == obj_player.tileX && tileY == obj_player.tileY) {
	// Collision!
	audio_play_sound(sound_Collectible, 2, false);
	pickUpItem(InventoryItem.LavaShoe);
}