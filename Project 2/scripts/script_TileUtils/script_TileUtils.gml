// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// OUR COORDINATE SYSTEM -
// 00  20  40  60
//   11  31  51
// 02  22  42  62
//   13  33  53

// GMS COORDINATE SYSTEM -
// Layer 1
// 00  10  20  30
//
// 01  11  21  31
//
// Layer 2
//
//   00  10  20
//
//   01  11  21

enum TileType {
	Water, Lava, Spike, Obsticle, Ground, None
}

global.tileWidth = 200;
global.tileHeight = 100;
global.tileTypes = [TileType.Water, TileType.Lava, TileType.Spike, TileType.Obsticle, TileType.Ground];
global.tilesets = [];

function loadTilesets() {
	global.tilesets = [
		layer_tilemap_get_id(layer_get_id("WaterTiles1")),
		layer_tilemap_get_id(layer_get_id("WaterTiles2")),
		layer_tilemap_get_id(layer_get_id("LavaTiles1")),
		layer_tilemap_get_id(layer_get_id("LavaTiles2")),
		layer_tilemap_get_id(layer_get_id("SpikeTiles1")),
		layer_tilemap_get_id(layer_get_id("SpikeTiles2")),
		layer_tilemap_get_id(layer_get_id("ObsticleTiles1")),
		layer_tilemap_get_id(layer_get_id("ObsticleTiles2")),
		layer_tilemap_get_id(layer_get_id("GroundTiles1")),
		layer_tilemap_get_id(layer_get_id("GroundTiles2"))
	];
}


// Returns Struct with TileTypes {topLeft, topRight, bottomLeft, bottomRight}
function get_surrounding_tiles(x, y) {
	return {
		topLeft: get_tile(x - 1, y - 1),
		topRight: get_tile(x + 1, y - 1),
		bottomLeft: get_tile(x - 1, y + 1),
		bottomRight: get_tile(x + 1, y + 1)
	};
}

// Returns Struct with {x: int, y: int, layer: int (1 or 2)}
// Converts from our coordinate system (see above) to Game Maker Studio's Coordinate System
function get_tile_position(x, y) {
	var pos = {x: 0, y: 0, layer: 1};
	if (y % 2 == 0) {
		pos.x = x / 2;
		pos.y = y / 2;
		pos.layer = 1;
	}
	else {
		pos.x = (x - 1) / 2;
		pos.y = (y - 1) / 2;
		pos.layer = 2;
	}
	return pos;
}

// Gets the tile type given the x and y position (GMS Coord System) and the layer (1 or 2)
// This information can be retrieved using get_tile_position
function get_tile_from_coords(x, y, layer) {
	for (var i = 0; i < array_length(global.tileTypes); i++) {
		if (tile_present(x, y, global.tilesets[i*2 + layer-1])) {
			return global.tileTypes[i];
		}
	}
	
	return TileType.None;
}

// Checks if there is a tile present at a given location in the tileset
function tile_present(x, y, tileset) {
	return tilemap_get(tileset, x, y) & tile_index_mask != 0;
}

// Gets a tile type from our coordinate system (see above)
function get_tile(x, y) {
	var pos = get_tile_position(x, y);
	return get_tile_from_coords(pos.x, pos.y, pos.layer);
}