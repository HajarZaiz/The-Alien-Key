event_inherited();

var tileCoords = get_tile_coords(x, y);
tileX = tileCoords.x;
tileY = tileCoords.y;

var coords = get_screen_coords(tileX, tileY);
x = coords.x;
y = coords.y;

//patrolling variables
patrolling = true;

patrolIndex = 0;

//Prevent decreasing health repetitively
canDamage = true;

movableTiles = [TileType.Ground];
harmfulTiles = ds_list_create();
ds_list_add(harmfulTiles, TileType.Lava);
ds_list_add(harmfulTiles, TileType.Water);
ds_list_add(harmfulTiles, TileType.Spike);