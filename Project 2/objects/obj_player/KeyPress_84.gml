/// @description Insert description here
// You can write your code in this editor

// Direction Facing to place spikes - previousDirection

if (moveDirection == MoveDirection.Idle) {

	var tilePosX = tileX;
	var tilePosY = tileY;

	switch (previousDirection) {
		case MoveDirection.TopLeft:
			tilePosX--;
			tilePosY--;
			break;
		case MoveDirection.TopRight:
			tilePosX++;
			tilePosY--;
			break;
		case MoveDirection.BottomLeft:
			tilePosX--;
			tilePosY++;
			break;
		case MoveDirection.BottomRight:
			tilePosX++;
			tilePosY++;
			break;
		case MoveDirection.Idle:
			// Should be impossible - print it
			show_debug_message("Attempted to Place Spikes when Previous Direction is Idle");
			break;
	}

	if (ds_map_exists(global.inventory, InventoryItem.Spikes)) {
		
		// Make sure the spikes are placed on ground
		if (get_tile(tilePosX, tilePosY) == TileType.Ground) {
	
			// Change the tile
			gmlTilePos = get_tile_position(tilePosX, tilePosY);
			tile = tilemap_get(global.tilesets[3 + gmlTilePos.layer], gmlTilePos.x, gmlTilePos.y);
			tile = tile_set_index(tile, 28);
			tilemap_set(global.tilesets[3 + gmlTilePos.layer], tile, gmlTilePos.x, gmlTilePos.y);
	
			// Remove the spikes from inventory
			if (ds_map_find_value(global.inventory, InventoryItem.Spikes) - 1 > 0)
				ds_map_replace(global.inventory, InventoryItem.Spikes, ds_map_find_value(global.inventory, InventoryItem.Spikes) - 1);
			else
				ds_map_delete(global.inventory, InventoryItem.Spikes);
		}
	}
}