// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

enum MoveDirection {
	TopLeft, TopRight, BottomLeft, BottomRight, Idle
}

// Number of seconds to take to move a single tile
global.tileMovementSpeed = 0.5;

// Checks whether tileType is in movableTileTypes
function can_move_on_tile(tileType, movableTileTypes) {
	for (var i = 0; i < array_length(movableTileTypes); i++) {
		if (movableTileTypes[i] == tileType) return true;
		//Allow moving with powerup (Problem with applying the same function to guards)
		if (object_get_name(object_index) == "obj_player") {
			if(tileType == TileType.Lava){
				if(ds_map_exists(global.inventory, InventoryItem.LavaShoe)){
					var n = ds_map_find_value(global.inventory, InventoryItem.LavaShoe);
					//Powerup of the same tiletype is available
					if(n > 0){
						if(n-1 == 0){
							ds_map_delete(global.inventory, InventoryItem.LavaShoe);
						}else{
							ds_map_replace(global.inventory, InventoryItem.LavaShoe, n-1);
						}
						return true;
					}
				}
			}
			if(tileType == TileType.Water){
				if(ds_map_exists(global.inventory, InventoryItem.WaterShoe)){
					var n = ds_map_find_value(global.inventory, InventoryItem.WaterShoe);
					//Powerup of the same tiletype is available
					if(n > 0){
						if(n-1 == 0){
							ds_map_delete(global.inventory, InventoryItem.WaterShoe);
						}else{
							ds_map_replace(global.inventory, InventoryItem.WaterShoe, n-1);
						}
						return true;
					}
				}
			}
		}
	}
	return false;
}

// OUR COORDINATE SYSTEM -
// 00  20  40  60
//   11  31  51
// 02  22  42  62
//   13  33  53

// Returns struct of {x: Real, y: Real}
function get_screen_coords(tileX, tileY) {
	if (tileY % 2 == 0) {
		return {
			x: global.tileWidth / 2 + global.tileWidth * floor(tileX / 2),
			y: global.tileHeight / 2 + global.tileHeight * floor(tileY / 2)
		};
	}
	else {
		return {
			x: global.tileWidth + global.tileWidth * floor(tileX / 2),
			y: global.tileHeight + global.tileHeight * floor(tileY / 2)
		};
	}
}